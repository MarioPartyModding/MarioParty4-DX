#To be inserted at 800A6EE4
#When starting a new board, reset all status effect flags to 00

#Load base status effect struct
lis r14, 0x8018
ori r14, r14, 0xFD62

li r15, 0
#Bytes to zero: from 8018FD62 to 8018FD7D
#Clear P1's status flags 8018FD62
sth r15, 0 (r14)
stw r15, 2 (r14)
stw r15, 6 (r14)
stw r15, 10 (r14)
stw r15, 14 (r14)
stw r15, 18 (r14)
stw r15, 22 (r14)
stw r15, 26 (r14) 
stw r15, 30 (r14) 
stw r15, 34 (r14) 
stw r15, 38 (r14) 
stw r15, 42 (r14) 
sth r15, 44 (r14) 

li r14, 0
stwu sp, -0x0010 (sp)