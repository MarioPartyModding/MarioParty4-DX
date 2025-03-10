#To be inserted at 80071d38
cmpwi r27, 0x4
beq is_warp

cmpwi r27, 0x5
beq is_warp

cmpwi r27, 0x9
beq is_warp

cmpwi r27, 0x14
beq is_warp

cmpwi r27, 0x1A
beq is_warp

cmpwi r27, 0x1B
beq is_warp


li r28, 10
b end

is_warp:
li r28, 20

end: