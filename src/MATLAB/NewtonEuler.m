function [Omega, H, F, K, U] = NewtonEuler(T, Jk, dt)
    % [Omega, H, F, K, U] = newton_euler(T, Jk, dt)
    %
    % Function to compute velocity, torque, kinetic and potential energies
    % using the Newton-Euler method.
    % @input : 
    % T - Transformation matrix
    % Jk - Inertia elements
    % dt - sampling time
    % @output :
    % Omega - Velocity
    % H - Acceleration
    % F - Force
    % K - Kinetic energy
    % U - Potential energy
    %

    % Number of samples of T
    n = size(T,3);

    % Td has n-2 samples
    Td = (T(:,:,3:n) - T(:,:,1:(n-2)))/(2*dt);

    % Tdd has n-4 samples
    Tdd = (T(:,:,5:n) - 2*T(:,:,3:n-2) + T(:,:,1:n-4))/(4*dt^2);

    % Td = Omega*T
    % Omega has n-2 samples
    % T: from 2 to n-1
    for k = 1:n-2
        Omega(:,:,k) = Td(:,:,k)*(T(:,:,k+1)^(-1));
    end

    % Tdd = H*T
    % T: from 3 to n-2
    for k = 1:n-4
        H(:,:,k) = Tdd(:,:,k)*(T(:,:,k+2)^(-1));
    end

    % J0 = Tk0*Jk*Tk0'
    % J0 has n samples
    for k = 1:n
        J0(:,:,k) = T(:,:,k)*Jk*T(:,:,k)';
    end

    % F = H*J - J*H'
    for k = 1:n-4
        F(:,:,k) = H(:,:,k)*J0(:,:,k+2)-J0(:,:,k+2)*H(:,:,k)';
    end

    % K = Trace(Omega*J*Omega')/2
    for k = 1:n-2
        K(k) = trace(Omega(:,:,k)*J0(:,:,k+1)*transpose(Omega(:,:,k)))/2;
    end

    % Gravity matrix
    Hg = zeros(4);
    Hg(3,4) = -9.81;

    % U = Trace(Hg*J)/2
    for k = 1:n-4
        U(k) = -trace(Hg*J0(:,:,k+2));
    end

    % % Check total energy
    % E = K(2:61)+U;
    % figure(444)
    % hold on
    % plot(E,'b')
    % plot(K(2:61),'r')
    % plot(U,'k')
end