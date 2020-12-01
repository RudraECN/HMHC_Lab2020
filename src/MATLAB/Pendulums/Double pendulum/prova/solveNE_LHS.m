function [alpha_,beta_] = solveNE_LHS(vd_,wd_,w_,ori_,ms_,inertiavec_,mass_)

% Build the inertia matrix from our inertia vector
inertiamat = [inertiavec_(1), 0, 0; 0, inertiavec_(2),0; 0, 0, inertiavec_(3)];

% Build rotation matrix from rx,ry,rz in the orientation vector
rotmat = getRfromOri(ori_);

% Rotate ms_ so that it is in global frame
ms_new = (rotmat*(ms_.')).';

% Rotate inertia mat so that it is in global frame
inertiamat_new = rotmat * inertiamat * (rotmat.');

% Classical NE equations for sum of forces and moments
alpha_ =  ( mass_ * vd_ ) + cross(wd_,ms_new) + cross(w_,cross(w_,ms_new)); 
beta_ = (inertiamat_new * (wd_.')) + cross(ms_new,vd_).' + cross(w_,((inertiamat_new*(w_.'))).').';

% disp(alpha_)
% disp(beta_)