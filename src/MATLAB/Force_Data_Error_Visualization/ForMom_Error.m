function [Fx, Fy, Fz, Mx, My, Mz] = ForMom_Error(name_file,Forx, Fory, Forz, Momx, Momy, Momz)
%TO call this function, you have to pass it:
%         'name_of_my_file.csv'
%while you are in the same folder of the data
%The rest has to be passsed as an 1D vector of the same length

%The return arguments can be removed and it can only be used to plot stuff
%% Open and import data
filename = name_file;
data_import = readmatrix(filename);
%time
t = data_import(:, 2);
%size
n = size(t);
%forces
dataFx = data_import(:, 3);
dataFy = data_import(:, 4);
dataFz = data_import(:, 5);

%moments
dataMx = data_import(:, 6);
dataMy = data_import(:, 7);
dataMz = data_import(:, 8);
%% Find the errors
Fx = Forx - dataFx;
Fy = Fory - dataFy;
Fz = Forz - dataFz;
Mx = Momx - dataMx;
My = Momy - dataMy;
Mz = Momz - dataMz;
%% Plot Data
% Create plots, forces and moments together
figure(1)
forces_moments_plot = tiledlayout(2,3); % Requires R2019b or later
my_title1 = strcat('Forces and Moments Error of ', ':', filename);
title(forces_moments_plot, my_title1 )
nexttile
plot(t,Fx)
title('Fx Error')
nexttile
plot(t,Fy)
title('Fy Error')
nexttile
plot(t,Fz)
title('Fz Error')
nexttile
plot(t,Mx)
title('Mx Error')
nexttile
plot(t,My)
title('My Error')
nexttile
plot(t,Mz)
title('Mz Error')



end

