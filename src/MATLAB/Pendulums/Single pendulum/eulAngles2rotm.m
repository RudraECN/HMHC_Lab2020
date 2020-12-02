function rotMat = eulAngles2rotm(angles)
% This is a simple code to performe NE rotations
rotZ = zeros(3,3);
rotY = zeros(3,3);
rotX = zeros(3,3);
%Rotation around Z
rotZ(1,1) = cos(angles(3));
rotZ(1,2) = -sin(angles(3));
rotZ(1,3) = 0;
rotZ(2,1) = sin(angles(3));
rotZ(2,2) = cos(angles(3));
rotZ(2,3) = 0;
rotZ(3,1) = 0;
rotZ(3,2) = 0;
rotZ(3,3) = 1;
%Rotation around Y
rotY(1,1) = cos(angles(2));
rotY(1,2) = 0;
rotY(1,3) = sin(angles(2));
rotY(2,1) = 0;
rotY(2,2) = 1;
rotY(2,3) = 0;
rotY(3,1) = -sin(angles(2));
rotY(3,2) = 0;
rotY(3,3) = cos(angles(2));
%Rotation around X
rotX(1,1) = 1;
rotX(1,2) = 0;
rotX(1,3) = 0;
rotX(2,1) = 0;
rotX(2,2) = cos(angles(1));
rotX(2,3) = -sin(angles(1));
rotX(3,1) = 0;
rotX(3,2) = sin(angles(1));
rotX(3,3) = cos(angles(1));

rotMat =  rotZ * rotY * rotX;
