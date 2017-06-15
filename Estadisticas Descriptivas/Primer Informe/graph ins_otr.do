cap drop ins_otr1_0 ins_otr1_1 ins_otr1_2 ins_otr1_3 ins_otr1_4 ins_otr1_5 ins_otr1_6 ins_otr1_7 ins_otr1_8
gen ins_otr1_0=. 
replace ins_otr1_0=1 if ins_otr1==0
replace ins_otr1_0=0 if ins_otr1!=0
gen ins_otr1_1=. 
replace ins_otr1_1=1 if ins_otr1==1
replace ins_otr1_1=0 if ins_otr1!=1
gen ins_otr1_2=. 
replace ins_otr1_2=1 if ins_otr1==2
replace ins_otr1_2=0 if ins_otr1!=2
gen ins_otr1_3=. 
replace ins_otr1_3=1 if ins_otr1==3
replace ins_otr1_3=0 if ins_otr1!=3
gen ins_otr1_4=. 
replace ins_otr1_4=1 if ins_otr1==4
replace ins_otr1_4=0 if ins_otr1!=4
gen ins_otr1_5=. 
replace ins_otr1_5=1 if ins_otr1==5
replace ins_otr1_5=0 if ins_otr1!=5
gen ins_otr1_6=. 
replace ins_otr1_6=1 if ins_otr1==6
replace ins_otr1_6=0 if ins_otr1!=6
gen ins_otr1_7=. 
replace ins_otr1_7=1 if ins_otr1==7
replace ins_otr1_7=0 if ins_otr1!=7
gen ins_otr1_8=. 
replace ins_otr1_8=1 if ins_otr1==8
replace ins_otr1_8=0 if ins_otr1!=8

 graph bar (mean) ins_otr1_0 ins_otr1_1 ins_otr1_2 ins_otr1_3 ins_otr1_4 ins_otr1_5 ins_otr1_6 ins_otr1_7 ins_otr1_8, over(serv_cent)
replace obt_tit1=0 if obt_tit1==2
 graph bar (mean) obt_tit1 if obt_tit1!=. & ins_otr1_1==1, over(serv_cent) stack bargap(0)
