function [F, M] = newton(mass, Ij, Xdot, Xddot, Fn, Mn, Ln)
    % [F, M] = newton(mass, Ij, Xdot, Xddot, Fn, Mn, Ln)
    %
    % Function to compute the total force and total moment acting on the
    % link 
    % @output :
    % F - Total force acting on the link
    % M - Total moment acting on the link
    %
    
    % gravity vector
    gz = 9.81;
    gvec = [0; 0; gz];
    % assign to individual variables 
    v = Xdot(1:3);
    omega = Xdot(4:6);
    vdot = Xddot(1:3);
    omegadot = Xddot(4:6);
    
    % compute Fj and Mj
    Fj = mass * vdot;                                   
    Mj = (Ij * omegadot) + cross(omega, (Ij * omega));  
    
    % compute total forces and total moments from the next links
    assert(size(Fn, 2) == size(Mn, 2), ...
           'newton() : number of columns in Fn and Mn are different.');
    assert(size(Ln, 2) == size(Mn, 2), ...
           'newton() : number of columns in Ln and Mn are different.');
    totalFn = zeros(3,1);
    totalMn = zeros(3,1);
    totalcross = zeros(3,1);
    for i = 1:size(Ln, 2)
        totalFn = totalFn + Fn(:, i);
        totalMn = totalMn + Mn(:, i);
        totalcross = totalcross + cross(Ln(:, i), Fn(:, i));
    end
    
    % compute the total force and moments of the current link
    F = Fj - totalFn + (mass * gvec);  
    M = Mj - totalMn - totalcross;     
    
end