clear all
close all
clc

xSpan = [0 10];
iniCond = [1 0];

sol = ode45(@odeFun2,xSpan,iniCond);

x = 0:.01:10;
y = deval(sol,x);

plot(x,y)
xlabel('x-axis')
ylabel('y-axis')
title('Example - solving y{\prime\prime}-2y{\prime}y + cos(y)=0 with y(0) = 1, y\prime(0)=0')
legend('y(x)','y''(x)')