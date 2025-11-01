
from pathlib import Path
from utils import read_json, save_json


def main() -> None:
    datapack_root = Path('../datapack')

    # https://github.com/PrismarineJS/minecraft-data/blob/master/data/pc/1.21.6/blocks.json
    data: list[dict] = read_json('blocks.json')

    block_tag = {'values': []}

    for block in data:
        if block.get('boundingBox',None) == 'empty':
            block_tag['values'].append('minecraft:'+block['name'])
    
    save_json(block_tag, datapack_root / 'data/spellcrafter/tags/block/air.json')


if __name__ == '__main__':
    main()
