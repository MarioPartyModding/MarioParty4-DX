@echo off

rmdir /S /Q dist
mkdir tmp
mkdir dist
mkdir dist\store

"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CustomFunctions.asm" && "compiler\gecko_linker.exe" a.out 8008ef4c tmp/1.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ModelLoading.asm" && "compiler\gecko_linker.exe" a.out 8008d854 tmp/2.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Fixes/ItemRestoreFix.asm" && "compiler\gecko_linker.exe" a.out 8008efb0 tmp/3.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Fixes/ItemUIStatusFix.asm" && "compiler\gecko_linker.exe" a.out 8008af90 tmp/4.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Fixes/FixDisabledShopModel.asm" && "compiler\gecko_linker.exe" a.out 80078cb0 tmp/5.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/GaddlightBurn2.asm" && "compiler\gecko_linker.exe" a.out 8009e434 tmp/6.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/JuncImprovement.asm" && "compiler\gecko_linker.exe" a.out 80072720 tmp/7.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/GaddlightBurn1.asm" && "compiler\gecko_linker.exe" a.out 800a6a00 tmp/8.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/AIFavorLuckBattleGames.asm" && "compiler\gecko_linker.exe" a.out 8009ba8c tmp/9.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/PreventBadStarSteal.asm" && "compiler\gecko_linker.exe" a.out 800a57a0 tmp/10.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/Shop/ShopPriceCPUBehavior.asm" && "compiler\gecko_linker.exe" a.out 80079d0c tmp/11.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/Shop/AICanBuy6Or7.asm" && "compiler\gecko_linker.exe" a.out 80079da8 tmp/12.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/Shop/CPUShopBehavior.asm" && "compiler\gecko_linker.exe" a.out 80079d3c tmp/13.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet3.asm" && "compiler\gecko_linker.exe" a.out 8007176c tmp/14.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/TargetAssessment.asm" && "compiler\gecko_linker.exe" a.out 8008f7c0 tmp/15.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet1.asm" && "compiler\gecko_linker.exe" a.out 80071744 tmp/16.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/CPUItemUsageCheckFunctions.asm" && "compiler\gecko_linker.exe" a.out 800719a4 tmp/17.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet4.asm" && "compiler\gecko_linker.exe" a.out 800719e4 tmp/18.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ItemUsageCheckExtend.asm" && "compiler\gecko_linker.exe" a.out 80071a10 tmp/19.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet5.asm" && "compiler\gecko_linker.exe" a.out 800719D8 tmp/20.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet8.asm" && "compiler\gecko_linker.exe" a.out 80071774 tmp/21.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/HardcodeUsingDoubleDipFirst.asm" && "compiler\gecko_linker.exe" a.out 8008b8d4 tmp/22.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet6.asm" && "compiler\gecko_linker.exe" a.out 80071a40 tmp/23.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet2.asm" && "compiler\gecko_linker.exe" a.out 80071750 tmp/24.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/ItemUsage/ExtendComItemWeightGet7.asm" && "compiler\gecko_linker.exe" a.out 80071a34 tmp/25.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/WarpItemBehavior/WarpAssessment1.asm" && "compiler\gecko_linker.exe" a.out 80071d30 tmp/26.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/WarpItemBehavior/WarpAssessment4.asm" && "compiler\gecko_linker.exe" a.out 80071d48 tmp/27.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/WarpItemBehavior/WarpAssessment3.asm" && "compiler\gecko_linker.exe" a.out 80071d38 tmp/28.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU/WarpItemBehavior/WarpAssessment2.asm" && "compiler\gecko_linker.exe" a.out 80071d40 tmp/29.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/AmountOfItems.asm" && "compiler\gecko_linker.exe" a.out 80079764 tmp/30.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/DynamicPricesStringExtend.asm" && "compiler\gecko_linker.exe" a.out 80043a08 tmp/31.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopModelLoading.asm" && "compiler\gecko_linker.exe" a.out 80078ce8 tmp/32.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopPriceSort.asm" && "compiler\gecko_linker.exe" a.out 80079938 tmp/33.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/RewriteGetShopItemsFunc.asm" && "compiler\gecko_linker.exe" a.out 80077ff4 tmp/34.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopNameLoading.asm" && "compiler\gecko_linker.exe" a.out 800780e4 tmp/35.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopPricesLoading.asm" && "compiler\gecko_linker.exe" a.out 80078298 tmp/36.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopPriceCheck.asm" && "compiler\gecko_linker.exe" a.out 8007810c tmp/37.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopOddsForNewItems.asm" && "compiler\gecko_linker.exe" a.out 80079780 tmp/38.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopEntryCondition.asm" && "compiler\gecko_linker.exe" a.out 80077d84 tmp/39.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ShopDescriptionLoading.asm" && "compiler\gecko_linker.exe" a.out 80078d0c tmp/40.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop5.asm" && "compiler\gecko_linker.exe" a.out 800781ac tmp/41.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop7.asm" && "compiler\gecko_linker.exe" a.out 800798e0 tmp/42.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop6.asm" && "compiler\gecko_linker.exe" a.out 80079844 tmp/43.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShopItemMsg.asm" && "compiler\gecko_linker.exe" a.out 800780a8 tmp/44.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop3.asm" && "compiler\gecko_linker.exe" a.out 800781f4 tmp/45.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeTo7Pt2.asm" && "compiler\gecko_linker.exe" a.out 80078b4c tmp/46.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop9.asm" && "compiler\gecko_linker.exe" a.out 80079d8c tmp/47.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/SortShopItemsExtend.asm" && "compiler\gecko_linker.exe" a.out 80079964 tmp/48.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop2.asm" && "compiler\gecko_linker.exe" a.out 800780b0 tmp/49.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop4.asm" && "compiler\gecko_linker.exe" a.out 8007823c tmp/50.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ExtendShop8.asm" && "compiler\gecko_linker.exe" a.out 80079a34 tmp/51.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeTo7Pt1.asm" && "compiler\gecko_linker.exe" a.out 80078a44 tmp/52.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveShopItemChoiceCode/MoveShopItemChoiceTo7Pt5.asm" && "compiler\gecko_linker.exe" a.out 8007a1e4 tmp/53.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveShopItemChoiceCode/MoveShopItemChoiceTo7Pt1.asm" && "compiler\gecko_linker.exe" a.out 8007a114 tmp/54.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveShopItemChoiceCode/MoveShopItemChoiceTo7Pt2.asm.asm" && "compiler\gecko_linker.exe" a.out 8007a164 tmp/55.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveShopItemChoiceCode/MoveShopItemChoiceTo7Pt3.asm" && "compiler\gecko_linker.exe" a.out 8007a184 tmp/56.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveShopItemChoiceCode/MoveShopItemChoiceTo7Pt4.asm" && "compiler\gecko_linker.exe" a.out 8007a1ec tmp/57.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/HardcodeFirst2Items/HardcodeFirst2Items.asm" && "compiler\gecko_linker.exe" a.out 8007980c tmp/58.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/HardcodeFirst2Items/SelectHardcodedShroomShop.asm" && "compiler\gecko_linker.exe" a.out 80077cf0 tmp/59.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes39.asm" && "compiler\gecko_linker.exe" a.out 800799cc tmp/60.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes29.asm" && "compiler\gecko_linker.exe" a.out 80079954 tmp/61.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes30.asm" && "compiler\gecko_linker.exe" a.out 800799a0 tmp/62.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes7.asm" && "compiler\gecko_linker.exe" a.out 8007991c tmp/63.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes6.asm" && "compiler\gecko_linker.exe" a.out 8007992c tmp/64.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes12.asm" && "compiler\gecko_linker.exe" a.out 80078c8c tmp/65.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes34.asm" && "compiler\gecko_linker.exe" a.out 800796c0 tmp/66.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes18.asm" && "compiler\gecko_linker.exe" a.out 80078368 tmp/67.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes2.asm" && "compiler\gecko_linker.exe" a.out 80079810 tmp/68.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes28.asm" && "compiler\gecko_linker.exe" a.out 80079824 tmp/69.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes21.asm" && "compiler\gecko_linker.exe" a.out 80079cf0 tmp/70.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes37.asm" && "compiler\gecko_linker.exe" a.out 800799e4 tmp/71.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes10.asm" && "compiler\gecko_linker.exe" a.out 80078100 tmp/72.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes14.asm" && "compiler\gecko_linker.exe" a.out 8007828c tmp/73.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes1.asm" && "compiler\gecko_linker.exe" a.out 800796f0 tmp/74.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes17.asm" && "compiler\gecko_linker.exe" a.out 80078378 tmp/75.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes15.asm" && "compiler\gecko_linker.exe" a.out 8007827c tmp/76.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes27.asm" && "compiler\gecko_linker.exe" a.out 80079834 tmp/77.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes9.asm" && "compiler\gecko_linker.exe" a.out 800780d8 tmp/78.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes38.asm" && "compiler\gecko_linker.exe" a.out 800799d4 tmp/79.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes11.asm" && "compiler\gecko_linker.exe" a.out 800780f0 tmp/80.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes20.asm" && "compiler\gecko_linker.exe" a.out 800783a4 tmp/81.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes22.asm" && "compiler\gecko_linker.exe" a.out 80079d00 tmp/82.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes31.asm" && "compiler\gecko_linker.exe" a.out 80079990 tmp/83.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes36.asm" && "compiler\gecko_linker.exe" a.out 800796d8 tmp/84.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes33.asm" && "compiler\gecko_linker.exe" a.out 800799b8 tmp/85.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes5.asm" && "compiler\gecko_linker.exe" a.out 800797b8 tmp/86.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes24.asm" && "compiler\gecko_linker.exe" a.out 80079d24 tmp/87.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes4.asm" && "compiler\gecko_linker.exe" a.out 800797a8 tmp/88.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes26.asm" && "compiler\gecko_linker.exe" a.out 80079d5c tmp/89.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes3.asm" && "compiler\gecko_linker.exe" a.out 80079800 tmp/90.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes13.asm" && "compiler\gecko_linker.exe" a.out 80078c9c tmp/91.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes35.asm" && "compiler\gecko_linker.exe" a.out 800796cc tmp/92.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes23.asm" && "compiler\gecko_linker.exe" a.out 80079d34 tmp/93.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes40.asm" && "compiler\gecko_linker.exe" a.out 800799bc tmp/94.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes32.asm" && "compiler\gecko_linker.exe" a.out 800799a8 tmp/95.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes25.asm" && "compiler\gecko_linker.exe" a.out 80079d4c tmp/96.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes8.asm" && "compiler\gecko_linker.exe" a.out 800780c8 tmp/97.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes19.asm" && "compiler\gecko_linker.exe" a.out 80078394 tmp/98.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ChangeShopItemsIntoBytes/ChangeShopItemsIntoBytes16.asm" && "compiler\gecko_linker.exe" a.out 80079194 tmp/99.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ShopOdds/ExtendedShop Odds2.asm" && "compiler\gecko_linker.exe" a.out 8007976c tmp/100.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/ShopOdds/ExtendedShop Odds1.asm" && "compiler\gecko_linker.exe" a.out 80079774 tmp/101.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/FixCursorPosition/YPositionMoveShopItemChoice.asm" && "compiler\gecko_linker.exe" a.out 8007a028 tmp/102.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/FixCursorPosition/XPositionCreateShopItemChoice.asm" && "compiler\gecko_linker.exe" a.out 80079eb0 tmp/103.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/FixCursorPosition/YPositionCreateShopItemChoice.asm" && "compiler\gecko_linker.exe" a.out 80079EC0 tmp/104.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/FixCursorPosition/XPositionMoveShopItemChoice.asm" && "compiler\gecko_linker.exe" a.out 8007a008 tmp/105.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveChoiceEnableTbl/Move ChoiceEnableTbl3.asm" && "compiler\gecko_linker.exe" a.out 80078140 tmp/106.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveChoiceEnableTbl/Move ChoiceEnableTbl1.asm" && "compiler\gecko_linker.exe" a.out 8007815c tmp/107.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemShops/ExtendShop/MoveChoiceEnableTbl/Move ChoiceEnableTbl2.asm" && "compiler\gecko_linker.exe" a.out 8007a0ec tmp/108.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/LargeIcon/LargeIconsUpdateItemPickup.asm" && "compiler\gecko_linker.exe" a.out 8008cf14 tmp/109.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/LargeIcon/LargeIconsLoading.asm" && "compiler\gecko_linker.exe" a.out 8008b700 tmp/110.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/LargeIcon/LargeIconsFix.asm" && "compiler\gecko_linker.exe" a.out 8008c73c tmp/111.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Dialog/ItemSelectionScreenText.asm" && "compiler\gecko_linker.exe" a.out 8008d778 tmp/112.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Dialog/ItemNameWindowSize.asm" && "compiler\gecko_linker.exe" a.out 8008d6e4 tmp/113.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Dialog/ItemDescriptionText.asm" && "compiler\gecko_linker.exe" a.out 8008d6cc tmp/114.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpaces/RandomItemsItemSpace1.asm" && "compiler\gecko_linker.exe" a.out 80083878 tmp/115.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpaces/RandomItemsItemSpace2.asm" && "compiler\gecko_linker.exe" a.out 80083028 tmp/116.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpaces/RandomItemsItemSpace3.asm" && "compiler\gecko_linker.exe" a.out 80083cf0 tmp/117.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ChanceTime/FixGreenPanel.asm" && "compiler\gecko_linker.exe" a.out 8009d254 tmp/118.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ChanceTime/ItemPrevNoUpdate.asm" && "compiler\gecko_linker.exe" a.out 800643fc tmp/119.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ChanceTime/KeepCurPlayerTurn.asm" && "compiler\gecko_linker.exe" a.out 8009d71c tmp/120.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc8.asm" && "compiler\gecko_linker.exe" a.out 80064e74 tmp/121.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc2.asm" && "compiler\gecko_linker.exe" a.out 800662d4 tmp/122.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc1.asm" && "compiler\gecko_linker.exe" a.out 80066374 tmp/123.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc7.asm" && "compiler\gecko_linker.exe" a.out 80064f18 tmp/124.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc5.asm" && "compiler\gecko_linker.exe" a.out 80064e44 tmp/125.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc3.asm" && "compiler\gecko_linker.exe" a.out 800662f4 tmp/126.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc12.asm" && "compiler\gecko_linker.exe" a.out 80065368 tmp/127.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc6.asm" && "compiler\gecko_linker.exe" a.out 80064e5c tmp/128.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc11.asm" && "compiler\gecko_linker.exe" a.out 80065160 tmp/129.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseRestore.asm" && "compiler\gecko_linker.exe" a.out 80066d58 tmp/130.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc9.asm" && "compiler\gecko_linker.exe" a.out 800650f0 tmp/131.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseTracker.asm" && "compiler\gecko_linker.exe" a.out 800661fc tmp/132.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc4.asm" && "compiler\gecko_linker.exe" a.out 80066354 tmp/133.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Reverse Mushroom/ReverseGetJunc10.asm" && "compiler\gecko_linker.exe" a.out 800650d8 tmp/134.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/SkipWheel.asm" && "compiler\gecko_linker.exe" a.out 80090428 tmp/135.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/SkipPlayersSwappedMsg.asm" && "compiler\gecko_linker.exe" a.out 80090f18 tmp/136.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/WarpBlockAnimFix1.asm" && "compiler\gecko_linker.exe" a.out 80090498 tmp/137.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/LoadMDL.asm" && "compiler\gecko_linker.exe" a.out 800903b0 tmp/138.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/WarpBlockRandomSpaceGen1.asm" && "compiler\gecko_linker.exe" a.out 80090474 tmp/139.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/WarpBlockAnimFix2.asm" && "compiler\gecko_linker.exe" a.out 80090590 tmp/140.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/WarpBlockRandomSpaceGen2.asm" && "compiler\gecko_linker.exe" a.out 80090568 tmp/141.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SuperPipeAndWarpPipe/SkipNothingHappenedMsg.asm" && "compiler\gecko_linker.exe" a.out 800904cc tmp/142.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix5.asm" && "compiler\gecko_linker.exe" a.out 80078470 tmp/143.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix2.asm" && "compiler\gecko_linker.exe" a.out 80077F64 tmp/144.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFixCharPanels.asm" && "compiler\gecko_linker.exe" a.out 80077E48 tmp/145.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix8.asm" && "compiler\gecko_linker.exe" a.out 80077c64 tmp/146.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix3.asm" && "compiler\gecko_linker.exe" a.out 80077F78 tmp/147.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix6.asm" && "compiler\gecko_linker.exe" a.out 80078444 tmp/148.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix4.asm" && "compiler\gecko_linker.exe" a.out 8007845C tmp/149.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix9.asm" && "compiler\gecko_linker.exe" a.out 8007842c tmp/150.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix7.asm" && "compiler\gecko_linker.exe" a.out 800782ec tmp/151.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/CellullarShopper/CelluarShopperFix1.asm" && "compiler\gecko_linker.exe" a.out 80077f10 tmp/152.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ItemBag/ExtendItemBagModels.asm" && "compiler\gecko_linker.exe" a.out 80096e00 tmp/153.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ItemBag/ExtendItemBagItems.asm" && "compiler\gecko_linker.exe" a.out 8008b1e0 tmp/154.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ItemBag/ExtendItemBagModels2.asm" && "compiler\gecko_linker.exe" a.out 80096e10 tmp/155.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/ItemBag/ExtendItemBagItems2.asm" && "compiler\gecko_linker.exe" a.out 8008b1ec tmp/156.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/ExtraDices.asm" && "compiler\gecko_linker.exe" a.out 80085cf0 tmp/157.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/ZtarBlackout.asm" && "compiler\gecko_linker.exe" a.out 8005e6b4 tmp/158.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/ShowMaxRollCursed.asm" && "compiler\gecko_linker.exe" a.out 80085db4 tmp/159.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/RemoveVanillaStatusEffectHandling2.asm" && "compiler\gecko_linker.exe" a.out 80085d40 tmp/160.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/ColorfulDice.asm" && "compiler\gecko_linker.exe" a.out 80086480 tmp/161.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/RemoveVanillaStatusEffectHandling1.asm" && "compiler\gecko_linker.exe" a.out 80085d34 tmp/162.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/PlusDiceDoesntGiveDoublesBonus.asm" && "compiler\gecko_linker.exe" a.out 80087f70 tmp/163.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/KillStatusEffectsAfterTurnEnds.asm" && "compiler\gecko_linker.exe" a.out 80064a44 tmp/164.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/PlusDiceAndMinusDice.asm" && "compiler\gecko_linker.exe" a.out 800862e4 tmp/165.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/RemoveVanillaStatusEffectHandling4.asm" && "compiler\gecko_linker.exe" a.out 80085d58 tmp/166.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/DiceRollManipulation.asm" && "compiler\gecko_linker.exe" a.out 80086970 tmp/167.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/ZtarBlackout2.asm" && "compiler\gecko_linker.exe" a.out 8005e834 tmp/168.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/KillStatusEffectsWhenStartingABoard.asm" && "compiler\gecko_linker.exe" a.out 800A6EE4 tmp/169.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/DoubleDip.asm" && "compiler\gecko_linker.exe" a.out 80085fe0 tmp/170.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/DiceStatusEffects/RemoveVanillaStatusEffectHandling3.asm" && "compiler\gecko_linker.exe" a.out 80085d4c tmp/171.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneMiniBowserSummonFix.asm" && "compiler\gecko_linker.exe" a.out 8009b334 tmp/172.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/FixBowserShowingUpDuringMiniBowserEvent.asm" && "compiler\gecko_linker.exe" a.out 8009a870 tmp/173.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneReplaceMinigameEventWithNegCoins1.asm" && "compiler\gecko_linker.exe" a.out 80097f48 tmp/174.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneReplaceMinigameEventWithNegCoins2.asm" && "compiler\gecko_linker.exe" a.out 8009aaa8 tmp/175.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneCameraFix.asm" && "compiler\gecko_linker.exe" a.out 800979d8 tmp/176.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneReplaceMinigameEventWithNegCoins3.asm" && "compiler\gecko_linker.exe" a.out 8009aab8 tmp/177.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/FixBowserPhone2.asm" && "compiler\gecko_linker.exe" a.out 8009abdc tmp/178.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/KoopaKidAntiBackfireCode.asm" && "compiler\gecko_linker.exe" a.out 8009a854 tmp/179.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BowserPhone/BowserPhoneRedPanelFix.asm" && "compiler\gecko_linker.exe" a.out 800976d8 tmp/180.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/SkipModelAttrSet.asm" && "compiler\gecko_linker.exe" a.out 800910f0 tmp/181.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/ShowBarterBoxModel1.asm" && "compiler\gecko_linker.exe" a.out 800910c8 tmp/182.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/GaddbrushItemCopypaste.asm" && "compiler\gecko_linker.exe" a.out 80091bf8 tmp/183.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/SkipRoulette.asm" && "compiler\gecko_linker.exe" a.out 80091098 tmp/184.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/ShowBarterBoxModel2.asm" && "compiler\gecko_linker.exe" a.out 800915c0 tmp/185.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/BarterBoxAndGaddbrush/ShowBarterBoxModel3.asm" && "compiler\gecko_linker.exe" a.out 8009154c tmp/186.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Self-Targeting/FifthChoiceOption.asm" && "compiler\gecko_linker.exe" a.out 8008f8b0 tmp/187.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Self-Targeting/SelfTargeting3.asm" && "compiler\gecko_linker.exe" a.out 8008f6d8 tmp/188.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Self-Targeting/DontAddCharacterNamesToCustomChoiceBox.asm" && "compiler\gecko_linker.exe" a.out 8008f6c0 tmp/189.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Self-Targeting/SelfTargeting2.asm" && "compiler\gecko_linker.exe" a.out 8008f5e4 tmp/190.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Self-Targeting/SelfTargeting1.asm" && "compiler\gecko_linker.exe" a.out 8008f58c tmp/191.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/RouletteWheel/NoRNGSpinner2.asm" && "compiler\gecko_linker.exe" a.out 800816CC tmp/192.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/RouletteWheel/NoRNGSpinner.asm" && "compiler\gecko_linker.exe" a.out 8008186c tmp/193.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/RouletteWheel/NoRNGSpinnerSwapCard.asm" && "compiler\gecko_linker.exe" a.out 8008186c tmp/194.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/PlunderChest/ItemBagTo PlunderChest1.asm" && "compiler\gecko_linker.exe" a.out 800971c4 tmp/195.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/PlunderChest/ItemBagTo PlunderChest2RemoveEnemyItem.asm.asm" && "compiler\gecko_linker.exe" a.out 80097188 tmp/196.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/PlunderChest/LoadPlunderMdl.asm" && "compiler\gecko_linker.exe" a.out 80096d9c tmp/197.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/MiniMushroom/MiniMushroomFuncAlwaysUseItem.asm" && "compiler\gecko_linker.exe" a.out 80071a9c tmp/198.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/FlyGuyGreenPanelFix.asm" && "compiler\gecko_linker.exe" a.out 80080de0 tmp/199.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/SkipWheel.asm" && "compiler\gecko_linker.exe" a.out 80080ee0 tmp/200.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/ReplaceWarp SpaceMDLWith FlyGuyTrap.asm" && "compiler\gecko_linker.exe" a.out 800810f8 tmp/201.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/SwapUserAnd TargetIfFly Guy.asm" && "compiler\gecko_linker.exe" a.out 80080ef8 tmp/202.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/FlyGuyTargetPosFix.asm" && "compiler\gecko_linker.exe" a.out 8008130c tmp/203.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/FlyGuy/FlyGuyCameraFix.asm" && "compiler\gecko_linker.exe" a.out 80080f04 tmp/204.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Mini-MegaHammer/RemovePoison FromMegaPlayers.asm" && "compiler\gecko_linker.exe" a.out 80085d98 tmp/205.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/Mini-MegaHammer/PoisonMiniMega HammerPlayer.asm" && "compiler\gecko_linker.exe" a.out 8008fdd4 tmp/206.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/RemoveSkeletonKeyStatusAfter1Step.asm" && "compiler\gecko_linker.exe" a.out 800648c0 tmp/207.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/SkeletonKeyMiniPipeCode3.asm" && "compiler\gecko_linker.exe" a.out 80075ff0 tmp/208.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/SkeletonKeyTextboxMiniGame.asm" && "compiler\gecko_linker.exe" a.out 80076144 tmp/209.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/SkeletonKeyTextboxMiniPipe.asm" && "compiler\gecko_linker.exe" a.out 80066344 tmp/210.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/SkeletonKeyMiniPipeCode1.asm" && "compiler\gecko_linker.exe" a.out 80064ecc tmp/211.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/ItemSpecific/SkeletonKey/SkeletonKeyMiniPipeCode2.asm" && "compiler\gecko_linker.exe" a.out 80065110 tmp/212.txt1

copy src\asm\Fixes\CanUseItemAfterBrushOrBag.txt tmp\213.txt1
copy src\asm\Fixes\FixToadJunc.txt tmp\214.txt1

del a.out

cd tmp
echo.$MP4DX >> ..\dist\store\codes.txt
for %%f in (*.txt1) do (
    type "%%f" >> ..\dist\store\codes.txt
    echo. >> ..\dist\store\codes\codes.txt
)

cd ..
xcopy /E /I tools dist\tools
xcopy /E /I extras dist\Extras
xcopy /E /I gecko_codes "dist\Gecko Codes for Customization"
xcopy /E /I src\files dist\store\files
copy src\patch.bat dist\
copy LICENSE.md dist\

rmdir /S /Q tmp