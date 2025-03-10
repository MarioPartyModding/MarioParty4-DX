#To be inserted at 80083028
#patch text
#r27 holds string id to print
#817FFFF0 s32 holds chosen item id from earlier code

bl afterAsciiTable
.balign 4
itemAsciiTable:
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Mini\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Mega\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Super\x10Mini\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Super\x10Mega\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Mini\x10Mega\x10Hammer\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Warp\x10Pipe\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05Swap\x10"
	.asciz "Card\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Sparky\x10Sticker\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Gaddlight\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05"
	.ascii "Chomp\x10"
	.asciz "Call\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05"
	.asciz "Bowser\x10Suit\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x04"
	.ascii "Crystal\x10"
	.asciz "Ball\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x07Magic\x10Lamp\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10\x1E\x07"
	.ascii "all\x10the\x10Items\x10you\x0A"
	.ascii "can\x10"
	.asciz "carry\xC2\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05"
	.asciz "Bowser\x10Phone\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x07Golden\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BWow\xC2\x10You\x10got\x10"
	.ascii "a\x10\x1E\x07Hidden\x10"
	.ascii "Block\x10"
	.ascii "Card\x1E\x08\xC2\x0A"
	.asciz "A\x10\x1E\x07very\x10rare\x10item\xC2\xC2\xC2\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05"
	.asciz "Cellular\x10Shopper\x1E\x08\x85\xFF"
.ascii "\x0BWow\xC2\x10You\x10got\x10"
	.ascii "a\x10\x1E\x07\x10"
	.ascii "Barter\x10"
	.ascii "Box\x1E\x08\xC2\x0A"
	.asciz "A\x10\x1E\x07very\x10rare\x10item\xC2\xC2\xC2\x85\xFF"
.ascii "\x0BWow\xC2\x10You\x10got\x10"
	.ascii "a\x10\x1E\x07Super\x10Warp\x10Pipe\x1E\x08\xC2\x0A"
	.asciz "A\x10\x1E\x07very\x10rare\x10item\xC2\xC2\xC2\xFF"
.ascii "\x0BWow\xC2\x10You\x10got\x10"
	.ascii "a\x10\x1E\x07"
	.ascii "Chance\x10"
	.ascii "Charm\x1E\x08\xC2\x0A"
	.asciz "A\x10\x1E\x07very\x10rare\x10item\xC2\xC2\xC2\xFF"
.ascii "\x0BWow\xC2\x10You\x10got\x10"
	.ascii "a\x10\x1E\x07Wacky\x10Watch\x1E\x08\xC2\x0A"
	.asciz "A\x10\x1E\x07very\x10rare\x10item\xC2\xC2\xC2\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05Plunder\x10"
	.asciz "Chest\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x04Gaddbrush\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x07Skeleton\x10Key\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05Warp\x10"
	.asciz "Block\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x03"
	.asciz "Fly\x10Guy\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x02Plus\x10"
	.asciz "Block\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x03Minus\x10"
	.asciz "Block\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05Speed\x10"
	.asciz "Block\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x07Slow\x10"
	.asciz "Block\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x04Poison\x10Mushroom\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x04Poison\x10Shroom\x10"
	.asciz "Bunch\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.ascii "a\x10\x1E\x05"
	.ascii "Double\x10"
	.asciz "Dip\x1E\x08\x85\xFF"
.ascii "\x0BYou\x10got\x10"
	.asciz "a\x10\x1E\x05Reverse\x10Mushroom\x1E\x08\x85\xFF"
	
.balign 4
afterAsciiTable:
mflr r3 #pointer to ascii table
#parse ascii table and find pointer to item
lis r4, 0x817F
ori r4, r4, 0xFFF0
lwz r4, 0 (r4) #load chosen item id

asciiTableLoop:
#init loop
li r5, 0 #loop counter
li r6, 0 #found strings
	Loop:
	lbzx r7, r5, r3 #load char
	cmpwi r7, 0 #compare char to 0
	bne+ notZero
	#is zero
	cmpw r6, r4 #does item id == inner loop count
	beq- itemFound
	add r3, r3, r5
	addi r3, r3, 1 #point to next string
	addi r6, r6, 1 #increment string counter
	li r5, 0 #reset loop counter
	b Loop
	
	notZero:
	addi r5, r5, 1
	b Loop

itemFound:
mr r15, r3 #move ptr to string to r15

#Play Rare Item fanfare if it's a rare item
cmpwi r4, 0x11
beq is_rare_item

cmpwi r4, 0x13
beq is_rare_item

cmpwi r4, 0x14
beq is_rare_item

cmpwi r4, 0x15
beq is_rare_item

cmpwi r4, 0x16
beq is_rare_item

b end

is_rare_item:

   #Pause Music  
   lis r3, 0x8007
   ori r3, r3, 0x1034
   mtctr r3
   li r3, 1 
   li r4, 1
   li r5, 0x1F4 #Stop board music for a while
   bctrl

   #Huprcsleep
   lis r3, 0x8000
   ori r3, r3, 0xCF0C
   mtctr r3
   li r3, 0x14 
   bctrl
   
   #Play fanfare
   lis r3, 0x8003
   ori r3, r3, 0x32E0
   mtctr r3
   li r3, 0xA
   bctrl

  

end:
mr r4, r15 #move ptr to string to r4
li r3, 0
li r15, 0
li r5, 0







