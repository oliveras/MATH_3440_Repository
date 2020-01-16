function ans = odeFun(t,y);


r = 10; b = 2; a = 2; k = 30;
if (t>3)&(t<5)
    q = .1;
else
    q = 0;
end


ans = [(r-q)*y(1) - a*y(1)*y(2); b*y(1)*y(2) - (k+q)*y(2)];