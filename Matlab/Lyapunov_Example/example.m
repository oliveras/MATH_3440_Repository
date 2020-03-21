function XDot = example(t,X,a)

x = X(1);   y = X(2);   z = X(3);

xDot = -2*y + y*z - a*x^3;
yDot = x - x*z - a*y^3;
zDot = x*y - a*z^3;


XDot = [xDot; yDot; zDot];