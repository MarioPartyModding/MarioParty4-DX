#To be inserted at 80078cb0
# MP4 ITEM EXPANSION MOD GECKO CODE - Fix Shop Model not showing
# Fixes a bug which causes the Mushroom model to not show if it's the first item of the list.

li r3, 100
cmpw r3, r0