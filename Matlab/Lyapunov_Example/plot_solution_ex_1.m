clear all
close all
clc

iniCond = [.1; .1; .1];

tSpan = [0 100];

sol = ode45(@ex_1, tSpan, iniCond);

Y = deval(sol,t);
plot3(Y(1,:),Y(2,:),Y(3,:))