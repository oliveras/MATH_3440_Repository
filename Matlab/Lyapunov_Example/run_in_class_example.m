clear all
close all
clc


strOptions = {'interpreter','latex','fontsize',14};
odeOptions = odeset('absTol',1e-10,'reltol',1e-10);

z0 = -3:.5:3;
z0 = z0/6;
z0 = z0(2:end-1);5
x0 = zeros(size(z0));
iniCondMat = [x0; x0; z0];
iniCondMat(2,:) = sqrt((1/8 - iniCondMat(1,:).^2 - iniCondMat(3,:).^2)/2);
[m n] = size(iniCondMat);

for j = 1:n
    V0Mat(j) = sum(iniCondMat(:,1).^2.*[1;2;1]);
end
V0Mat


colors = get(gca,'colororder');

t0 = 0;
tf = 5;
tSpan = [t0 tf];
t = linspace(t0,tf,1000);


a = 0;
for j = 1:n
    iniCond = iniCondMat(:,j);
    
    
    sol = ode45(@(t,X) example(t,X,a), tSpan, iniCond,odeOptions);
    
    
    X = deval(sol,t);
    x = X(1,:); y = X(2,:); z = X(3,:);
    
    figure(1)
    subplot(3,3,[1 2 3 4 5 6])
    
    if a==0 && j==1
        V0 = V0Mat(j);
        xr = sqrt(V0); yr = sqrt(V0/2); zr = sqrt(V0);
        [xx yy zz]= ellipsoid(0,0,0,xr,yr,zr,100);
        s = linspace(-4,4,100);
        o = ones(size(s));
        plot3(0*s,0*s,s,'k','linewidth',1.2);hold on;
        plot3(s,0*s,o,'k','linewidth',1.2);
        plot3(0*s,s,2*o,'k','linewidth',1.2);
        %plot3([0 0 0 0 0 0],[0,sqrt((9-1)/2),sqrt((9-4)/2),-sqrt((9-1)/2),-sqrt((9-4)/2),0],[sqrt(V0),1,2,1,2,-sqrt(V0)],'o','color','k','markerfacecolor','k','markersize',5)
        h = surfl(xx,yy,zz);  set(h,'FaceAlpha',.1); hold on;
        shading interp;
        
    end
    c = colors(mod(j,7)+1,:);
    plot3(x,y,z,'color',c,'linewidth',2.5); hold on; grid on;
    plot3(x(1),y(1),z(1),'o','color',c,'markerfacecolor',c);     hold on
    
    
    subplot(3,3,7)
    plot(t,x,'linewidth',1.5,'color',c); hold on; grid on
    
    
    subplot(3,3,8)
    plot(t,y,'linewidth',1.5,'color',c); hold on; grid on
    
    subplot(3,3,9);
    plot(t,z,'linewidth',1.5,'color',c); hold on; grid on
    
    
end
figure(1)
subplot(3,3,[1 2 3 4 5 6])
plot3(0,0,0,'o','color','k','markerfacecolor','k','markersize',5)
title(['Plot of solutions when a =', num2str(a)],'fontsize',18)
xlabel('$x$',strOptions{1:2},'fontsize',18)
ylabel('$y$',strOptions{1:2},'fontsize',18)
zlabel('$z$',strOptions{1:2},'fontsize',18)


subplot(3,3,7)
xlabel('$t$',strOptions{:})
title('$x$ vs. $t$',strOptions{:})
if a>0
    plot(t,0*t,'color','k','linewidth',1.5);
end
axis tight

subplot(3,3,8)
xlabel('$t$',strOptions{:})
title('$y$ vs. $t$',strOptions{:})
axis tight
if a>0
    plot(t,0*t,'color','k','linewidth',1.5);
end
axis tight


subplot(3,3,9)
xlabel('$t$',strOptions{:})
title('$z$ vs. $t$',strOptions{:})

if a>0
    plot(t,0*t,'color','k','linewidth',1.5);
end
axis tight
