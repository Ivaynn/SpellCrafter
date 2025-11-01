
import json
from pathlib import Path

def read_json(file_path: Path|str):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data

def save_json(data: dict|list, file_path: Path|str, indent=None):
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=indent, ensure_ascii=False)

def read_text(file_path: Path|str):
    with open(file_path, 'r', encoding='utf-8') as f:
        text = f.read()
    return text

def save_text(text: str, file_path: Path|str):
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(text)
