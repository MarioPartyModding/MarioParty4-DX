#To be inserted at 800a57a0
#Do not steal a Star if all Star owners own a Gaddlight


#Load base player struct
lis r14, 0x8018 
ori r14, r14, 0xFC38


#Load curplayer index
lis r15, 0x8018 
ori r15, r15, 0xFD02
lbz r15, 0 (r15)

li r4, 0 #Use r4 as iterator

steal_check_loop:

cmpw r15, r4
beq loop_increment #Don't check for self

lha r15, 0x2A (r14) #Star amount
cmpwi r15, 0
beq loop_increment #Don't check for starless players

#Checking player who owns a Star. If they do not have a Gaddlight, allow CPU to steal stars.
lbz r15, 5 (r14)
cmpwi r15, 8
bne skip_gadd1

b loop_increment

skip_gadd1:
lbz r15, 6 (r14)
cmpwi r15, 8
bne skip_gadd2

b loop_increment

skip_gadd2:
lbz r15, 7 (r14)
cmpwi r15, 8
bne do_steal

loop_increment:
addi r4, r4, 1
addi r14, r14, 0x30

cmpwi r4, 4
bge dont_steal

b steal_check_loop


dont_steal:
li r3, 10 #Make r3 lower than 50, so CPU detects that they're only capable of stealing Coins.

do_steal:
li r4, 0
li r14, 0
li r15, 0
cmpwi r3, 50