%% Computes the central derivate of the vector
% We get the velocity and acceleration on x,y and z of each joint for each
% timestep
function [v, vd, w, wd] = central_difference(pose,ori,time)

    for i=2:length(time)-1
        
        v(:,:,i-1) = (pose(:,:,i+1)-pose(:,:,i-1))/(time(i+1)-time(i-1));
        w(:,:,i-1) = (ori(:,:,i+1)-ori(:,:,i-1))/(time(i+1)-time(i-1));
        
    end
    
    for i=3:length(time)-3
        vd(:,:,i-2) = (v(:,:,i+1)-v(:,:,i-1))/(time(i+1)-time(i-1));
        wd(:,:,i-2)= (w(:,:,i+1)-w(:,:,i-1))/(time(i+1)-time(i-1));
    end
        
end