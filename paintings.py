'''
-------------------------
   file: paintings.py
project: Paintings Script
 author: Vexnos
   date: 2026-02-01
-------------------------
'''
#-------Libraries-------
import json

#-------Functions-------
def import_json(path: str) -> dict | None:
    try:
        with open(path, "r") as file:
            result: dict = json.load(file)
        return result
    except FileNotFoundError:
        print(f"Error! File at {path} does not exist!")
    except json.JSONDecodeError:
        print(f'Error! File at {path} contains invalid json!')

def export_json(path: str, contents: dict) -> None:
    with open(path, "w") as file:
        json.dump(contents, file, indent=4)
    print(f"Successfully exported data to {path}")

def to_painting(metadata: dict, title_color: str | None = None, author_color: str | None = None) -> dict:
    return {
        "asset_id": f"art:{metadata['id']}",
        "width": metadata["width"],
        "height": metadata["height"],
        "title": {
            "text": metadata["title"],
            "color": title_color if title_color is not None else "yellow"
        },
        "author": {
            "text": metadata["author"],
            "color": author_color if author_color is not None else "gray"
        }
    }

def to_recipe(metadata: dict) -> dict:
    return {
        "type": "minecraft:stonecutting",
        "ingredient": "minecraft:painting",
        "result": {
            "components": {
                "minecraft:painting/variant": f"art:{metadata['id']}"
            },
            "count": 1,
            "id": "minecraft:painting"
        }
    }

def main() -> None:
    painting_metadata: dict | None = import_json("paintings.json")
    resource_path: dict | None = import_json("resource_path.json")

    if painting_metadata is not None:
        language_metadata: dict = {}

        function_lines: list[str] = ["#\n# Description: Give painting based on trigger value\n# Called by: art:main_1s\n# Entity @s: player\n#\n# Check if painting has been cleared\n#\nexecute store result score @s painting_cleared run clear @s painting 1\n#\n# Give painting if the player has one\n#"]

        for i, metadata in enumerate(painting_metadata, 1):
            language_metadata[f"painting.art.{metadata['id']}.title"] = metadata["title"]
            language_metadata[f"painting.art.{metadata['id']}.author"] = metadata["author"]

            export_json(f"data/art/painting_variant/{metadata['id']}.json", to_painting(metadata))
            export_json(f"data/art/recipe/painting_variant/z_{metadata['id']}.json", to_recipe(metadata))

            function_lines.append("execute as @a[scores={painting=" + str(i) + ",painting_cleared=1}] run give @s painting[painting/variant=\"art:" + metadata['id'] + "\"]")
        function_lines.append("#\n# Error message if player doesn't have a painting\n#\nexecute as @a[scores={painting=1..,painting_cleared=0}] run tellraw @s {text:\"You must have at least one painting in your inventory!\",color:\"red\"}\nexecute at @s[scores={painting=1..,painting_cleared=0}] run playsound minecraft:block.note_block.didgeridoo master @s\n#\n# Reset Scoreboards\n#\nexecute as @a[scores={painting=1..}] run scoreboard players set @s painting 0\nexecute as @a[scores={painting=1..}] run scoreboard players set @s painting_cleared 0")

        function_path: str = "data/art/function/give_painting.mcfunction"
        
        with open(function_path, "w") as file:
            file.write("\n".join(function_lines))
        print(f"Successfully exported data to {function_path}")

        if resource_path is not None:
            export_json(resource_path["path"], language_metadata)

#-------Main-Routine-------
if __name__ == "__main__":
    main()