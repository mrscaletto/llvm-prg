prev: integer;
new: integer;
temp: integer;
n: integer;



res: integer[5];

proc fib
{
	prev:=0;
	new:=1;
	n:=n-1;
	label loop1;
	temp:=new;
	new:=prev+new;
	prev:=temp;
	n:=n-1;
	n>0?loop1:l1;
	label l1;
}

proc main
{
	n:=3;
	res[0]:=1;
	res[1]:=1;
	dindon fib;
	res[2]:=new;
	n:=4;
	dindon fib;
	res[3]:=new;
	n:=5;
	dindon fib;
	res[4]:=new;
	dindon fib;
}