#To be inserted at 80080f04
#Check if the special item flag is active. If it is, switch user and target
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load special item flag

#Continue if it's a Fly Guy
cmpwi r14, 2
beq end

# Run BoardCameraViewSet
   lis r14, 0x8005
   ori r14, r14, 0xD284
   mtctr r14
   li r14, 0
   bctrl

end:
li r14, 0