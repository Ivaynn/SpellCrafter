
from pathlib import Path
from utils import read_json, save_json


def main() -> None:
    datapack_root = Path('../datapack')

    # https://github.com/PrismarineJS/minecraft-data/blob/master/data/pc/1.21.6/blocks.json
    data: list[dict] = read_json('blocks.json')


    # Blocks without bbox to be considered "air" for raycasting
    air_block_tag = {'values': []}
    for block in data:
        if block.get('boundingBox', None) == 'empty':
            air_block_tag['values'].append('minecraft:'+ block['name'])
    save_json(air_block_tag, datapack_root / 'data/spellcrafter/tags/block/air.json')


    # Different "breakable" tiers for explosion intensities (le=Lower than or Equals to X)
    explode_small = {'values': []}
    explode_large = {'values': ["#spellcrafter:explode_small"]}

    for block in data:
        if not block.get('diggable', False):
            continue
        resistance = block.get('resistance', 3_600_000)
        if resistance <= 5:
            explode_small['values'].append('minecraft:' + block['name'])
        elif resistance <= 10:
            explode_large['values'].append('minecraft:' + block['name'])

    save_json(explode_small, datapack_root / 'data/spellcrafter/tags/block/explode_small.json')
    save_json(explode_large, datapack_root / 'data/spellcrafter/tags/block/explode_large.json')


if __name__ == '__main__':
    main()
