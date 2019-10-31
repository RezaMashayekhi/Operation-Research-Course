set
         i /1,2/
         j/1,2/
         k/1*3/
;
free variable
         z
;

positive variable
         n(i,j), b(j), s(k), y(i)
;
equation
         cost
         benzin(j)
         mojoodi1
         mojoodi2
         t1
         t2
         kharid(k)
         const1
         const2
         const3
         const4
         const5
         const6(i)
;
         cost..  z=e=12*b('1')+14*b('2')-(25*s('1')+20*s('2')+15*s('3'));
         benzin(j)..       b(j)=e=n('1',j)+n('2',j);
         mojoodi1..      n('1','1')+n('1','2')=l=500+s('1')+s('2')+s('3');
         mojoodi2..      n('2','1')+n('2','2')=l=1000;
         t1..    n('1','1')=g=b('1')*0.5;
         t2..    n('1','2')=g=b('2')*0.6;
         kharid(k)..     s(k)=l=500;
         const1..      s('1')=g=500-1000*(1-y('1'));
         const2..      s('2')=g=500-1000*(1-y('2'));
         const3..      s('2')=l=0+1000*y('1');
         const4..      s('3')=l=0+1000*y('2');
         const5..        y('2')=l=y('1');
         const6(i)..     y(i)=l=1;
;

model p1 /all/;
solve p1 minimizing z using lp;
display s.l, y.l, z.l, n.l, b.l;
