% y=2x
% -2<=x<=2
% clear all
% x=-2:0.05:2;
% M=length(x);
% u=0:1:M-1;
% F=zeros(1,M);
% for x=1:M
%     F=F+2*x*exp((-1*i*2*pi*u*x)/M);
% end
% 
% plot(x,F)
%% 
clear all;
t=-2:0.05:2;
ft=2*t;
subplot(311)
plot(t,ft)
M=length(t);
for u=1:M
    Fu=0;
    for x=1:M
        Fu=Fu+ft(x)*exp(-1i*2*pi*u*x/M);
    end
    F(u)=Fu/M;
end
subplot(312)
plot(abs(F))


for x=1:M
    ffx=0;
    for u=1:M
        ffx=ffx+F(u)*exp(1i*2*pi*(u-1)*(x-1)/M);
    end
    ff(x)=ffx;
end
subplot(313)
plot(t,real(ff))










