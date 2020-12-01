%Made by Nicolas Testard if there is any question

Motion="quickJump";
Hanavan;
load(Motion+"_q.mat")

%% Animation

motion=motion_filtered(motion);

L=length(motion.time);
dt=motion.time(2)-motion.time(1);

%% Working?
% midJump => frame 179
for k=1:L
    hold off
   %head
   [X,Y,Z] = ellipsoid(0,0,0,Head.a,Head.b,Head.c); %Z=Z-Head.c;
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J4(:,k));
   mesh(X,Y,Z);
   hold on

   
   %U trunk
   [X,Y,Z]=elliptical(U_Trunk.a0,U_Trunk.b0,U_Trunk.a1,U_Trunk.b1,U_Trunk.L); Z=Z-U_Trunk.L;
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J3(:,k));
   mesh(X,Y,Z);

   
   %M_Trunk
   [X,Y,Z]=elliptical(M_Trunk.a0,M_Trunk.b0,M_Trunk.a1,M_Trunk.b1,M_Trunk.L); Z=Z-M_Trunk.L/2;
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J2(:,k));
   mesh(X,Y,Z);

   %L_trunk
   [X,Y,Z]=elliptical(L_Trunk.a0,L_Trunk.b0,L_Trunk.a1,L_Trunk.b1,L_Trunk.L);  Z=Z-L_Trunk.L-M_Trunk.L/2;
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J2(:,k));
   mesh(X,Y,Z);

   
   %R upper arm
   [X,Y,Z]=elliptical(Upperarm.a0,Upperarm.b0,Upperarm.a1,Upperarm.b1,Upperarm.L);  Z=Z-Upperarm.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J8(:,k));
   mesh(X,Y,Z);
   
   %L upper arm
   [X,Y,Z]=elliptical(Upperarm.a0,Upperarm.b0,Upperarm.a1,Upperarm.b1,Upperarm.L);  Z=Z-Upperarm.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J7(:,k));
   mesh(X,Y,Z);

   %R forearm
   [X,Y,Z]=elliptical(Forearm.a0,Forearm.b0,Forearm.a1,Forearm.b1,Forearm.L);  Z=Z-Forearm.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J10(:,k));
   mesh(X,Y,Z);
   
   %L forearm
   [X,Y,Z]=elliptical(Forearm.a0,Forearm.b0,Forearm.a1,Forearm.b1,Forearm.L);  Z=Z-Forearm.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J9(:,k));
   mesh(X,Y,Z);
   
   %R hand
   [X,Y,Z] = ellipsoid(0,0,0,Hand.a,Hand.b,Hand.c); Z=Z-Hand.c;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J12(:,k));
   mesh(X,Y,Z);
   
   %L hand
   [X,Y,Z] = ellipsoid(0,0,0,Hand.a,Hand.b,Hand.c); Z=Z-Hand.c;
   [X,Y,Z]=Rotation_solid(X,Y,Z,0,pi/2,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J11(:,k));
   mesh(X,Y,Z);
   
   %R thigh
   [X,Y,Z]=elliptical(Thigh.a0,Thigh.b0,Thigh.a1,Thigh.b1,Thigh.L);  Z=Z-Thigh.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J16(:,k));
   mesh(X,Y,Z);

   
   %L thigh 
   [X,Y,Z]=elliptical(Thigh.a0,Thigh.b0,Thigh.a1,Thigh.b1,Thigh.L);  Z=Z-Thigh.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J15(:,k));
   mesh(X,Y,Z);
   
   %R shank
   [X,Y,Z]=elliptical(Shank.a0,Shank.b0,Shank.a1,Shank.b1,Shank.L);  Z=Z-Shank.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J18(:,k));
   mesh(X,Y,Z);
   
   %L shank 
   [X,Y,Z]=elliptical(Shank.a0,Shank.b0,Shank.a1,Shank.b1,Shank.L);  Z=Z-Shank.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J17(:,k));
   mesh(X,Y,Z);
   
   %R foot
   [X,Y,Z]=elliptical(Foot.a0,Foot.b0,Foot.a1,Foot.b1,Foot.L);  Z=Z-Foot.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi/2,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J20(:,k));
   mesh(X,Y,Z);
   
   %L foot 
   [X,Y,Z]=elliptical(Foot.a0,Foot.b0,Foot.a1,Foot.b1,Foot.L);  Z=Z-Foot.L;
   [X,Y,Z]=Rotation_solid(X,Y,Z,pi/2,0,0);
   [X,Y,Z]=trans_rot(X,Y,Z,motion.J19(:,k));
   mesh(X,Y,Z);
   
   axis("equal")
   pause(dt)
end

