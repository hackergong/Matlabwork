>> clear all;
>> A = magic(5);				%5阶魔方矩阵
>> A(4:5,:) = []
>> B = magic(3)*1000
>> C = horzcat(A, B)			%水平连接矩阵
