
from pathlib import Path
from utils import read_json, save_json


def main() -> None:
    datapack_root = Path('../datapack')

    # https://github.com/PrismarineJS/minecraft-data/blob/master/data/pc/26.1/blocks.json
    block_data: list[dict] = read_json('blocks.json')
    shape_data: dict[str,dict] = read_json('blockCollisionShapes.json')

    # Blocks without bbox to be considered "air" for raycasting
    air_block_tag = {'values': []}
    for block in block_data:
        if block.get('boundingBox', None) == 'empty':
            air_block_tag['values'].append('minecraft:'+ block['name'])
            continue

        shape_ids = shape_data['blocks'][block['name']]
        shape_ids = [shape_ids] if isinstance(shape_ids, int) else shape_ids

        volume = 0

        for shape_id in shape_ids:
            for bbox in shape_data['shapes'][str(shape_id)]:
                volume += (bbox[3] * bbox[4] * bbox[5])

        if volume < 0.25:
            air_block_tag['values'].append('minecraft:'+ block['name'])

    save_json(air_block_tag, datapack_root / 'data/spellcrafter/tags/block/air.json')


    # Different "breakable" tiers for explosion intensities (le=Lower than or Equals to X)
    explode_small = {'values': []}
    explode_large = {'values': ["#spellcrafter:explode_small"]}

    for block in block_data:
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
