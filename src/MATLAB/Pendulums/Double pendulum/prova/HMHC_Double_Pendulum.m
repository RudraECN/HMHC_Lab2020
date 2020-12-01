clear all

% General note:
% For 1-d vectors, the index usually denotes the body number
% For 2-d vectors, first index denotes body number and second index denotes x or y or z component
% For 3-d vectors, first index denotes body number, second index denotes x or y or z component, third index denotes time 
% 
% Examples: 
%  
% mass(2) gives mass of second body
% 
% COM(2,1) gives 2nd body's x position of centre of mass
% COM(5,:) gives a 1d vector with x,y,z positions of 5th body's centre of mass
% 
% pos(1,2,3) gives 1st body's y position at time instant 3
% pos(3,2,:) gives a 1d vector of 3rd body's y position for all time instants
% pos(6,:,:) gives a 2d vector of 6th body's x,y,z positions for all time instants

% Since motion capture data for double pendulum is not available, we need
% to simulate this input. Part A of this code deals with generating this simulation data


%  assuming our whole motion takes place in 1 second
n = 100;
dt = 1/n;

%  length of the pendulum segments
l = 1;

% No.of bodies
b = 2;

% Mass of the bodies
mass = [2,2];

%  considering gravity is acting along -y axis
gravity = [0,-9.8,0];

% COM,ms,inertiavec are all 2d vectors of dimension b,3
% COM contains positions of centre of mass [sx, sy, sz]
% ms contains first moment of inertia [mx, my, mz]
% inertiavec contains [Ixx, Iyy, Izz]

COM(1,:) = [0.5,0,0];
COM(2,:) = [0.5,0,0];
ms(1,:) = mass(1)*COM(1,:);
ms(2,:) = mass(2)*COM(1,:);
inertiavec(1,:) = [(1/3)*mass(1)*(l^2),(1/3)*mass(1)*(l^2),(1/3)*mass(1)*(l^2)];
inertiavec(2,:) = [(1/3)*mass(2)*(l^2),(1/3)*mass(2)*(l^2),(1/3)*mass(2)*(l^2)];

% Creating two parameters to describe rotation of our double pendulum
q1 = linspace(0,pi,n);
q2 = linspace(-pi/2,pi/2,n);

pos(1,1,:) = zeros(1,n);
pos(1,2,:) = zeros(1,n);
pos(1,3,:) = zeros(1,n);
ori(1,1,:) = zeros(1,n);
ori(1,2,:) = zeros(1,n);
ori(1,3,:) = q1;

pos(2,1,:) = l*cos(q1);
pos(2,2,:) = l*sin(q1);
pos(2,3,:) = zeros(1,n);
ori(2,1,:) = zeros(1,n);
ori(2,2,:) = zeros(1,n);
ori(2,3,:) = q1+q2;

% Velocity is obtained by taking elementwise difference along dimension 3
% (which is time) and dividing by dt

v = diff(pos,1,3) / dt;
w = diff(ori,1,3) / dt;
vd = diff(v,1,3) / dt;
wd = diff(w,1,3) / dt;

% Since we now have 2 less data points, crop all vectors 3rd dimension accordingly
n = n-2;
pos = pos(:,:,1:n);
ori = ori(:,:,1:n);
v = v(:,:,1:n);
w = w(:,:,1:n);


% Part B of the code starts here - NE Calculation

for j = 1:b
    for i = 1:n
        [alpha(j,:,i),beta(j,:,i)] = solveNE_LHS(vd(j,:,i),wd(j,:,i),w(j,:,i),ori(j,:,i),ms(j,:),inertiavec(j,:),mass(j));
    end
end

for j = b:-1:1
    for i = 1:n
        
        if j==2
            Fnext = [0,0,0];
            Mnext = [0,0,0];
            dist = [0,0,0];
        else
            Fnext = -fON(j+1,:,i);
            Mnext = -mON(j+1,:,i);
            dist = pos(j+1,:,i) - pos(j,:,i);
        end
               
        [fON(j,:,i),mON(j,:,i)] = solveNE_synth(alpha(j,:,i),beta(j,:,i),ori(j,:,i),COM(j,:),mass(j),Fnext,Mnext,dist);
    end
end

GRF(1,:) = -fON(1,1,:);
GRF(2,:) = -fON(1,2,:);
GRF(3,:) = -fON(1,3,:);
GRM(1,:) = -mON(1,1,:);
GRM(2,:) = -mON(1,2,:);
GRM(3,:) = -mON(1,3,:);

subplot(2,3,1)
plot(GRF(1,:))
title('Calculated GRF - X axis')
subplot(2,3,2)
plot(GRF(2,:))
title('Calculated GRF - Y axis')
subplot(2,3,3)
plot(GRF(3,:))
title('Calculated GRF - Z axis')
subplot(2,3,4)
plot(GRM(1,:))
title('Calculated GRM - X axis')
subplot(2,3,5)
plot(GRM(2,:))
title('Calculated GRM - Y axis')
subplot(2,3,6)
plot(GRM(3,:))
title('Calculated GRM - Z axis')

pendulum_visualization_prova(pos,ori,b,dt,n,l)
