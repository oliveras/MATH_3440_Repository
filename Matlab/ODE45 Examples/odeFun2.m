function yPrime = odeFun2(x,y)

Y1 = y(1);
Y2 = y(2);

Y1Prime = Y2;
Y2Prime = 2*Y1*Y2 - cos(Y1);

yPrime = [Y1Prime; Y2Prime];