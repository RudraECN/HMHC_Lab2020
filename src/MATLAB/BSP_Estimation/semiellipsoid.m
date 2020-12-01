%% Semi-Ellipsoid equations
function [Mass, COMpos, Inertia] = semiellipsoid(p,a,b,c)
  
  Mass= 2*pi*p*a*b*c/3;
  COMpos= 3*c/8;
  Ixx= ((b^2+c^2)-(3*c/8)^2)*Mass/5;
  Iyy= ((a^2+c^2)-(3*c/8)^2)*Mass/5;
  Izz= (a^2+b^2)*Mass/5;
  
  Inertia=diag([Ixx,Iyy,Izz]);
  
end
