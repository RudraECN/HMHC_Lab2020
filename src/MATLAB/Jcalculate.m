
function [J] = Jcalculate(Ixx, Iyy, Izz, COM_pos, m)
   
    % Function to form the J matrix.
    % @input :
    % Ixx, Iyy, Izz - inertia values along those axes. They are diagnoal
    %                 values in an inertia matrix.
    % COM_pos - Location of the centre of mass
    % m - mass
    % @output :
    % J - J matrix 
    %
    J = [Ixx    0       0       0;
         0      Iyy     0       0;
         0      0       Izz     COM_pos*m;
         0      0       0       m    ];
end
