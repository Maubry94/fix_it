pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
	
	 music(002)
 action_count = 0
 
 action_enemy = true
 first_info=false
 game_over = false

 win = false
 victory = 0
 
 vide={
  x=9,
  y=10,
  spr_x=112,
  spr_y=0,
  name='vide',
  info_l1 = '',
  info_l2 = '',
  info_l3 = ''
 }
 
 my_attack ={
  first=vide,
  second=vide,
  third = vide,
  fourth=vide,
  fifth = vide
  }
 			
 select_combo = ''
 
 helper = false
 
 texte_info_l1 = 'repair your robot'
 texte_info_l2 = 'well for the next'
 texte_info_l3 = 'fight .'
 
 
 
 round_time =0
 
 
 fight_speed = 1
 
 choice_x = 0
 choice_y = 0
 
 choice_time = 0
 choice_act = false
 
 button_x_time=0
 button_x_activ = false
 button_y_time=0
 button_y_activ = false
 

 
 scene = 2
	scene = scene*16
 		
 debugact = false
 
 
 player={
  x=22,
  y=64,
  spr_x=0,
  spr_y=0,
  life=2,
  block = false,
  boost = 0 ,
  action=true
 }
 
 

 ennemies ={
   opponent={
  x=75,
  y=48,
  spr_x=0,
  spr_y=32,
  life=5,
  moveset_1='attack',
  moveset_2='block',
  moveset_3='upgrade',
  moveset_4='attack',
  moveset_5='block',
  block=false,
  boost=0
 },
 ennemy_2={
  x=75,
  y=48,
  spr_x=32,
  spr_y=32,
  life=5,
  moveset_1='attack',
  moveset_2='upgrade',
  moveset_3='block',
  moveset_4='attack',
  moveset_5='upgrade',
  block=false,
  boost=0
 },
 ennemy_3={
  x=75,
  y=48,
  spr_x=64,
  spr_y=32,
  life=5,
  moveset_1='upgrade',
  moveset_2='attack',
  moveset_3='block',
  moveset_4='block',
  moveset_5='attack',
  block=false,
  boost=0
 }
 }
 
 opponent = ennemies.opponent
 
 pow={
  x=8,
  y=104,
  spr_x=16,
  spr_y=0
 }
 
 lil={
  x=8,
  y=104,
  spr_x=16,
  spr_y=0,
  name='defense',
  info_l1 = 'defend yourself',
  info_l2 = 'until the next',
  info_l3 = 'action .'
 }
 
 
 epe={
  x = 55,
  y = 66,
  spr_x = 16,
  spr_y = 0,
  name='attack',
  info_l1 = 'attack the enemy',
  info_l2 = 'for the next',
  info_l3 = 'action .'
 }
 
 bouclier = {
  x = 55,
  y = 44,
  spr_x = 32,
  spr_y = 0,
  name='block',
  info_l1 = 'defend yourself',
  info_l2 = 'until the next',
  info_l3 = 'action . '
 }
 
 upgrade = {
  x = 87,
  y = 44,
  spr_x = 48,
  spr_y = 0,
  name='boost',
  info_l1 = 'add an additional',
  info_l2 = 'effect for the',
  info_l3 = 'next action . '
 }
 
 heal = {
  x = 23,
  y = 66,
  spr_x = 64,
  spr_y = 0,
  name='heal',
  info_l1 = 'repair your robot',
  info_l2 = 'a bit .',
  info_l3 = ' '
 }
 
 
 other = {
   x = 87,
  y = 66,
  spr_x = 80,
  spr_y = 0,
  name='???',
  info_l1 = '????',
  info_l2 = '????',
  info_l3 = '????'
 }			

 helpp = {
  x = 23,
  y = 44,
  spr_x = 96,
  spr_y = 0,
  name='help',
  info_l1 = 'you need to repair',
  info_l2 = 'well your robot !',
  info_l3 = 'press x for help'
 }		
 
 
 timecount = 0
 
 startfight = false
 
 main_zic = false
 
 fight_zic = false

end

function _update60()

 cls(0)
 
	

 if (scene == 0 ) then  
 	// publics
 	for i=0,4 do
  	//sspr(96,32,32,32,0+(i*32),32)
  	sspr(96,32,32,32,0+(i*32),64)
 	end
 end
   

   map(scene,0,0,0,16,16)
  
   if (scene == 0 ) then  fight() end
   
   if (scene == 16 ) then  repair() end

 if(scene==32)then

rectfill(25,85,105,100,black)


spr(128,40,10,2,2)
spr(130,54,10,2,2)
spr(132,70,10,2,2)
spr(130,42,32,2,2)
spr(134,58,32,2,2)
spr(136,70,32,2,2)
spr(138,52,88,2,2)
spr(163,115,85,2,2)

print('press    for start',30,90,10)
   
 
  
   if(btn(5))then
 	
 			
    scene=0
    
    
 end 
 end

end

-->8
function fight()

main_zic=false
if(fight_zic==false)then
     music(018)
     fight_zic=true
     end




 // rectangles info et rounds : gris
 rectfill(0,0,128,31,5)
 rectfill(0,96,128,128,5)
 
 
 // anim fight
 
 
 // print infos
 print( 'b.o.b' , 8 ,10 , 7) 
 print( '▤▤ vs ▤▤' , 40 ,1 , 7)
 print( 'zx-42' , 82 ,10 , 7) 
 
 // player life
 rectfill( 2, 18, 51, 27, 1 )
 rectfill( 3, 19, 50, 26, 0 )
 rectfill( 3, 19,3+ player.life*9, 26, 11 )
 
 //ennemie life
 rectfill( 76, 18, 124, 27, 1 )
 rectfill( 77, 19, 123, 26, 0 )
  if(opponent.life>10) then opponent.life=10 end
 rectfill( 77, 19, 77+opponent.life*9, 26, 11 )
 
 
 // dessiner player + ennemy

 sspr(player.spr_x, player.spr_y, 16, 16, player.x, player.y)
 
 
 sspr(opponent.spr_x, opponent.spr_y, 32, 32, opponent.x, opponent.y,32,32,true)
  if (opponent.life < 0 ) then opponent.life = 0  end

 
 if (player.life == 0 ) then player.life = 0
 	game_over = true
 	round_time = 0
 	opponent.boost = 0
     opponent.block = false
     player.boost = 0
     player.block = false
 	if(game_over == true) then
 	
	
		

  		rectfill(0, 40, 130, 95, 0)
  
    print('the oppenent was to', 30 ,45, 7)
    print('to strong for you', 30 ,55, 7)
    print('upgrade your robot', 30 ,65, 7)
    print('to continue!', 30 ,75, 7)
    print('press c', 78, 88, 7)		
  		if (btn(4))then
   		game_over = false
				end
		end

    if((game_over == false and (player.life==0))) then	
     scene = 16
     player.life=5
     opponent.life=5
     opponent.x = 75
     opponent.boost = 0
     opponent.block = false
     player.boost = 0
     player.block = false
     player.x = 22
     my_attack ={
  first=vide,
  second=vide,
  third = vide,
  fourth=vide,
  fifth = vide
  }
  action_count=0
    end
 end
 

 timecount += 1/60
 
 // animate rounds
 round_time += 1/60
 
 if ( round_time == ((1/60)*60)*2 ) then  opponent.block=false player.boost-=1 end
 if ( round_time == ((1/60)*60)*4 ) then  opponent.block=false player.boost-=1 end
 if ( round_time == ((1/60)*60)*6 ) then  opponent.block=false player.boost-=1 end
 if ( round_time == ((1/60)*60)*8 ) then  opponent.block=false player.boost-=1 end
 if ( round_time == ((1/60)*60)*10 ) then  opponent.block=false player.boost-=1 end
 
 
 
  
 if ( round_time == ((1/60)*60)*3 ) then player.block=false opponent.boost-=1 end
 if ( round_time == ((1/60)*60)*5 ) then player.block=false opponent.boost-=1 end
 if ( round_time == ((1/60)*60)*7 ) then player.block=false opponent.boost-=1 end
 if ( round_time == ((1/60)*60)*9 ) then player.block=false opponent.boost-=1 end
 if ( round_time == ((1/60)*60)*11 ) then player.block=false opponent.boost-=1 end
   
 if (player.boost < 0) then player.boost=0 end 
 if (opponent.boost < 0) then opponent.boost=0 end 
 
 if(player.boost > 0) then sspr(48,16,16,16,player.x,player.y-14) end
 if(player.block == true) then sspr(32,16,16,16,player.x,player.y-14) end
 if(opponent.boost > 0) then sspr(48,16,16,16,opponent.x+8,opponent.y-14) end
 if(opponent.block == true) then sspr(32,16,16,16,opponent.x+8,opponent.y-14) end
      
 // rounds
 if ( round_time < ((1/60)*60)*1 ) then 
  elseif ( round_time < ((1/60)*60)*2 ) then 
  	rectfill(pow.x-1 ,pow.y-1, pow.x+16 ,pow.y+16,10)
  	if(my_attack.first.name=='attack' ) then attack_player() 
 		elseif(my_attack.first.name=='block' ) then block_player()
  	elseif(my_attack.first.name=='boost' ) then upgrade_player() 
  	elseif(my_attack.first.name=='heal' ) then heal_player()
 end
  	
  	elseif ( round_time < ((1/60)*60)*3 ) 
  	then 
  		rectfill(26 ,109, 30 ,115,10)
  	
  	if(opponent.moveset_1 == 'attack') then attack_enemy()
    	elseif(opponent.moveset_1 == 'block') then block_enemy()	
   		elseif(opponent.moveset_1 == 'upgrade') then upgrade_enemy()	end
  
  			elseif ( round_time < ((1/60)*60)*4 ) 
  			then 
  				rectfill(pow.x-1+24 ,pow.y-1, pow.x+16+24 ,pow.y+16,10)
 		if(my_attack.second.name=='attack' ) then attack_player() 
   		elseif(my_attack.second.name=='block' ) then block_player()
    	elseif(my_attack.second.name=='boost' ) then upgrade_player() 
    	elseif(my_attack.second.name=='heal' ) then heal_player()
   end
  	
  			elseif ( round_time < ((1/60)*60)*5 ) 
  then 
  			rectfill( 26+24 ,109, 30+24 ,115,10) 
    	if(opponent.moveset_2 == 'attack') then attack_enemy()
    	elseif(opponent.moveset_2 == 'block') then block_enemy()	
   		elseif(opponent.moveset_2 == 'upgrade') then upgrade_enemy()	end
 
  elseif ( round_time < ((1/60)*60)*6 ) 
  then 
  	rectfill(pow.x-1+24*2 ,pow.y-1,pow.x+16+24*2,pow.y+16,10)
  if(my_attack.third.name=='attack' ) then attack_player() 
 		elseif(my_attack.third.name=='block' ) then block_player()
  	elseif(my_attack.third.name=='boost' ) then upgrade_player() 
  	elseif(my_attack.third.name=='heal' ) then heal_player() 
  end
  	
  elseif ( round_time < ((1/60)*60)*7 ) 
  then 
  	rectfill(26+48,109,30+48,115,10) 
  	if(opponent.moveset_3 == 'attack') then attack_enemy()
    	elseif(opponent.moveset_3 == 'block') then block_enemy()	
   		elseif(opponent.moveset_3 == 'upgrade') then upgrade_enemy()	
   end
  
   elseif ( round_time < ((1/60)*60)*8 ) 
   then
   
  			rectfill(pow.x-1+24*3,pow.y-1,pow.x+16+24*3,pow.y+16,10)
 		if(my_attack.fourth.name=='attack' ) then attack_player() 
   		elseif(my_attack.fourth.name=='block' ) then block_player()
    	elseif(my_attack.fourth.name=='boost' ) then upgrade_player() 
    	elseif(my_attack.fourth.name=='heal' ) then heal_player() 
  	end
  	
   elseif ( round_time < ((1/60)*60)*9 ) 
  	then 
  			rectfill(26+24*3,109,30+24*3,115,10) 
  	if(opponent.moveset_4 == 'attack') then attack_enemy()
    	elseif(opponent.moveset_4 == 'block') then block_enemy()	
   		elseif(opponent.moveset_4 == 'upgrade') then upgrade_enemy()	
 		end
  
   elseif ( round_time < ((1/60)*60)*10 ) 
   then
   
  	rectfill(pow.x-1+24*4,pow.y-1,pow.x+16+24*4,pow.y+16,10)
  
  	if(my_attack.fifth.name=='attack' ) then attack_player() 
   		elseif(my_attack.fifth.name=='block' ) then block_player()
    	elseif(my_attack.fifth.name=='boost' ) then upgrade_player() 
    	elseif(my_attack.fifth.name=='heal' ) then heal_player()
  	end
  	
  elseif ( round_time < ((1/60)*60)*11 ) 
  then 
  	rectfill(26+24*4,109,30+24*4,115,10) 
  	if(opponent.moveset_5 == 'attack') then attack_enemy()
    	elseif(opponent.moveset_5 == 'block') then block_enemy()	
   		elseif(opponent.moveset_5 == 'upgrade') then upgrade_enemy()	
 		end
  
  elseif ( round_time < ((1/60)*60)*12 ) 
  then round_time = 0
 end 
 
 // dessiner les rounds ennmies
 print('>',27,110,8)
 print('>',51,110,8)
 print('>',75,110,8)
 print('>',99,110,8)
 print('>',123,110,8)
 
 //dessiner les rounds player
 for i=0,4 do
 
 	//sspr(pow.spr_x, pow.spr_y, 16, 16, pow.x+(i*24), pow.y)
 	rectfill(pow.x+(24*i), pow.y, pow.x+15+(24*i), pow.y+15,0)
 
 end
 			
 sspr(my_attack.first.spr_x,my_attack.first.spr_y,16,16,8,104)
 sspr(my_attack.second.spr_x,my_attack.second.spr_y,16,16,32,104)
 sspr(my_attack.third.spr_x,my_attack.third.spr_y,16,16,56,104)
 sspr(my_attack.fourth.spr_x,my_attack.fourth.spr_y,16,16,80,104)
 sspr(my_attack.fifth.spr_x,my_attack.fifth.spr_y,16,16,104,104)


 if (opponent.life == 0 ) then 
  opponent.life = 0
 	win = true
 	round_time = 0
 	opponent.boost = 0
     opponent.block = false
     player.boost = 0
     player.block = false
 	if(win == true) then
		
  		rectfill(0, 40, 130, 95, 0)
  
    print('you win the fight', 25 ,45, 7)
    print('upgrade your robot', 25 ,55, 7)
    print('for the next battle!', 25 ,65, 7)
    print('press c', 73 , 85, 7)		
  		if (btn(4))then
   		win = false
				end
		end

    if((win == false and (opponent.life==0))) then	
     scene = 16
     victory += 1
      if (victory == 0) opponent = ennemies.ennemy_1
     if (victory == 1) opponent = ennemies.ennemy_2
     if (victory == 2) opponent = ennemies.ennemy_3
    
     player.life=5
     opponent.life=5
     opponent.boost = 0
     opponent.block = false
     player.boost = 0
     player.block = false
     opponent.x = 75
     player.x = 22
     my_attack ={
  first=vide,
  second=vide,
  third = vide,
  fourth=vide,
  fifth = vide
  }
  action_count=0
    end
 end

end
-->8
function repair()
	
	if(btn(5) and (button_x_activ))then
	sfx(13)
	end
	
	if(btn(4) and (button_y_activ))then
	
	sfx(12)
	end
	
	
	fight_zic=false
 if(main_zic==false)then
     music(002)
     main_zic=true
     end
	
 //fond ecran repair
 cls(1)

 // fond mon combo
 rectfill(3,3,123,36,5)
 rectfill(4,4,122,35,0)


 // fond combo dispo
 rectfill(3,40,123,86,5)
 rectfill(4,41,122,85,0)

 // contour jaune choix
 if (action_count<5) then
 
 	rectfill(22+choice_x*32,43+choice_y*22,39+choice_x*32,60+choice_y*22,10)
 
 end

 for i=0,2 do
  // actions dispos
  rectfill(23+(i*32), 44, 23+(i*32)+15, 44+15,0)
 end

 // display epe
 sspr(epe.spr_x, epe.spr_y, 16, 16,  epe.x, epe.y)
 
 // display bouclier
 sspr(bouclier.spr_x, bouclier.spr_y, 16, 16,  bouclier.x, bouclier.y)
 
 // display upgrade
 
 sspr(upgrade.spr_x, upgrade.spr_y, 16, 16,  upgrade.x, upgrade.y)

 // display heal
 sspr(heal.spr_x, heal.spr_y, 16, 16,  heal.x, heal.y)

 // display other
 sspr(other.spr_x, other.spr_y, 16, 16,  other.x, other.y)
 
 // display helpp
 sspr(helpp.spr_x, helpp.spr_y, 16, 16,  helpp.x, helpp.y)


 // fond info actions
 rectfill(3,90,80,124,5)
 rectfill(4,91,79,123,0)
 print('<         >',21,92,8 )


 // dessine  start

 if (action_count==5) then
 	rectfill(87,90,123,124,10)
 	rectfill(88,91,122,123,0)
 	print('press x  ',92,92,10 )
 print('to start',90,118,10 )
 sspr(player.spr_x,player.spr_y,16,16,98,98)
	
	
 else 
 
 	rectfill(87,90,123,124,5)
 	rectfill(88,91,122,123,0)
 end


 

 

 // dessine ton combo
 for i=0,4 do
 	rectfill( 9+(i*23), 10,9+(i*23)+15, 10+15,0 )
 	print('act'..i+1,9+(i*23),28,8 )
 end
 // dessine combo inutilisable
 //for i=3,4 do
 //	rectfill( 9+(i*23), 10,9+(i*23)+15, 10+15,5 )
 //print('act'..i+1,9+(i*23),28,5 )
 //end








	// choice manager


 // choice epe
 if ((choice_x == 1) and (choice_y == 1)) then
  select_combo = epe.name
  texte_info_l1 = epe.info_l1
  texte_info_l2 =epe.info_l2
  texte_info_l3 =epe.info_l3
 end

 // choice bouclier
 if ((choice_x == 1) and (choice_y == 0)) then
  select_combo = bouclier.name
  texte_info_l1 = bouclier.info_l1
  texte_info_l2 =bouclier.info_l2
  texte_info_l3 =bouclier.info_l3
 end

 // choice upgrade
 if ((choice_x == 2) and (choice_y == 0)) then
  select_combo = upgrade.name
  texte_info_l1 = upgrade.info_l1
  texte_info_l2 =upgrade.info_l2
  texte_info_l3 =upgrade.info_l3
 end

 // choice heal
 if ((choice_x == 0) and (choice_y == 1)) then
  select_combo = heal.name
  texte_info_l1 = heal.info_l1
  texte_info_l2 =heal.info_l2
  texte_info_l3 =heal.info_l3
 end

 // choice other
 if ((choice_x == 2) and (choice_y == 1)) then
  select_combo = other.name
  texte_info_l1 = other.info_l1
  texte_info_l2 =other.info_l2
  texte_info_l3 =other.info_l3
 end

 // choice helpp
 if ((choice_x == 0) and (choice_y == 0)) then
  select_combo = helpp.name
  texte_info_l1 = helpp.info_l1
  texte_info_l2 =helpp.info_l2
  texte_info_l3 =helpp.info_l3
 end


 print(select_combo,30,92,8 )
 print(texte_info_l1,7,100,8)
 print(texte_info_l2,7,106,8)
 print(texte_info_l3,7,112,8)



 //initialize le timer 
 choice_time += 1/60

 // appuyer sur x pour changer de scene
 //if (btn(4))then
 //scene = 0
 //end 
 if (action_count<5) then
  //fleche gauche
  if (btn(0) and (choice_act==false) and (choice_time >0.00001)) then 
   choice_time=0
   choice_x += -1 
   choice_act=true
 	end
 
  //fleche droite
  if (btn(1) and (choice_act==false) and (choice_time >0.00001)) then 
   choice_time=0
   choice_x += 1 
   choice_act=true
 	end
 
  //fleche bas
  if (btn(2) and (choice_act==false) and (choice_time >0.00001)) then 
   choice_time=0
   choice_y += 1 
   choice_act=true
  end
 
  //fleche haut
  if (btn(3) and (choice_act==false) and (choice_time >0.00001)) then 
   choice_time=0
   choice_y += -1 
   choice_act=true
  end
 end
 
 // limite de temps entre selection 
 if ( choice_time > 0.2 ) then choice_time=0 choice_act=false  end
 if(choice_x>2)then choice_x=0 end
 if(choice_x<0)then choice_x=2 end
 if(choice_y>1)then choice_y=0 end
 if(choice_y<0)then choice_y=1 end


 // button x manager
 button_x_time+= 1/60

 //helper manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==0)
  and (choice_y==0) then 
  button_x_activ = false
  button_x_time=0
  helper=not helper
  
 end




 sspr(my_attack.first.spr_x,my_attack.first.spr_y,16,16,9,10)
 sspr(my_attack.second.spr_x,my_attack.second.spr_y,16,16,32,10)
 sspr(my_attack.third.spr_x,my_attack.third.spr_y,16,16,55,10)
 sspr(my_attack.fourth.spr_x,my_attack.fourth.spr_y,16,16,78,10)
 sspr(my_attack.fifth.spr_x,my_attack.fifth.spr_y,16,16,101,10)


 //button select action


 //affiche helper
 if (helper==true) then 
  rectfill(3,3,123,125,5) 
  choice_act=true
 
  // code du helper :
  print('here, you can fix your ',15, 17, 7)
 	print('mistake and perform your',15, 26, 7)
 	print('combos',15, 36, 7)
 	print('x : add this action to',15, 50, 7)
 	print('your combo',15, 57, 7)
 	print('c : remove an action from',15, 71, 7)
 	print('your combo',15, 79, 7)
 	print('⬅️⬇️⬆️➡️:select an action',15, 95, 7)
 	print('press x to continue', 15, 108, 7) 
 
 // fin code helper
 end
 
 add_button_manager()
 
 if (btn(5) and (first_info==false) )then
		first_info=true
	end

 if (first_info==false) then
   //print
   rectfill(3,4,123,85,5)
   print('you get destroy by your',15,10, 7)
   print('oppenent !',15,20, 7)
   print('notice that each enemy',15,30, 7)
   print('got his own combo.',15,40, 7)
   print('you should go to your',15,50, 7)
   print('workshop to fix your',15,60, 7)
   print('combo...',15,70, 7)
   print('press x',90,74, 7)

 end

end
-->8
function add_button_manager()
 
 if (action_count==5) then
 	if (btn(5)
   and (button_x_activ==true)) then 
   button_x_activ = false
   button_x_time=0 
   scene=0
 	end
 	
 	else
 	
 	
 end
 
 //epe boutton manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==1)
  and (choice_y==1) then 
  
  button_x_activ = false
  button_x_time=0
  
  if (action_count==0) then my_attack.first=epe end
  if (action_count==1) then my_attack.second=epe end
  if (action_count==2) then my_attack.third=epe end
  if (action_count==3) then my_attack.fourth=epe end
  if (action_count==4) then my_attack.fifth=epe end
  action_count+=1
 end
 
 //bouclier boutton manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==1)
  and (choice_y==0) then
  
  button_x_activ = false
  button_x_time=0
   
  if (action_count==0) then my_attack.first=bouclier end
  if (action_count==1) then my_attack.second=bouclier end
  if (action_count==2) then my_attack.third=bouclier end
  if (action_count==3) then my_attack.fourth=bouclier end
  if (action_count==4) then my_attack.fifth=bouclier end
  action_count+=1
 end
 
 //upgrade boutton manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==2)
  and (choice_y==0) then
  
  button_x_activ = false
  button_x_time=0
   
  if (action_count==0) then my_attack.first=upgrade end
  if (action_count==1) then my_attack.second=upgrade end
  if (action_count==2) then my_attack.third=upgrade end
  if (action_count==3) then my_attack.fourth=upgrade end
  if (action_count==4) then my_attack.fifth=upgrade end
  action_count+=1
 end
 
 //heal boutton manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==0)
  and (choice_y==1) then
  
  button_x_activ = false
  button_x_time=0
  
  if (action_count==0) then my_attack.first=heal end
  if (action_count==1) then my_attack.second=heal end
  if (action_count==2) then my_attack.third=heal end
  if (action_count==3) then my_attack.fourth=heal end
  if (action_count==4) then my_attack.fifth=heal end
  action_count+=1
 end
 
 //other boutton manager
 if (btn(5)
  and (button_x_activ==true))
  and (choice_x==2)
  and (choice_y==1) then
  
 // button_x_activ = false
 // button_x_time=0
  
 // if (action_count==0) then my_attack.first=other end
 // if (action_count==1) then my_attack.second=other end
 // if (action_count==2) then my_attack.third=other end
 // if (action_count==3) then my_attack.fourth=other end
 // if (action_count==4) then my_attack.fifth=other end
 // action_count+=1
 end
 
 if ( action_count < 0) then action_count=0 end
 
 
 //button x timer limit
 if (button_x_time > 0.4) then 
  button_x_time=0
  button_x_activ = true
 end
 
 
 
 // button y manager
 button_y_time+= 1/60
 
 if (btn(4)
  and (button_y_activ==true)) then
   
  button_y_activ = false
  button_y_time=0 
  action_count-=1
  
  if (action_count == 0)then my_attack.first=vide end
  if (action_count == 1)then my_attack.second=vide end
  if (action_count == 2)then my_attack.third=vide end
  if (action_count == 3)then my_attack.fourth=vide end
  if (action_count == 4)then my_attack.fifth=vide end
 
 end
 
 
 
 
 //button y timer limit
 if (button_y_time > 0.7) then 
  button_y_time=0
  button_y_activ = true
 end

end
-->8
// enemy's actions
function attack_enemy()

  if (timecount== (1/60)*9)then
  sfx(16)
   if ((player.block==true) and (opponent.boost==0) ) then
    elseif ((player.block==true) and (opponent.boost>0)and (player.boost>0 )) then 
    elseif ((player.block==true) and (opponent.boost>0) and (player.boost==0) ) then player.life-=1
    else player.life-=1
   end 
  end

 if(action_enemy==true) then 
 	 action_enemy=false
 	 timecount = 0
 end
 
 if (timecount< 0.1)then opponent.x += -7 
 	  elseif (timecount< 1)then
 	  opponent.x += 2 
 	  if (opponent.x > 75) then opponent.x = 75 end
   	  else action_enemy=true
 	  end
 end
 

function block_enemy()

 if (action_enemy==true) then
  timecount=0
  action_enemy = false
  opponent.block =true
 end

	if (timecount > 1) then 
	sfx(17)
	action_enemy = true end

end

function upgrade_enemy()

 if (action_enemy==true) then
  timecount=0
  action_enemy = false
  opponent.boost +=2
 end

 if (timecount > 1)then
 sfx(18)
  action_enemy = true
 end

 if (opponent.boost > 2) then opponent.boost = 2 end
 end


// player actions

function attack_player()


  if (timecount == (1/60)*9)then  
   sfx(16)
   if ((opponent.block==true) and (player.boost==0) ) then
    elseif ((opponent.block==true) and (player.boost>0)and (opponent.boost>0) ) then 
    elseif ((opponent.block==true) and (player.boost>0) and (opponent.boost==0) ) then opponent.life-=1
    else opponent.life-=0.5
   end 
  end

  if(player.action==true) then 
  	 player.action=false
  	 timecount = 0
  end
  
  if (timecount< 0.1)then player.x += 7 
  	  elseif (timecount< 1)then
  	   player.x += -2 
  		if (player.x < 22) then player.x = 22 end
  	  else player.action=true
  end

end


function block_player()

  if (player.action==true) then
   timecount=0
   player.action = false
   player.block=true
  end

		if (timecount > 1)then 
			sfx(17)
		player.action = true end

end

function upgrade_player()

  if (player.action==true) then
    timecount=0
    player.action = false
    player.boost+=2
  end

  if (timecount > 1)then
  sfx(18)
  	player.action = true 
  end

end

function heal_player()

  if (player.action==true) then
    timecount=0
    player.action = false
    player.life+=0.5
  if(player.life > 5) then player.life=5 end

end

  if (timecount > 1)then
  sfx(15)
   player.action = true end

end
__gfx__
00000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000005000000000000005500000000000000550000000000000055000000000000005500000000000000550000000000000055111111111111115
000000000000000050000000000000055000000550000005500000077000000550000777777000055000000000000005500044444499a0055111111111111115
00c6c6c66c660000500000000005500550000556855000055000007bb7000005500007bbbb70000550000000000000055004f4fffff990055111111111111115
00c5ccccccc6000050000000005560055005566688855005500007b77b700005500007bbbb70000550000000000000055004f4fffffff0055111111111111115
00c5c5cc55c600005000000005560005500666668888800550007b7007b70005507777bbbb77770550000000000000055004f4fffffff0055111111111111115
00c5ccccccc60000500000005560000550066666888880055007b700007b7005507bbbbbbbbbb70550000000000000055004f4fffffff0055111111111111115
00c566c666c6600050000005560000055006666cc8888005507b70077007b705507bbbbbbbbbb70550000000000000055004f4fffffff0055111111111111115
000c5ccccccc600050009055600000055008888cc66660055077007bb7007705507bbbbbbbbbb70550000000000000055004f4fffff990055111111111111115
005c5ccccccc600050000956000000055008888866666005500007b77b700005507bbbbbbbbbb7055000000000000005500444444499a0055111111111111115
050c5ccccccc65005000049000000005500588886666500550007b7007b70005507777bbbb777705500000000000000550046666667770055111111111111115
05011cc1cc1c6500500040090000000550005888666500055007b700007b7005500007bbbb700005500000000000000550046886666670055111111111111115
ccc0111011116cc0500400000000000550000588665000055007700000077005500007bbbb700005500000000000000550004444444440055111111111111115
ccc0550005500cc55000000000000005500000555500000550000000000000055000077777700005500000000000000550000000000000055111111111111115
50501c0001cc00505000000000000005500000000000000550000000000000055000000000000005500000000000000550000000000000055111111111111115
0001ccc0011cc0005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
66666666000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666000111008888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666000111000000000000000000000000055000000000000007700000000000000000000000000000000000000000000000000000000000000000000000
6666666601111111000000000000000000000556855000000000007bb70000000000000000000000000000000000000000000000000000000000000000000000
666666660111111100000000000000000005566688855000000007b77b7000000000000000000000000000000000000000000000000000000000000000000000
66666666011111dd0000000000000000000666668888800000007b7007b700000000000000000000000000000000000000000000000000000000000000000000
88866888011111dd000000000000000000066666888880000007b700007b70000000000000000000000000000000000000000000000000000000000000000000
88866888011111dd00000000000000000006666cc8888000007b70077007b7000000000000000000000000000000000000000000000000000000000000000000
888668880111111d00000000000000000008888cc66660000077007bb70077000000000000000000000000000000000000000000000000000000000000000000
888668880111111d00000000000000000008888866666000000007b77b7000000000000000000000000000000000000000000000000000000000000000000000
888668880111111d0000000000000000000588886666500000007b7007b700000000000000000000000000000000000000000000000000000000000000000000
888668880111111d000000000000000000005888666500000007b700007b70000000000000000000000000000000000000000000000000000000000000000000
888668880111111d0000000000000000000005886650000000077000000770000000000000000000000000000000000000000000000000000000000000000000
888668880111111d0000000000000000000000555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
888668880111111d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
888668880111111d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004444f4444fffff44444fffffffffffff
0000000000000000000000000000000000000000000000000000000000000000000000000000006666666600000000004f4f4f4f4ffff4f4f4f4f4444ff44444
000000000000000000000dd00000000005000000000011ddddd000000000000000000000000000686868660000000000ffff4ffff44444fffff44ffff4f4fff4
00000000000ddddd0000ddddd00000005d5000000111dddddddd00000000000000000000000003383838330000000000ff4f4ff4f4fff44f4f4444f4f4ff4f4f
0000000005556dddd000dddddd0000005dd5000001ddddddddddd0000000000000000000000003383838330000000000f44444ff4f4f44f444ffff4ff4f4fff4
00000000056666ddd00056666600000005dd500001dddddddddddd0000000000000000000000066668666600000000004fffff4f4ffff4fff4f4f44444f4f4f4
000000000588666ddd00588688000000005dd50001ddd88dddd88d0000000000000000000000066668660000000000004f4f4f4f4ff4f4fff4ffff4fffff444f
0000000066666666dd066666660000000005dd5001111ddddddddd0000000000000000003333000666660033330000004fffff4f4ffff4fff4ff4f4f44444fff
0000000066666666dd0666666600000000005d55000000ddddddd50000000000000000000530000666660005300000004ff4ff444f4444444ffffff4fffff4ff
0000000005665566000056655600000000000556666555dddddd55000000000000000000333300050050003333000000444ff4fff4fff4ffff444ff4f4f4f4ff
0000000005566666000566666600000000000566666555d000d550411000000000000000555550050050055555000000fff4f44f4f4f4f4ff4fff4f4fffff4ff
0000000000056600000566666000000006767766116555ddddd5004166660000000000056666566666666566665000004f4f44ffff4fff4f4f4f4f4f444444ff
000000005555660000005555000000007666676611655555566644416666660000000005111156666666651111500000ffff4ff44f4f44ff4fffff4f4fffff4f
000005666655555555005665500000007466476666655555566644416666660000000005666650666666056666500000f4ff4ff44f4fff4f4f444f4f4f4f4f4f
00000566665d6666666666222000000076666766644446666666660055d500000000000566665066666605666650000044444ffff4ff4444fff444444fffff4f
0000056665dd6666666662eee2200000071160655dd444466666666055d50000000000055555003333330055555000004f4f444444ffffff4f4fffff4ff4ff4f
0000056665dd6666666662eeeee20000066640655dddd4444666666055d5000000000333330000005300000333330000ffff4fffff4f4f4f4f4f4f4f444444ff
00000556000dd66666660055666000000044400055ddddd4444666600444000000000035000000033333000005300000f4f4ff4f4f4fffff4f4fffff4f4f4f4f
0000555600005555555550556660000000444000055dddddd44446600444440000333333000000005300000033333000fff4ffffff4f444444f444444fffff4f
00055566005556665566600555000000004440000055ddddddd4444004444400000350000000003333300000005300004444fff4ff44f4f4f4fffffff4f4ff4f
0005566600555666556660555500e0e0004440044044ddddddddd4400444440033333011111000053000111110333333fffff4444444fffff4ff4f4ff444444f
0055660000555556666000555550e0e0001166644044404405554040ddd5ddd0035001666661033333017666600005304f4f4fffff44ff4ff4fffffff4ffff4f
0ddd000002eee7e6666eeee0265eeee00011666dddd4404405554040ddd5ddd033330166666101111101766660003333fff4f4f4f44f444444fff4fff4f4f4f4
ddd0000002eee7eeeeeee700265eee001116666666ddaaaaaa666660ddd55dd030030166666116666611176660003003f4f4fffff4ff4ffff444444ff4fffff4
dddd00000256667eeeeeee72026ee0001116666666dddaaaa6666660d5dd5dd030030166666116666611176666003003fff4f4ff4ff4fffff4ffff44f4ff4ff4
d7ddd0000560606022eeeee200ee00001116611116dddaaa665dddd0d5555d0000000044444111111111444444000000444444444ff4f4f4f4f4f44444444444
dd7ddd000566666002555500000000001116616616ad00006550dd0000ddd00000000055660000000000055660000000ff4fffff4ff4fffff4ffff4fffff4fff
0dd7ddd00e55560000666000000000000116611616ad0000055dddd00000000000000055660000000000055660000000f4444f444ff4ff4ff4ff4f4f4f4f4fff
00dd7ddd0eeee500006600000000000001166666aa000000066666600000000000000055600000000000055566000000ff4ff4ff4444444f44444f4fffff44f4
000ddddddeeee00005665000000000000006666ddd5000000066660000000000000005556600000000000555660000004444444444fffff4fffff44fff4f4fff
00000002ee5555000555566000000000000000dddddd0000000666660000000000000550666000000000050660000000f4f4f4f4f4f4f4f4f4f4f44444444f4f
0000000225555500055555660000000000000dddd0dd0000000666660000000000000550666000000000050666000000fff4fffff4fffff4ff4ff4ffffff4444
0077aaaaaaaa00000007aaaaaaaaa0000077aa000077aa00000aaaaaaaaaa000000000aaaa000000007777777700000000000000000000000000000000000000
aa77aaaaaaaaa0000aaaaaaaaaaaaaa00077aa000077aa00007aaaaaaaaaaa00000000aaaa000000070000000070000000000000000000000000000000000000
aaaaaaaaaaaaa000099999aaaa9999900aaaaa0000aaaaa0077aaaaaaaaaaaa0000000aaaa000000700800008007000000000000000000000000000000000000
aaa999999999000000000aaaaaa000000aaaaa0000aaaaa009999aaaaaa99990000000aaaa000000700800008007000000000000000000000000000000000000
aaa000000000000000000aaaaaa000000aaaaaa00aaaaaa000000aaaaaa00000000000aaaa000000700080080007000000000000000000000000000000000000
aaaaaaa00000000000000aaaaaa000000aaaaaaaaaaaaaa000000aaaaaa00000000000aaaa000000700008800007000000000000000000000000000000000000
aaaaaaaa0000000000000aaaaaa000000aaaaaaaaaaaaaa000000aaaaaa00000000000aaaa000000700080080007000000000000000000000000000000000000
aaaa99990000000000000aaaaaa0000000aaaaaaaaaaaa0000000aaaaaa00000000000aaaa000000700800008007000000000000000000000000000000000000
aaaa00000000000000000aaaaaa00000000aaaaaaaaaa00000000aaaaaa00000000000aaaa000000700800008007000000000000000000000000000000000000
aaaa00000000000000000aaaaaa0000000aaaaaaaaaaaa0000000aaaaaa00000000000aaaa000000070000000070000000000000000000000000000000000000
aaaa00000000000000000aaaaaa000000aaaaaaaaaaaaaa000000aaaaaa00000000000aaaa000000007777777700000000000000000000000000000000000000
aaaa00000000000000000aaaaaa000000aaaaaa99aaaaaa000000aaaaaa00000000000aaaa000000000000000000000000000000000000000000000000000000
aaaa00000000000000000aaaaaa000000aaaaa9009aaaaa000000aaaaaa000000000009999000000000000000000000000000000000000000000000000000000
aaaa00000000000000aaaaaaaaaaaa000aaaa900009aaaa000000aaaaaa000000000000000000000000000000000000000000000000000000000000000000000
aaaa00000000000000aaaaaaaaaaaa000aaa90000009aaa000000aaaaaa00000000000aaaa000000000000000000000000000000000000000000000000000000
99900000000000000009999999999000009990000009990000000999999000000000009999000000000000000000000000000000000000000000000000000000
0077777777000000c111111c06000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007000001000000166000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70008888800700001000000166000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70080000000700001000000166666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70080000000700001000000166666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70080000000700001000000106656600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70080000000700001000000100656000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7008000000070000c111111c00656000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70008888800700000000000000656000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007000000000000000656000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777770000000000000000656000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000006666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066000660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000006000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000ffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000ffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000ffff0000000000000000000000000000000000000000000000000000000000000000
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000
__label__
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555557777777577777775555575755775555577777775777777755555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555575757555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555557777777577777775555575757775555577777775777777755555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555577755575555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555557777777577777775555557557755555577777775777777755555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555777555555775555577755555555555555555555555555555555555555555555555555555557775757555557575777555555555555555555555555555
55555555757555557575555575755555555555555555555555555555555555555555555555555555555575757555557575557555555555555555555555555555
55555555775555557575555577555555555555555555555555555555555555555555555555555555555755575577757775777555555555555555555555555555
55555555757555557575555575755555555555555555555555555555555555555555555555555555557555757555555575755555555555555555555555555555
55555555777557557755575577755555555555555555555555555555555555555555555555555555557775757555555575777555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55111111111111111111111111111111111111111111111111115555555555555555555555551111111111111111111111111111111111111111111111111555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
551bbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000015555555555555555555555551bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb01555
55111111111111111111111111111111111111111111111111115555555555555555555555551111111111111111111111111111111111111111111111111555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000ddddd0000ddddd00000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddd000dddd6555000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000666665000ddd66665000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000088688500ddd666885000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000066666660dd6666666600000000000000000000000000000
00000000000010000000000000000000000000000000000000000000000000000000000000000000066666660dd6666666600000000000000000100000000000
00000000000111000000000000000000000000000000000000000000000000000000000000000000065566500006655665000000000000000001110000000000
00000000000111000000000000000000000000000000000000000000000000000000000000000000066666650006666655000000000000000001110000000000
00000000011111110000000000000000000000000000000000000000000000000000000000000000006666650000066500000000000000000111111100000000
00000000011111110000000000000000000000000000000000000000000000000000000000000000000555500000066555500000000000000111111100000000
00000000011111dd000000000000000000000000000000000000000000000000000000000000000000556650055555555666650000000000011111dd00000000
00000000011111dd0000000000000000000000000000000000000000000000000000000000000000002226666666666d5666650000000000011111dd00000000
00000000011111dd000000000000000000000000000000000000000000000000000000000000000022eee2666666666dd566650000000000011111dd00000000
4444f4444111111d444fffffffffffff4444f4444fffff44444fffffffffffff4444f4444fffff42eeeee2666666666dd56665444fffff444111111dffffffff
4f4f4f4f4111111d888888888888888888888888888888888888888888888888888888888888888866655886666666dd8886558888888888f111111d4ff44444
ffff4ffff111111dfff44ffff4f4fff4ffff4ffff44444fffff44ffff4f4fff4ffff4ffff44444ff66655f5555555554fff6555ff44444fff111111df4f4fff4
ff4f4ff4f111111d4f4444f4c6c6c66c664f4ff4f4fff44f4f4444f4f4ff4f4fff4f4ff4f4fff44f45554466655666555f466555f4fff44f4111111df4ff4f4f
f44444ff4111111d44ffff4fc5ccccccc64444ff4f4f44f444ffff4ff4f4fff4f44444ff4f4fe4e445555f6665566655544666554f4f44f44111111df4f4fff4
4fffff4f4111111df4f4f444c5c5cc55c6ffff4f4ffff4fff4f4f44444f4f4f44fffff4f4fffe4ef55555444666655555ffff6655ffff4fff111111d44f4f4f4
4f4f4f4f4111111df4ffff4fc5ccccccc64f4f4f4ff4f4fff4ffff4fffff444f4f4f4f4f4ff4eeee562feeee6666e7eee24f4f4dddf4f4fff111111dffff444f
4fffff4f4111111df4ff4f4fc566c666c66fff4f4ffff4fff4ff4f4f44444fff4fffff4f4ffffeee562f47eeeeeee7eee2ffff4fdddff4fff111111d44444fff
4ff4ff444111111d4ffffff4fc5ccccccc64ff444f4444444ffffff4fffff4ff4ff4ff444f4444ee62f27eeeeeee766652f4ff4dddd444444111111dfffff4ff
444ff4fff111111d888888885c5ccccccc688888888888888888888888888888888888888888888ee882eeeee2286868658888ddd7d88888f111111df4f4f4ff
fff4f44f4111111df4fff4f5fc5ccccccc65f44f4f4f4f4ff4fff4f4fffff4fffff4f44f4f4f4f4ff4fff55552ff666665f4fddd7ddf4f4ff111111dfffff4ff
4f4f44fff111111d4f4f4f45411cc1cc1c6544ffff4fff4f4f4f4f4f444444ff4f4f44ffff4fff4f4f4f4f66644446555e4fddd7dd4fff4f4111111d444444ff
ffff4ff44111111d4fffffcccf111f11116ccff44f4f44ff4fffff4f4fffff4fffff4ff44f4f44ff4fffff466ffff5eeeefddd7ddf4f44ff4111111d4fffff4f
f4ff4ff44111111d4f444fcccf554f4554fcc5f44f4fff4f4f444f4f4f4f4f4ff4ff4ff44f4fff4f4f444f56654f4feeeedddddd4f4fff4f4111111d4f4f4f4f
44444ffff111111dfff444545f1cff41cc445ffff4ff4444fff444444fffff4f44444ffff4ff4444fff4665555fff5555ee24ffff4ff4444f111111d4fffff4f
4f4f44444111111d4f4fffff41cccf411ccf444444ffffff4f4fffff4ff4ff4f4f4f444444ffffff4f46655555f4f5555522444444ffffff4111111d4ff4ff4f
ffff4fff6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666444444ff
f4f4ff4f66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666664f4f4f4f
fff4ffff66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666664fffff4f
4444fff46666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666f4f4ff4f
fffff4446666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666f444444f
4f4f4fff6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666f4ffff4f
fff4f4f48886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888f4f4f4f4
f4f4ffff8886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888f4fffff4
fff4f4ff8886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888f4ff4ff4
44444444888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688844444444
ff4fffff8886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888ffff4fff
f4444f4488866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668884f4f4fff
ff4ff4ff8886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888ffff44f4
444444448886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888ff4f4fff
f4f4f4f4888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688844444f4f
fff4ffff8886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888ffff4444
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555555555555555555555555555555555555555555555555555aaaaaaaaaaaaaaaaaa5555555555555555555555555555555555555555555555555555555
5555555555555555555555555555555555555555555555555555555a5555555555555555a5555555555555555555555555555555555555555555555555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155558555551111111111111155558555a5111111111111115a5585555511111111111111555585555511111111111111555585555
5555555551111111111111155555855551111111111111155555855a5111111111111115a5558555511111111111111555558555511111111111111555558555
5555555551111111111111155555585551111111111111155555585a5111111111111115a5555855511111111111111555555855511111111111111555555855
5555555551111111111111155555855551111111111111155555855a5111111111111115a5558555511111111111111555558555511111111111111555558555
5555555551111111111111155558555551111111111111155558555a5111111111111115a5585555511111111111111555585555511111111111111555585555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555551111111111111155555555551111111111111155555555a5111111111111115a5555555511111111111111555555555511111111111111555555555
5555555555555555555555555555555555555555555555555555555a5555555555555555a5555555555555555555555555555555555555555555555555555555
5555555555555555555555555555555555555555555555555555555aaaaaaaaaaaaaaaaaa5555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

__map__
3232323232323232323232323232323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3232323232323232323232323232323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3232323232323232323232323232323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3232323232323232323232323232323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a32323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a323200000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a322a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a212a2a2a2a2a2a2a2a002a3232212a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a31222222222222222222222222312a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a31222222222222222222222222312a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a20202020202020202020202020202a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a30303030303030303030303030302a00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e00000000000000000000000000000000a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e000000000000000000000000000000bba2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e000000000000000000000000000000bba2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a22a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a002a2a2a2a2a2a382a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a00002a2a2a2a38382a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a002a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a002a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a00002a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a00002a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001307300000000000c0003e633000000000000000130730000013073000003e633000000000000000130730000000000000003e633000001307300000130730000013073106003e633100001000000000
001000001805015050000000000000000000001300015050000000000000000000000000000000130501500018050150500000000000000000000000000150500000000000000001300013050130501305013050
001000000932009320093200932009320093200932009320000000000000000000000000000000000000000000000000000000000000000000000000000000000b3200b3200b3200b3200b3200b3200b3200b320
0010000021150000001f1500000000000000001f15000000000001f15000000000000000000000000000000021150000001f1500000000000000001f15000000000001f150000000000021150000000000000000
0010000021150000001f1500000000000000001f15000000000001f15000000000000000000000000000000021150000001f1500000000000000001f150000001f150000001f1500000021150000000000000000
00100000130730000000000130733e633000003e63300000130730000013073000003e633000000000000000130730000000000000003e633000001307300000000000000013073000003e633000000000000000
00100000151501315011150101500e1500c1500c1500c15000000000000000000000000000000000000000000c1500e1501015011150131501515015150151500c1000e100101001110013100151001510015100
00100000151501315011150101500e1500c1500c1500c150151501315011150101500e1500c1500c1500c1500c1500e1501015011150131501515015150151500000000000000000000000000000000000000000
00100000211501f1501d1501c1501a1501815018150181500000000000000000000000000000000000000000181501a1501c1501d1501f1502115021150211500000000000000000000000000000000000000000
00100000211501f1501d1501c1501a150181501815018150211501f1501d1501c1501a150181501815018150181501a1501c1501d1501f1502115021150211501800018000180001800018000180001800018000
001000000c770107700c770107700c770107700c770107700d7700f7700d7700f7700d7700f7700d7700f7700c770107700c770107700c770107700c7700d7700f7700d7700f7700d7700f7700d7700f77000000
000900002114024150281000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009000026150231501a6000160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002115000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000e0500d0500d0500e0500e0500f0500f05010050120501305015050180501b0501e0502005022050230502505027050290502a0502b0502d0502e0503005031050330503405035050360503705037050
000500001a670126700c6700767003670016700167002600016000160001600016000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001e570195701657013570115700f5700d5700c5700b5700a5700957009570095700857008570085700857009570095700b5700c5700d5700e5700f5701057012570145701557016570175701857019570
000100002815025150221501f1501d1501c1501b1501a1501a1501a1501a1501a1501a1501a1501b1501b1501d1501d1501d1501e1501f150201502115022150241502615027150291502c150311503715035150
__music__
00 01424344
00 01424344
01 01024344
00 01024344
00 01020344
00 01020344
00 01020344
00 01020344
00 01020304
00 01020304
00 01020304
00 01020305
00 06424344
00 06424344
00 06074344
00 06084344
00 06070944
02 06080a44
03 0b424344

