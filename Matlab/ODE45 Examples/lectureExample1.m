clear all
close all
clc

xSpan = [0 10];
iniCond = [1];

sol = ode45(@odeFun,xSpan,iniCond);

x = 0:.01:10;
y = deval(sol,x);

plot(x,y)
xlabel('$x$-axis','interpreter','latex')
ylabel('$y$-axis','interpreter','latex')
title('Example 1: $y^\prime + 2xy = 4x$ with $y(0) = 1$','interpreter','latex','fontsize',14)