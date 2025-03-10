#To be inserted at 800979d8
#If the Bowser Event was triggered with a phone, make it so the game does not send the camera back to the player. Otherwise, do execute BoardCameraViewSet.
lis r14, 0x8007
ori r14, r14, 0x1CA0
lbz r14, 0 (r14) #Load Bowser Phone flag

#Continue if it's a Bowser Phone
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