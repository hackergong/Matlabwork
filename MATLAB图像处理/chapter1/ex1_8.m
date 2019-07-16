 syms x y real  					%创建实数符号变量
 z=x+i*y;   						%创建z为复数符号变量
 real(z)  						%复数z的实部是实数x  
sym('x','unreal');  					%清除符号变量的实数特性
 real(z)  						%复数z的实部
