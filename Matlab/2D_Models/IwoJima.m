function IwoJima
close all
clc
format compact


a = 0.0544;
b = 0.0106;


JapanReinforcements = 0;  % this means that I've set g(t) = 0


options = odeset('MaxStep',.05,'AbsTol',10^(-6),'RelTol',10^(-6));
sol = ode45(@lanchester,[0 35],[0;21500],options);

t = [0:1:35]';
Z = deval(sol,t);

x = Z(1,:);
y = Z(2,:);

subplot(2,1,1)
plot(t,x)
hold on
plot(t(2:end),data(t),'r*')
set(gcf, 'Position',[20 20 800 800])
title('Verification of Lanchesters Law - Iwo Jima')
xlabel('time t - in days')
ylabel('American Forces - in number of active troops')
legend('Predicted by the Model','Actual Data from Morehouse',...
       'location','SouthEast')

display('Press any button to continue')
pause
JapanReinforcements = 1;  % this means that I've set g(t) to something that is nonzero


options = odeset('MaxStep',.05,'AbsTol',10^(-6),'RelTol',10^(-6));
sol = ode45(@lanchester,[0 45],[0;21500],options);

t = [0:.1:45]';
Z = deval(sol,t);

x = Z(1,:);
y = Z(2,:);
subplot(2,1,2)
plot(t,x)
hold on
plot(t,y,'r')
title('What if Japan Sent Reinforcements? - Iwo Jima')
xlabel('time t - in days')
ylabel('Forces - in number of active troops')
legend('US Troops Predicted by the Model',...
       'Japanese Troops Predicted by the Model','location','NorthEast')

% --------------------------------
% Nested subfunctions
% --------------------------------

% -------------

    function ZPrime = lanchester(t,Z)
        x = Z(1);
        y = Z(2);
        xPrime = f(t) - a*y;
        yPrime = g(t) - b*x;
        ZPrime = [xPrime;
                  yPrime];
    end

% -------------

    function funVal = f(T)
    % I made this subfunction more difficult than it needed to be
    % so that I could use it when plotting the actual data.  In 
    % general, this could have just been 
    %            
    %        if (t>=0 && t<1)
    %            funVal = 54000;
    %        elseif (t>=2 && t<3)
    %            funVal = 6000;
    %        elseif (t>=5 && t<6)
    %            funVal=13000;
    %        else
    %            funVal = 0;
    %        end
    
        for j = 1:length(T)
            t = T(j);
            
            if (t>=0 && t<1)
                funVal(j) = 54000;
            elseif (t>=2 && t<3)
                funVal(j) = 6000;
            elseif (t>=5 && t<6)
                funVal(j)=13000;
            else
                funVal(j) = 0;
            end
            
        end
        funVal = funVal';
    end

% -------------

    function output = data(T)
        totalCasualties = [    1161;   3055;   3969;   6251;   6845;   7750;
                               8622;  10126;  10661;  11595;  12333;  13451;
                              13655;  13919;  14221;  14804;  15741;  16359;
                              18208;  17692;  18204;  18962;  19062;  19653;
                              19928;  20196;  20265;  20392;  20493;  20538;
                              20696;  20845;  20845;  20845;  20860];
        troopsArrivalT = f(T);
        for j = 1:length(T)
            troopsArrive(j,1) = sum(troopsArrivalT(1:j));
        end

        output = troopsArrive(1:end-1) - totalCasualties;

    end
% -------------

    function funVal = g(T)
    % See note in the f(T) function
        for j = 1:length(T)
            t = T(j);
            
            if (t>=1 && t<2)
                funVal(j) = 1000;
            elseif (t>=3 && t<4)
                funVal(j) = 6000;
            elseif (t>=6 && t<7)
                funVal(j)=13000;
            else
                funVal(j) = 0;
            end
            
        end
        funVal = funVal';
        if JapanReinforcements == 0
            funVal = zeros(size(T));
        end
    end

% -------------

end