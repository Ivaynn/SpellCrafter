const SLOT_COUNT = 27;
const TICKS_PER_SECOND = 20;
const DRAG_THRESHOLD = 4;
const POPUP_MARGIN = 8;
const POPUP_GAP = 4;
const POPUP_DELAY = 500;
const COPY_FEEDBACK_DURATION = 1500;

const TYPE_ORDER = ['projectile', 'modifier', 'instant', 'special'];
const TIER_NAMES = ['Common', 'Uncommon', 'Rare', 'Epic', 'Legendary'];
const TYPE_ICONS = { projectile: '→', modifier: '⛶', instant: '✦', special: '⚝' };

const byName = (a, b) => a.displayName.localeCompare(b.displayName);
const SORTS = {
    name: byName,
    type: (a, b) => TYPE_ORDER.indexOf(a.type) - TYPE_ORDER.indexOf(b.type) || byName(a, b),
    tier: (a, b) => a.tier - b.tier || byName(a, b),
};

const toHearts = health => health / 2;
const toBlocksPerSecond = speed => speed * 5;
const signed = value => (value > 0 ? '+' : '') + value;
const statItem = (label, value, unit = '') =>
    `<li>${label}: <span class="value">${value}</span> <span class="unit">${unit}</span></li>`;
const STATS = {
    damage: value => statItem('Damage', `${toHearts(value)} ❤`),
    heal: value => statItem('Heal', `${toHearts(value)} ❤`),
    range: value => statItem('Range', value, 'blocks'),
    speed: value => statItem('Speed', toBlocksPerSecond(value), 'blocks/s'),
    damage_mod: value => statItem('Damage', `${signed(toHearts(value))} ❤`),
    range_mod: value => statItem('Range', signed(value), 'blocks'),
    speed_mod: value => statItem('Speed', signed(toBlocksPerSecond(value)), 'blocks/s'),
};

const CODE_VERSION = 1;
const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
const HEADER_WIDTHS = { version: 1, mana: 2, cooldown: 2, cap: 1, skin: 2, mod: 2 };
const SPELL_WIDTH = 2;
const CODE_LENGTH = Object.values(HEADER_WIDTHS).reduce((sum, width) => sum + width) + SLOT_COUNT * SPELL_WIDTH;

const clamp = (value, min, max) => Math.min(Math.max(value, min), max);
const iconUrl = spell => `assets/spell/${spell.name}.png`;

const cardGrid = document.getElementById('cards');
const search = document.getElementById('search');
const sort = document.getElementById('sort');
const orderToggle = document.getElementById('order-toggle');
const viewToggle = document.getElementById('view-toggle');
const themeToggle = document.getElementById('theme-toggle');
const editorToggle = document.getElementById('editor-toggle');
const slotGrid = document.getElementById('slots');
const wandCode = document.getElementById('wand-code');
const copyCode = document.getElementById('copy-code');
const wandCap = document.getElementById('wand-cap');

let allSpells = [];
let reversed = false;
let drag = null;
const wand = {
    version: CODE_VERSION,
    mana: 0,
    cooldown: 0,
    cap: SLOT_COUNT,
    skin: 0,
    mod: 0,
    spells: Array(SLOT_COUNT).fill(null),
};

const spellById = id => allSpells.find(spell => spell.id === id);

function detailsHtml(spell) {
    const stats = Object.entries(spell.stats ?? {})
        .map(([key, value]) => STATS[key](value))
        .join('');
    return `
        <div class="details tier-${spell.tier} type-${spell.type}">
            <header>
                <h2>${spell.displayName}</h2>
                <div class="cost">
                    <span class="mana" title="Mana">◆ ${spell.mana}</span>
                    <span title="Cooldown">◷ ${spell.cooldown / TICKS_PER_SECOND}</span>
                </div>
            </header>
            <p>${spell.description.join(' ')}</p>
            ${stats ? `<ul class="stats">${stats}</ul>` : ''}
            <footer>
                <span class="type">${TYPE_ICONS[spell.type]} ${spell.type}</span>
                <span class="rarity">${TIER_NAMES[spell.tier - 1]}</span>
            </footer>
        </div>`;
}

function createCard(spell) {
    const card = document.createElement('article');
    card.className = 'card';
    card.innerHTML = `<img class="icon" src="${iconUrl(spell)}" alt="" draggable="false">${detailsHtml(spell)}`;
    card.addEventListener('pointerdown', event => beginDrag(event, spell));
    attachPopup(card, () => document.body.classList.contains('compact'));
    return card;
}

function attachPopup(anchor, isEnabled = () => true) {
    let timer;
    anchor.addEventListener('mouseenter', () => {
        if (!isEnabled()) return;
        timer = setTimeout(() => {
            anchor.classList.add('popup-open');
            placePopup(anchor);
        }, POPUP_DELAY);
    });
    anchor.addEventListener('mouseleave', () => {
        clearTimeout(timer);
        anchor.classList.remove('popup-open');
    });
}

function placePopup(anchor) {
    const popup = anchor.querySelector('.details');
    if (!popup) return;
    const { clientWidth, clientHeight } = document.documentElement;
    const { left, right, bottom } = anchor.getBoundingClientRect();
    const center = (left + right) / 2;
    const x = clamp(center - popup.offsetWidth / 2, POPUP_MARGIN, clientWidth - popup.offsetWidth - POPUP_MARGIN);
    const y = Math.min(bottom + POPUP_GAP, clientHeight - popup.offsetHeight - POPUP_MARGIN);
    popup.style.left = `${x}px`;
    popup.style.top = `${y}px`;
}

function renderCards() {
    const query = search.value.trim().toLowerCase();
    const shown = allSpells
        .filter(spell => spell.displayName.toLowerCase().includes(query))
        .sort(SORTS[sort.value]);
    if (reversed) shown.reverse();
    cardGrid.replaceChildren(...shown.map(spell => spell.card));
}

search.addEventListener('input', renderCards);
sort.addEventListener('change', renderCards);
orderToggle.addEventListener('click', () => {
    reversed = !reversed;
    orderToggle.classList.toggle('reversed', reversed);
    renderCards();
});
viewToggle.addEventListener('click', () => document.body.classList.toggle('compact'));
editorToggle.addEventListener('click', () => document.body.classList.toggle('editing'));
themeToggle.addEventListener('click', () => {
    const theme = document.documentElement.dataset.theme === 'light' ? 'dark' : 'light';
    document.documentElement.dataset.theme = theme;
    localStorage.setItem('theme', theme);
});

const slots = Array.from({ length: SLOT_COUNT }, (_, index) => {
    const slot = document.createElement('div');
    slot.className = 'slot';
    slot.addEventListener('pointerdown', event => {
        if (wand.spells[index]) beginDrag(event, wand.spells[index], index);
    });
    attachPopup(slot);
    return slot;
});
slotGrid.append(...slots);

function renderSlots() {
    slots.forEach((slot, index) => {
        const spell = wand.spells[index];
        slot.innerHTML = spell ? `<img src="${iconUrl(spell)}" alt="">${detailsHtml(spell)}` : '';
        slot.classList.toggle('locked', index >= wand.cap);
        slot.classList.toggle('lifted', drag?.fromSlot === index);
    });
    wandCode.value = encodeWand();
    wandCode.classList.remove('invalid');
    wandCap.value = wand.cap;
    const openSlot = slots.find(slot => slot.classList.contains('popup-open'));
    if (openSlot) placePopup(openSlot);
}

function beginDrag(event, spell, fromSlot = null) {
    if (!document.body.classList.contains('editing') || event.button !== 0) return;
    event.preventDefault();
    drag = { spell, fromSlot, startX: event.clientX, startY: event.clientY, ghost: null };
}

function createGhost(spell) {
    const ghost = document.createElement('img');
    ghost.className = 'ghost';
    ghost.src = iconUrl(spell);
    ghost.style.width = `${slots[0].clientWidth}px`;
    document.body.append(ghost);
    return ghost;
}

function drop(event) {
    const { spell, fromSlot } = drag;
    const target = document.elementFromPoint(event.clientX, event.clientY);
    const toSlot = slots.indexOf(target?.closest('.slot'));
    if (toSlot >= 0 && toSlot < wand.cap) {
        if (fromSlot !== null) wand.spells[fromSlot] = wand.spells[toSlot];
        wand.spells[toSlot] = spell;
        return;
    }
    if (fromSlot !== null) wand.spells[fromSlot] = null;
    if (target === search) {
        search.value = spell.displayName;
        renderCards();
    }
}

function endDrag() {
    if (!drag) return;
    const { ghost } = drag;
    drag = null;
    if (!ghost) return;
    ghost.remove();
    document.body.classList.remove('dragging');
    renderSlots();
}

document.addEventListener('pointermove', event => {
    if (!drag) return;
    if (!drag.ghost) {
        if (Math.hypot(event.clientX - drag.startX, event.clientY - drag.startY) < DRAG_THRESHOLD) return;
        drag.ghost = createGhost(drag.spell);
        document.body.classList.add('dragging');
        renderSlots();
    }
    drag.ghost.style.left = `${event.clientX}px`;
    drag.ghost.style.top = `${event.clientY}px`;
});
document.addEventListener('pointerup', event => {
    if (drag?.ghost) drop(event);
    endDrag();
});
document.addEventListener('pointercancel', endDrag);

function encodeNumber(value, width) {
    let text = '';
    for (let i = 0; i < width; i++) {
        text = ALPHABET[value % ALPHABET.length] + text;
        value = Math.floor(value / ALPHABET.length);
    }
    return text;
}

function decodeNumber(text) {
    let value = 0;
    for (const char of text) value = value * ALPHABET.length + ALPHABET.indexOf(char);
    return value;
}

function encodeWand() {
    const headerCode = Object.entries(HEADER_WIDTHS).map(([field, width]) => encodeNumber(wand[field], width));
    const spellsCode = wand.spells.map(spell => encodeNumber(spell?.id ?? 0, SPELL_WIDTH));
    return headerCode.join('') + spellsCode.join('');
}

function parseWandCode(code) {
    if (code.length !== CODE_LENGTH || [...code].some(char => !ALPHABET.includes(char))) return null;
    let position = 0;
    const read = width => {
        const chunk = code.slice(position, position + width);
        position += width;
        return decodeNumber(chunk);
    };
    const header = Object.fromEntries(Object.entries(HEADER_WIDTHS).map(([field, width]) => [field, read(width)]));
    const ids = Array.from({ length: SLOT_COUNT }, () => read(SPELL_WIDTH));
    const knownIds = ids.every(id => id === 0 || spellById(id));
    if (header.version !== CODE_VERSION || header.cap > SLOT_COUNT || !knownIds) return null;
    const spells = ids.map((id, index) => (index < header.cap && id !== 0 ? spellById(id) : null));
    return { ...header, spells };
}

wandCode.addEventListener('change', () => {
    const parsed = parseWandCode(wandCode.value.trim());
    if (parsed) {
        Object.assign(wand, parsed);
        renderSlots();
    } else {
        wandCode.classList.add('invalid');
    }
});
copyCode.addEventListener('click', async () => {
    await navigator.clipboard.writeText(wandCode.value);
    copyCode.classList.add('copied');
    setTimeout(() => copyCode.classList.remove('copied'), COPY_FEEDBACK_DURATION);
});
wandCap.addEventListener('change', () => {
    wand.cap = clamp(Math.round(Number(wandCap.value)), 0, SLOT_COUNT);
    wand.spells = wand.spells.map((spell, index) => (index < wand.cap ? spell : null));
    renderSlots();
});

renderSlots();
fetch('assets/spells.json')
    .then(response => response.json())
    .then(spells => {
        allSpells = spells;
        for (const spell of allSpells) spell.card = createCard(spell);
        renderCards();
    });
