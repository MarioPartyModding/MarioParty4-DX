#To be inserted at 80071a9c
# MP4 ITEM EXPANSION MOD GECKO CODE - Replace Mini Mushroom function with "always use item" 
# Vanilla Mini Mushroom function is rather broken and more often than not results on the AI hoarding Mini Mushrooms/items that use the func check. Mini mushrooms padding the inventory is more troublesome than anything
# Let's get rid of it and simply have it always output 1. Wipe the mini mushroom check func and use its space to put the new item pref tbls instead
li r3, 1
blr