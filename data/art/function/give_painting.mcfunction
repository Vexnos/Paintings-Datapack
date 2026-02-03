#
# Description: Give painting based on trigger value
# Called by: art:main_1s
# Entity @s: player
#
# Check if painting has been cleared
#
execute store result score @s painting_cleared run clear @s painting 1
#
# Give painting if the player has one
#
execute as @a[scores={painting=1,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos01"]
execute as @a[scores={painting=2,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos02"]
execute as @a[scores={painting=3,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos03"]
execute as @a[scores={painting=4,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos04"]
execute as @a[scores={painting=5,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos05"]
execute as @a[scores={painting=6,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos06"]
execute as @a[scores={painting=7,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos07"]
execute as @a[scores={painting=8,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos08"]
execute as @a[scores={painting=9,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos09"]
execute as @a[scores={painting=10,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos10"]
execute as @a[scores={painting=11,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos11"]
execute as @a[scores={painting=12,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos12"]
execute as @a[scores={painting=13,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos13"]
execute as @a[scores={painting=14,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos14"]
execute as @a[scores={painting=15,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos15"]
execute as @a[scores={painting=16,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos16"]
execute as @a[scores={painting=17,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos17"]
execute as @a[scores={painting=18,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos18"]
execute as @a[scores={painting=19,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos19"]
execute as @a[scores={painting=20,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos20"]
execute as @a[scores={painting=21,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos21"]
execute as @a[scores={painting=22,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos22"]
execute as @a[scores={painting=23,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos23"]
execute as @a[scores={painting=24,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos24"]
execute as @a[scores={painting=25,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos25"]
execute as @a[scores={painting=26,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos26"]
execute as @a[scores={painting=27,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos27"]
execute as @a[scores={painting=28,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos28"]
execute as @a[scores={painting=29,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos29"]
execute as @a[scores={painting=30,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos30"]
execute as @a[scores={painting=31,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos31"]
execute as @a[scores={painting=32,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos32"]
execute as @a[scores={painting=33,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos33"]
execute as @a[scores={painting=34,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos34"]
execute as @a[scores={painting=35,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos35"]
execute as @a[scores={painting=36,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos36"]
execute as @a[scores={painting=37,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos37"]
execute as @a[scores={painting=38,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos38"]
execute as @a[scores={painting=39,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos39"]
execute as @a[scores={painting=40,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos40"]
execute as @a[scores={painting=41,painting_cleared=1}] run give @s painting[painting/variant="art:vexnos41"]
#
# Error message if player doesn't have a painting
#
execute as @a[scores={painting=1..,painting_cleared=0}] run tellraw @s {text:"You must have at least one painting in your inventory!",color:"red"}
execute at @s[scores={painting=1..,painting_cleared=0}] run playsound minecraft:block.note_block.didgeridoo master @s
#
# Reset Scoreboards
#
execute as @a[scores={painting=1..}] run scoreboard players set @s painting 0
execute as @a[scores={painting=1..}] run scoreboard players set @s painting_cleared 0