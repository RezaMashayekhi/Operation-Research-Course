set
i /1,2,3,4,5/
;
parameter
c(i)
/
1        1500
2        3000
3        400
4        1000
5        100
/
m(i)
/
1        15
2        10
3        25
4        4
5        20
/
n(i)
/
1        1000
2        2000
3        1500
4        2500
5        300
/
;
free variable
z
;
integer variable
x(i)
;
equation

obj
eq1(i)
eq2
eq3
eq4
;

obj..    z=e=sum(i,x(i)*c(i));
eq1(i).. x(i)=l=m(i);
eq2..    x('1')*c('1')+x('2')*c('2')=l=18000;
eq3..    x('1')+x('2')=g=10;
eq4..    sum(i,x(i)*n(i))=g=50000;

model TV /all/;
solve TV minimizing z using mip;
display x.l,z.l;