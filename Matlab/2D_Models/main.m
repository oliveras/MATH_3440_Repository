clear all
close all
clc


tSpan = [0 10]
iniCond = [4 1]


sol = ode45(@odeFun,tSpan,iniCond);

plot(sol.x,sol.y)