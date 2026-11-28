const SLOT_COUNT = 27;
const CODE_VERSION = 1;
const CODE_LENGTH = 64;
const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
const TYPE_ORDER = ['projectile', 'modifier', 'instant', 'special'];
const STAT_MAX = 64 * 64 - 1; // Base mana and cooldown are stored in two code characters
const SKINS = ['stick', 'classic', 'ice', 'fire', 'baguetti', 'obsidian', 'light', 'gem', 'zeus', 'leaf', 'moon']; // Same order as the datapack's skin ids

const languageButton = document.getElementById('language-button');
const languageMenu = document.getElementById('language-menu');
const editorToggle = document.getElementById('editor-toggle');
const editorLabel = document.getElementById('editor-label');
const themeToggle = document.getElementById('theme-toggle');
const compactToggle = document.getElementById('compact-toggle');
const codeInput = document.getElementById('code');
const copyButton = document.getElementById('copy-code');
const resetButton = document.getElementById('reset');
const settingsButton = document.getElementById('settings-button');
const settings = document.getElementById('settings');
const settingsClose = document.getElementById('settings-close');
const skinGrid = document.getElementById('skins');
const slotCapInput = document.getElementById('slot-cap');
const manaInput = document.getElementById('mana');
const cooldownInput = document.getElementById('cooldown');
const statButtons = settings.querySelectorAll('[data-stat]');
const modifierSelect = document.getElementById('modifier');
const modifierIcon = document.getElementById('modifier-icon');
const slotGrid = document.getElementById('slots');
const countLabel = document.getElementById('count');
const capLabel = document.getElementById('cap');
const searchInput = document.getElementById('search');
const searchClear = document.getElementById('search-clear');
const list = document.getElementById('list');
const dragImage = document.getElementById('drag-image');
const popup = document.getElementById('popup');

let spells = [];
let english = {};
let translations = {};
let wand = newWand();
let held = null;
let pinned = null;  // { spell, anchor } popup that stays until the next click
let hovered = null; // { spell, anchor } popup shown while the mouse is over it
const slots = [];

function newWand() {
    return {
        mana: 0,
        cooldown: 0,
        cap: SLOT_COUNT,
        skin: 0,
        mod: 0,
        spells: Array(SLOT_COUNT).fill(null),
    };
}

async function loadJson(url) {
    const response = await fetch(url);
    return response.json();
}

function translate(key) {
    return translations[key] || english[key] || '';
}

function spellName(spell) {
    return translate(`spellcrafter.spell.${spell.name}.name`);
}

function spellDescription(spell) {
    const lines = [];
    for (let i = 1; i <= spell.description.length; i++) {
        lines.push(translate(`spellcrafter.spell.${spell.name}.description.${i}`));
    }
    return lines.join(' ');
}

function findSpell(id) {
    return spells.find(spell => spell.id === id);
}

function spellCount() {
    return wand.spells.filter(spell => spell !== null).length;
}

function isEditing() {
    return document.documentElement.classList.contains('editing');
}

function iconUrl(spell) {
    return `assets/spell/${spell.name}.png`;
}

function icon(name) {
    return `<svg class="icon"><use href="#icon-${name}" /></svg>`;
}

function clamp(value, min, max) {
    return Math.min(Math.max(value, min), max);
}

function signed(value) {
    return value > 0 ? '+' + value : String(value);
}

function seconds(ticks) {
    const value = ticks / 20;
    if (value === 0) return '0';
    return Number.isInteger(value) ? value.toFixed(1) : String(value);
}


function encode(number, length) {
    let text = '';
    for (let i = 0; i < length; i++) {
        text = ALPHABET[number % 64] + text;
        number = Math.floor(number / 64);
    }
    return text;
}

function decode(text) {
    let number = 0;
    for (const char of text) {
        number = number * 64 + ALPHABET.indexOf(char);
    }
    return number;
}

function exportCode() {
    let code = encode(CODE_VERSION, 1)
        + encode(wand.mana, 2)
        + encode(wand.cooldown, 2)
        + encode(wand.cap, 1)
        + encode(wand.skin, 2)
        + encode(wand.mod, 2);

    for (const spell of wand.spells) {
        code += encode(spell ? spell.id : 0, 2);
    }
    return code;
}

function importCode(code) {
    if (code.length !== CODE_LENGTH) return null;
    for (const char of code) {
        if (!ALPHABET.includes(char)) return null;
    }

    const read = (start, length) => decode(code.slice(start, start + length));
    if (read(0, 1) !== CODE_VERSION) return null;

    const imported = {
        mana: read(1, 2),
        cooldown: read(3, 2),
        cap: read(5, 1),
        skin: read(6, 2),
        mod: read(8, 2),
        spells: [],
    };

    for (let slot = 0; slot < SLOT_COUNT; slot++) {
        const id = read(10 + slot * 2, 2);
        const spell = findSpell(id);
        if (id !== 0 && !spell) return null;
        imported.spells.push(spell || null);
    }
    return imported;
}


function stat(name, value, unit = '') {
    const label = translate(`spellcrafter.stat.${name}.name`);
    return `<li>${label}: <b>${value}</b> <span>${unit}</span></li>`;
}

function unit(name) {
    return translate(`spellcrafter.stat.${name}.unit`);
}

function statsHtml(spell) {
    const stats = spell.stats || {};
    let html = '';
    if ('damage' in stats) html += stat('damage', stats.damage / 2 + ' ❤');
    if ('range' in stats) html += stat('range', stats.range, unit('range'));
    if ('speed' in stats) html += stat('speed', stats.speed * 5, unit('speed'));
    if ('damage_mod' in stats) html += stat('damage', signed(stats.damage_mod / 2) + ' ❤');
    if ('range_mod' in stats) html += stat('range', signed(stats.range_mod), unit('range'));
    if ('speed_mod' in stats) html += stat('speed', signed(stats.speed_mod * 5), unit('speed'));
    if ('heal' in stats) html += stat('heal', stats.heal / 2 + ' ❤');
    return html;
}

function cardHtml(spell) {
    return `
        <div class="card-head">
            <img src="${iconUrl(spell)}" alt="" draggable="false">
            <div>
                <b class="name tier-${spell.tier}">${spellName(spell)}</b>
                <div class="cost">
                    <span class="mana">◆ ${spell.mana}</span>
                    <span>${icon('clock')} ${seconds(spell.cooldown)}</span>
                </div>
            </div>
        </div>
        <p>${spellDescription(spell)}</p>
        <ul class="stats">${statsHtml(spell)}</ul>`;
}

function createCard(spell) {
    const card = document.createElement('div');
    card.className = 'card';
    card.draggable = isEditing();
    card.addEventListener('dragstart', event => startDrag(event, spell, null));
    return card;
}

// Lowercase without accents, so "missil" matches "Míssil" (ł has no accent to strip, so it's mapped by hand)
function searchable(text) {
    return text.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').replaceAll('ł', 'l');
}

function renderList() {
    const query = searchable(searchInput.value.trim());
    const shown = spells.filter(spell =>
        searchable(spellName(spell)).includes(query) ||
        searchable(spellDescription(spell)).includes(query)
    );
    list.replaceChildren(...shown.map(spell => spell.card));
    searchClear.hidden = searchInput.value === '';
}


function renderWand() {
    wand.spells.forEach((spell, index) => {
        const slot = slots[index];
        slot.innerHTML = spell ? `<img src="${iconUrl(spell)}" alt="" draggable="false">` : '';
        slot.draggable = spell !== null;
    });

    const count = spellCount();
    slotGrid.classList.toggle('full', count >= wand.cap);
    countLabel.textContent = count;
    countLabel.classList.toggle('warning', count > wand.cap);
    capLabel.textContent = wand.cap;

    const code = exportCode();
    codeInput.value = code;
    codeInput.classList.remove('invalid');
    localStorage.setItem('wand', code);
    renderSettings();
}

function renderSettings() {
    skinButtons.forEach((button, index) => button.classList.toggle('current', index === wand.skin));
    slotCapInput.value = wand.cap;
    manaInput.value = wand.mana;
    cooldownInput.value = seconds(wand.cooldown);

    // A step past a limit stops at it, so a button is only disabled when it can't move its stat its way
    for (const button of statButtons) {
        const name = button.dataset.stat;
        const delta = Number(button.dataset.delta);
        const next = clamp(wand[name] + delta, ...statRange(name));
        button.disabled = delta < 0 ? next >= wand[name] : next <= wand[name];
    }

    // A code can hold a spell that can't be a wand modifier: the select and icon are then left blank
    modifierSelect.value = wand.mod;
    const modifier = findSpell(wand.mod);
    modifierIcon.innerHTML = modifier?.wandModifier ? `<img src="${iconUrl(modifier)}" alt="" draggable="false">` : '';
}

// The spells a wand can hold as its modifier, grouped by type and sorted by name
function renderModifierOptions() {
    const none = new Option(translate('spellcrafter.wand.empty'), 0);
    const groups = TYPE_ORDER.map(type => {
        const options = spells
            .filter(spell => spell.wandModifier && spell.type === type)
            .map(spell => new Option(spellName(spell), spell.id))
            .sort((a, b) => a.text.localeCompare(b.text, document.documentElement.lang));
        const group = document.createElement('optgroup');
        group.label = translate(`spellcrafter.type.${type}`);
        group.append(...options);
        return group;
    });
    modifierSelect.replaceChildren(none, ...groups.filter(group => group.children.length));
}

function hold(spell, fromSlot) {
    release();
    held = { spell, fromSlot };
    const element = fromSlot === null ? spell.card : slots[fromSlot];
    element.classList.add('selected');
}

function release() {
    held = null;
    for (const element of document.querySelectorAll('.selected')) {
        element.classList.remove('selected');
    }
}

// Placing on a slot moves the spell, between slots cancels, anywhere else removes it
function placeHeld(target) {
    const slot = target.closest('.slot');
    if (slot) {
        dropOnSlot(slots.indexOf(slot));
    } else if (held.fromSlot !== null && !slotGrid.contains(target)) {
        wand.spells[held.fromSlot] = null;
    }
    release();
    renderWand();
}

function startDrag(event, spell, fromSlot) {
    hidePopup();
    hold(spell, fromSlot);
    document.documentElement.classList.add('dragging');
    event.dataTransfer.setData('text/plain', spell.name);

    const sprite = event.currentTarget.querySelector('img');
    const size = sprite.offsetWidth;
    dragImage.width = size;
    dragImage.height = size;

    const context = dragImage.getContext('2d');
    context.imageSmoothingEnabled = false;
    context.drawImage(sprite, 0, 0, size, size);
    event.dataTransfer.setDragImage(dragImage, size / 2, size / 2);
}

function dropOnSlot(toSlot) {
    const { spell, fromSlot } = held;

    if (fromSlot === null) {
        const isFull = spellCount() >= wand.cap;
        if (isFull && wand.spells[toSlot] === null) return;
    } else {
        wand.spells[fromSlot] = wand.spells[toSlot];
    }
    wand.spells[toSlot] = spell;
}

function isCompact() {
    return document.documentElement.classList.contains('compact');
}

// The spell under an element that can show a popup: a filled slot, or an icon in compact mode
function popupTarget(element) {
    const slot = element.closest('.slot');
    const slotSpell = wand.spells[slots.indexOf(slot)];
    if (slotSpell) return { spell: slotSpell, anchor: slot };

    const card = element.closest('#list .card');
    if (card && isCompact()) return { spell: spells.find(spell => spell.card === card), anchor: card };
    return null;
}

function pin(target) {
    pinned = target;
    hovered = null;
    updatePopup();
}

function hidePopup() {
    pinned = null;
    hovered = null;
    updatePopup();
}

// A pinned popup wins; hover popups only show while nothing is pinned
function updatePopup() {
    const shown = pinned || hovered;
    popup.hidden = !shown;
    if (!shown) return;
    popup.innerHTML = cardHtml(shown.spell);
    placePopup(shown.anchor);
}

// Below the anchor if it fits, else above, else beside it, always kept on screen
function placePopup(anchor) {
    const margin = 16;
    const gap = 8;
    const box = anchor.getBoundingClientRect();
    const width = popup.offsetWidth;
    const height = popup.offsetHeight;
    const viewWidth = document.documentElement.clientWidth;
    const viewHeight = document.documentElement.clientHeight;

    let x = box.left + (box.width - width) / 2;
    let y;
    if (viewHeight - box.bottom - gap - margin >= height) {
        y = box.bottom + gap;
    } else if (box.top - gap - margin >= height) {
        y = box.top - gap - height;
    } else {
        y = box.top + (box.height - height) / 2;
        x = viewWidth - box.right >= box.left ? box.right + gap : box.left - gap - width;
    }
    popup.style.left = clamp(x, margin, viewWidth - width - margin) + 'px';
    popup.style.top = clamp(y, margin, viewHeight - height - margin) + 'px';
}

for (let index = 0; index < SLOT_COUNT; index++) {
    const slot = document.createElement('div');
    slot.className = 'slot';
    slot.addEventListener('dragstart', event => startDrag(event, wand.spells[index], index));
    slots.push(slot);
}
slotGrid.append(...slots);

const skinButtons = SKINS.map((name, index) => {
    const button = document.createElement('button');
    button.type = 'button';
    button.innerHTML = `<img src="assets/wand/${name}.png" alt="" draggable="false">`;
    button.addEventListener('click', () => {
        wand.skin = index;
        renderWand();
    });
    return button;
});
skinGrid.append(...skinButtons);


// Right click, or a long press on touch screens, pins a spell's popup until the next click outside it
const LONG_PRESS_MS = 500;
let pressTimer = null;
let pressStart = null;
let longPressed = false;

function cancelPress() {
    clearTimeout(pressTimer);
    pressStart = null;
}

document.addEventListener('pointerdown', event => {
    cancelPress();
    longPressed = false;
    if (popup.contains(event.target)) return;
    hidePopup();

    const target = event.pointerType === 'touch' && popupTarget(event.target);
    if (!target) return;
    pressStart = { x: event.clientX, y: event.clientY };
    pressTimer = setTimeout(() => {
        longPressed = true;
        pin(target);
    }, LONG_PRESS_MS);
});

document.addEventListener('pointermove', event => {
    if (pressStart && Math.hypot(event.clientX - pressStart.x, event.clientY - pressStart.y) > 10) cancelPress();
});
document.addEventListener('pointerup', cancelPress);
document.addEventListener('pointercancel', cancelPress);
document.addEventListener('dragstart', cancelPress);

document.addEventListener('contextmenu', event => {
    const target = popupTarget(event.target);
    if (!target) return;
    event.preventDefault();
    pin(target);
});

// The click that ends a long press shouldn't also select or place a spell
document.addEventListener('click', event => {
    if (!longPressed) return;
    longPressed = false;
    event.preventDefault();
    event.stopPropagation();
}, true);

// No hover popups while one is pinned, or while a button is held (so one can't pop up under a dragged spell)
document.addEventListener('pointerover', event => {
    if (pinned || event.pointerType !== 'mouse' || event.buttons) return;
    const target = popupTarget(event.target);
    if (target?.anchor === hovered?.anchor) return;
    hovered = target;
    updatePopup();
});

document.addEventListener('pointerout', event => {
    if (event.pointerType !== 'mouse' || event.relatedTarget || !hovered) return;
    hovered = null;
    updatePopup();
});

document.addEventListener('keydown', event => {
    if (event.key === 'Escape') hidePopup();
});
document.addEventListener('scroll', hidePopup, true);
window.addEventListener('resize', hidePopup);

document.addEventListener('click', event => {
    if (!isEditing() || !event.target.closest('.wand, main') || event.target.closest('button, input')) return;

    const slot = event.target.closest('.slot');
    const index = slots.indexOf(slot);
    const card = event.target.closest('.card');
    const cardSpell = spells.find(spell => spell.card === card);

    if (!held) {
        if (slot && wand.spells[index]) {
            hold(wand.spells[index], index);
        } else if (cardSpell) {
            hold(cardSpell, null);
        }
    } else if (cardSpell && held.fromSlot === null && cardSpell !== held.spell) {
        hold(cardSpell, null);
    } else {
        placeHeld(event.target);
    }
});

document.addEventListener('dragover', event => {
    if (!held) return;
    event.preventDefault();
    const target = event.target.closest('.slot');
    for (const slot of slots) {
        slot.classList.toggle('target', slot === target);
    }
});

document.addEventListener('drop', event => {
    if (!held) return;
    event.preventDefault();
    placeHeld(event.target);
});

document.addEventListener('dragend', () => {
    document.documentElement.classList.remove('dragging');
    release();
    for (const slot of slots) {
        slot.classList.remove('target');
    }
});


function pickLanguage(languages) {
    const saved = localStorage.getItem('language');
    if (languages.includes(saved)) return saved;

    const browser = navigator.language.toLowerCase().replace('-', '_');
    if (languages.includes(browser)) return browser;

    const sameLanguage = languages.find(code => code.split('_')[0] === browser.split('_')[0]);
    return sameLanguage || 'en_us';
}

async function setLanguage(code) {
    translations = await loadJson(`assets/lang/${code}.json`);
    localStorage.setItem('language', code);
    for (const item of languageMenu.children) {
        item.classList.toggle('current', item.textContent === code);
    }
    document.documentElement.lang = code.replace('_', '-');
    editorLabel.textContent = translate('spellcrafter.table.name');
    for (const element of document.querySelectorAll('[data-text]')) {
        element.textContent = translate(element.dataset.text);
    }

    for (const spell of spells) {
        spell.card.innerHTML = cardHtml(spell);
    }
    renderList();
    renderModifierOptions();
    renderSettings();
}

languageMenu.addEventListener('beforetoggle', event => {
    if (event.newState !== 'open') return;
    const button = languageButton.getBoundingClientRect();
    languageMenu.style.top = button.bottom + 8 + 'px';
    languageMenu.style.right = window.innerWidth - button.right + 'px';
});

themeToggle.addEventListener('click', () => {
    const theme = document.documentElement.dataset.theme === 'light' ? 'dark' : 'light';
    document.documentElement.dataset.theme = theme;
    localStorage.setItem('theme', theme);
});

compactToggle.addEventListener('click', () => {
    const compact = document.documentElement.classList.toggle('compact');
    localStorage.setItem('compact', compact);
});

editorToggle.addEventListener('click', () => {
    const editing = document.documentElement.classList.toggle('editing');
    localStorage.setItem('editing', editing);
    release();
    for (const spell of spells) {
        spell.card.draggable = editing;
    }
});

codeInput.addEventListener('input', () => {
    const code = codeInput.value.replace(/\s/g, '');
    const imported = importCode(code);
    if (imported) {
        wand = imported;
        release();
        renderWand();
    } else {
        codeInput.classList.toggle('invalid', code !== '');
    }
});

// Copies the current wand's code and briefly shows a check mark
let copiedTimer = null;
copyButton.addEventListener('click', async () => {
    try {
        await navigator.clipboard.writeText(exportCode());
    } catch {
        codeInput.select(); // Clipboard blocked: select the code so it can be copied by hand
        return;
    }
    copyButton.classList.add('copied');
    clearTimeout(copiedTimer);
    copiedTimer = setTimeout(() => copyButton.classList.remove('copied'), 1500);
});

// First click arms the button, second click resets the wand to the default one
resetButton.addEventListener('click', () => {
    if (!resetButton.classList.contains('armed')) {
        resetButton.classList.add('armed');
        return;
    }
    disarmReset();
    wand = newWand();
    release();
    renderWand();
});

function disarmReset() {
    resetButton.classList.remove('armed');
}

resetButton.addEventListener('blur', disarmReset);
document.addEventListener('pointerdown', event => {
    if (!resetButton.contains(event.target)) disarmReset();
});

settingsButton.addEventListener('click', () => {
    release();
    hidePopup();
    settings.showModal();
});

settingsClose.addEventListener('click', () => settings.close());

// Clicks on the backdrop close the dialog, unless the press started inside it (like selecting text in a field)
let pressedBackdrop = false;
settings.addEventListener('pointerdown', event => {
    pressedBackdrop = event.target === settings;
});
settings.addEventListener('click', event => {
    if (pressedBackdrop && event.target === settings) settings.close();
});

// The slot cap can't drop below the spells already on the wand
function statRange(name) {
    return name === 'cap' ? [spellCount(), SLOT_COUNT] : [0, STAT_MAX];
}

// Typed values that aren't numbers are dropped, and the field goes back to the current value
function setStat(name, value) {
    if (!Number.isNaN(value)) wand[name] = clamp(value, ...statRange(name));
    renderWand();
}

slotCapInput.addEventListener('change', () => setStat('cap', parseInt(slotCapInput.value)));
manaInput.addEventListener('change', () => setStat('mana', parseInt(manaInput.value)));

// Shown in seconds, stored in ticks
cooldownInput.addEventListener('change', () => {
    setStat('cooldown', Math.round(parseFloat(cooldownInput.value.replace(',', '.')) * 20));
});

for (const button of statButtons) {
    button.addEventListener('click', () => {
        const name = button.dataset.stat;
        setStat(name, wand[name] + Number(button.dataset.delta));
    });
}

modifierSelect.addEventListener('change', () => {
    wand.mod = Number(modifierSelect.value);
    renderWand();
});

searchInput.addEventListener('input', renderList);

// Leave focus where it was instead of moving it to the button
searchClear.addEventListener('mousedown', event => event.preventDefault());

searchClear.addEventListener('click', () => {
    searchInput.value = '';
    renderList();
});


async function start() {
    spells = await loadJson('assets/spells.json');
    spells.sort((a, b) => TYPE_ORDER.indexOf(a.type) - TYPE_ORDER.indexOf(b.type) || a.id - b.id);
    english = await loadJson('assets/lang/en_us.json');

    const response = await fetch('assets/lang/languages.txt');
    const languages = (await response.text()).trim().split(/\s+/);
    for (const code of languages) {
        const item = document.createElement('button');
        item.textContent = code;
        item.addEventListener('click', () => {
            setLanguage(code);
            languageMenu.hidePopover();
        });
        languageMenu.append(item);
    }

    for (const spell of spells) {
        spell.card = createCard(spell);
    }

    await setLanguage(pickLanguage(languages));
    wand = importCode(localStorage.getItem('wand') || '') || newWand();
    renderWand();
}

start();
