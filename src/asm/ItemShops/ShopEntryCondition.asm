#To be inserted at 80077d84
lis r4, 0x8007
ori r4, r4, 0x1F08 #Item prices offset

lbz r6, 0 (r4)
li r30, 1 #Use r30 as iterator, start from second item

#r4 = Item prices offset
#r5 = Currently Iterated Item Price
#r6 = Cheapest Item Price
#r30 = Iterator

cheapest_item_loop:

lbz r5, 1 (r4)
cmpw r5, r6
bge is_not_cheaper

mr r6, r5 #If the currently iterated item price is cheaper than the current cheapest item, make it the cheapest item price.

is_not_cheaper:

addi r4, r4, 1 
addi r30, r30, 1 #Add 1 to item prices offset as well as iteration number

cmpwi r30, 0x23 #Last item ID, edit this if adding new items.
bgt exit_loop

b cheapest_item_loop

exit_loop:
li r30, 0 #Reset r30 to zero
cmpw r3, r6 #Compare current amount of Coins with the price of the cheapest item available. Deny shop access if can't afford the cheapest item.