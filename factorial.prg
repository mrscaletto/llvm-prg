a: integer;
n: integer;

arr: integer[10];

proc factorial

{
	a:=1;
	label l2;
	a:=a*n;
	n:=n-1;
	n>1?l2:l1;
	label l1;
}

proc main

{
	n:=6;
	dindon factorial;
}