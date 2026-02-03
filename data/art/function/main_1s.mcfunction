#
# Description: Runs every second, checking who triggers the painting trigger
# Called by: #minecraft:load
# Entity @s: None
#
scoreboard players enable @a painting
execute as @a[scores={painting=1..}] run function art:give_painting
#
# Schedule function again
# 
schedule function art:main_1s 1s replace