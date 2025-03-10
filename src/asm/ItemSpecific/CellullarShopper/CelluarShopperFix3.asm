#To be inserted at 80077F78
#Prevent the player from walking if shop is summoned from cellullar shopper
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Cellullar Shopper Flag

#Don't continue if it's a Cellullar Shopper
cmpwi r14, 2
beq end

# Run Func
   lis r14, 0x8006
   ori r14, r14, 0x6E24
   mtctr r14
   li r14, 0
   bctrl

end:
li r14, 0