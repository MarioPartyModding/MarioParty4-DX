#To be inserted at 800a6a00
#If CPU does not have enough coins to steal a Star, allow them to steal from players that have a Gaddlight, to force them to burn it for just 5 coins

# Get current player, multiply by 0x30 (player struct size)
  lis r30, 0x8018
  ori r30, r30, 0xFD02
  lbz r30, 0 (r30)
  mulli r30, r30, 0x30

# Get current player struct
  lis r31, 0x8018
  ori r31, r31, 0xFC38
  add r31, r31, r30

  lha r31, 0x1C (r31) #Load current player's coin amount
  cmpwi r31, 50
  blt cant_steal_star
  li r30, 0 #If is able to steal a Star, make the odds of them ignoring a Gaddlight 0%

  b end

cant_steal_star:
li r30, 100 #If is unable to steal a Star, make the odds of them ignoring a Gaddlight 100%

end:
li r31, 0