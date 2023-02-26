0DeS1C%32:DeS1Sp512:BmEn(16):IkWht:ClBl:PstC#t=(ScHg-(((16*3))))/2:PstC#l=(ScWd-((16*3)))/2:b=NwIm(16,16)
1c=NwIm(16,16):r=NwIm(16,16):Dr4,4To12,12:Dr12,4To4,12:IkRe:Ci24,8,4:GeImb Fm32,32:GeImc Fm0,0:GeImr Fm16,0:Do:ClBl:Hm
2Gs9:IkRe:Ce"10 LINER":Ce"TIC-TAC-TOE!":?:IkWht:Lc0,ScRws-1:Ce"1...9 To PLAY";:p=(Wo)0:p1=(Wo)0:p2=(Wo)0:w1=0:w2=0
3Bxl-5,t-8Tol+(16*3)+5,t+(16*3)+8:Do:k=Va(Iky):Ifk>0Th:Dck:If(p An(2^k))=0Th:p=(p OR(2^k)):Ifq=1Th:p1=(p1 OR(2^k)):El
4p2=(p2 OR(2^k)):Ei:Adq,1,1To2:Gs9:Ei:Ei:Foy=0To2:Fox=0To2:k=y*3+x:If(p1 An(2^k))>0Th:PuImc Atl+x*16,t+y*16
5Eif(p2 An(2^k))>0Th:PuImr Atl+x*16,t+y*16:El:PuImb Atl+x*16,t+y*16:Ei:Nx:Nx:w1=(p1=7)+(p1=56)+(p1=448)+(p1=292)
6w1=w1+(p1=146)+(p1=73)+(p1=273)+(p1=84)+(p1=49)+(p1=92)+(p1=124):w2=(p2=7)+(p2=56)+(p2=448)+(p2=292)+(p2=146)
7w2=w2+(p2=73)+(p2=273)+(p2=84)+(p2=49)+(p2=92)+(21=124):net=(p=511):ExIf(w1<>0)OR(w2<>0)OR(net<>0):Lp:ClBl:Ifw1 Th:Cl
8Lc0,2:Ce"PLAYER 1 WINS!":Ei:Ifw2 Th:Cl:Lc0,2:Ce"PLAYER 2 WINS!":Ei:Ifnet Th:Cl:Lc0,2:Ce"NO ONE WINS!":Ei:Wt4000MS:Lp
9Ifq=1 Th:PuImb AtScWd-16,t:PuImc At0,t:El:PuImb At0,t:PuImr AtScWd-16,t:Ei:Rt
