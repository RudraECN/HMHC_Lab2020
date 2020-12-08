function [F, M] = fmdistribute(Fe, Me, ratio)
    % fmdistribute
    %
    % Function to distribute the force and moment values based on the
    % provided ratio value.
    
    % Fe, Me - forces and moments before distribution
    % ratio - a ratio value to perform the distribution
    % @output :
    % F, M - forces and moments after distributed according to the ratio.
    %
    assert(size(Fe, 2) == size(Me, 2), ...
        'fmdistribute() : size(Fe, 2) == size(Me, 2)');
    assert(size(ratio, 2) > size(Fe, 2), ...
        'fmdistribute() : size(ratio, 2) > size(Fe, 2)');
    nsteps = size(Fe, 2);
    F = [];
    M = [];
    for k = 1:nsteps
        kp = k + 2;     % position index
        f = ratio(kp) .* Fe(:, k);
        m = ratio(kp) .* Me(:, k);
        F = [F, f];
        M = [M, m];
    end
end
