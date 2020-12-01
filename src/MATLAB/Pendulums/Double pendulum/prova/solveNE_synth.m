function [fon,mon] = solveNE_synth(alpha_,beta_,ori_,COM_,mass_,Fnext_,Mnext_,dist)


gravity = [0,-9.8,0];
rotmat = getRfromOri(ori_);

% Recursive force balance equations
fon = alpha_ - (mass_*gravity) - Fnext_;
mon = beta_ - cross((rotmat*(COM_.')).',mass_*gravity) - cross(dist,Fnext_) - Mnext_;