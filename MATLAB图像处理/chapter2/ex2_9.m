clear  all;
A= magic(3)			%3阶魔术矩阵
B = eye (3)			% 3阶单位矩阵
E =[A,B]				% 水平方向上拼接
F =[A;B]				% 垂直方向上拼接
