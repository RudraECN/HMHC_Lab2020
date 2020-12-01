%% Elliptical Solid equations
% The call should be:
% ellipticalsolid(p,L,a0,b0,b0,b0,a1,b1,b1,b1)

function [Mass, COMpos, Inertia] = ellipticalsolid(p,L,a0,b0,c0,d0,a1,b1,c1,d1)
  
  [B1ab, B2ab, B3ab]=B123(a0,b0,c0,d0,a1,b1,c1,d1);
  [A1ab, A2ab, A3ab]=A123(B1ab,B2ab,B3ab);
  
  % Assuming a=a,b=b, c=b, d=b (Getting A4abbb)
  [B4abcd, B5abcd, B6abcd, B7abcd, B8abcd]=B45678(a0,b0,c0,d0,a1,b1,c1,d1);
  A4abbb= A4(B4abcd,B5abcd,B6abcd,B7abcd,B8abcd);
  
  % Flipping for a=a, b=a, c=a, d=b (Getting A4aaab)
  [B4abcd, B5abcd, B6abcd, B7abcd, B8abcd]=B45678(a0,a0,a0,b0,a1,a1,a1,b1);
  A4aaab= A4(B4abcd,B5abcd,B6abcd,B7abcd,B8abcd);
  
  Mass= pi*p*L*A1ab;
  COMpos= L * A2ab/A1ab;
  Ixx= Mass*A4abbb/(4*A1ab) + Mass*(L^2)*A3ab/A1ab - Mass * (L*A2ab/A1ab)^2;
  Iyy= Mass*A4aaab/(4*A1ab) + Mass*(L^2)*A3ab/A1ab - Mass* (L*A2ab/A1ab)^2;
  Izz= Mass*(A4aaab+A4abbb)/(4*A1ab);
  
  Inertia= diag([Ixx,Iyy,Izz]);
  
end


function [A1ab, A2ab, A3ab] = A123(B1ab,B2ab,B3ab)
  
  A1ab= B1ab/3 + B2ab/2 + B3ab;
  A2ab= B1ab/4 + B2ab/3 + B3ab/2;
  A3ab= B1ab/5  + B2ab/4 + B3ab/3;
  
end

function [A4abcd]= A4(B4abcd,B5abcd,B6abcd,B7abcd,B8abcd)
  
  A4abcd= B4abcd/5 + B5abcd/4 + B6abcd/3 + B7abcd/2 + B8abcd;
  
end

function [B1ab, B2ab, B3ab] = B123(a0,b0,c0,d0,a1,b1,c1,d1)
  
  B1ab= (a1-a0)*(b1-b0);
  B2ab= a0*(b1-b0)+b0*(a1-a0);
  B3ab= a0*b0;
  
end

function [B4abcd, B5abcd, B6abcd, B7abcd, B8abcd]= B45678(a0,b0,c0,d0,a1,b1,c1,d1)
  B4abcd= (a1-a0)*(b1-b0)*(c1-c0)*(d1-d0); 
  B5abcd= a0*(b1-b0)*(c1-c0)*(d1-d0) + ...
           b0*(a1-a0)*(c1-c0)*(d1-d0)+ ...
           c0*(a1-a0)*(b1-b0)*(d1-d0)+ ...
           d0*(a1-a0)*(b1-b0)*(c1-c0);
  B6abcd= a0*b0*(c1-c0)*(d1-d0)+ ...
          a0*c0*(b1-b0)*(d1-d0)+ ...
          a0*d0*(b1-b0)*(c1-c0)+ ...
          b0*c0*(a1-a0)*(d1-d0)+ ...
          b0*d0*(a1-a0)*(c1-c0)+ ...
          c0*d0*(a1-a0)*(b1-b0);
  B7abcd= b0*c0*d0*(a1-a0)+ ...
          a0*c0*d0*(b1-b0)+ ...
          a0*b0*d0*(c1-c0)+ ...
          a0*b0*c0*(d1-d0);
  B8abcd= a0*b0*c0*d0;
  
end