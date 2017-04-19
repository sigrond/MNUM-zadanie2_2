function [ x1, x2 ] = QPNR( a, b, c )
%QPNR obliczanie pierwiastk�w r�wnania kwadratowego
%   a,b,c - wsp�czynniki tr�jmianu kwadratowego
%   x1,x2 - pierwiastki
l1=-b+sqrt(b^2-4*a*c);
l2=-b-sqrt(b^2-4*a*c);
if abs(l1)>abs(l2)
    l=l1;
else
    l=l2;
end
x1=l/(2*a);
x2=(-b/a)-x1;
end

