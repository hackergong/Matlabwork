>>syms x n	%定义符号变量x和n
>>f=x^n;	%定义符号表达式f
>>diff(f,x)               		%符号表达式f对x求导
>>diff(f,n)                	%注意，是f对符号变量n求导
>>df2=diff(f,x,2)     			%计算f对符号变量x的二阶导数
