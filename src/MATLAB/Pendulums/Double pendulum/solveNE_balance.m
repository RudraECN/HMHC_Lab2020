function [f_i,m_i] = solveNE_balance(alpha,beta,ori,COM,mass,Fnext,Mnext,dist)

gravity = [0;-9.8;0];
rotMat = eulAngles2rotm(ori);

% COM in global frame
COM_0 = rotMat*COM;

% Recursive force balance equations
f_i = alpha - (mass*gravity) - Fnext;
m_i = beta - cross(COM_0, mass*gravity) - cross(dist,Fnext) - Mnext;