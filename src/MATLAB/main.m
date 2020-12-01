%% Main function of the project
% Compares the ground reactions forces measured against the computed ones.

function []= main()
    

    %% Adding all the directories
    addpath(genpath('../MATLAB'));
    addpath(genpath('../Lab_Files'));
    
    %% Get the P values
    P = plotmeasurements();
    
    %% Computes the BSP parameters
    [Body]= BSPparameters(P);
    
    %% Read data from Motion capture files -> get pos and ori of each marker at each timestep and Force Data
    MCfiles = ["custom.drf","custom2.drf","customL.drf","fastArm.drf","fastKick.drf","fastKickArm.drf", ...
        "jumpFeetup.drf","maxJump.drf","maxJump2.drf","mediumArm.drf","mediumArmNOSTOMP.drf", "mediumKick.drf", ...
        "mediumKickArm.drf", "medJump.drf", "quickJump.drf", "slowArm.drf", "slowKick.drf", "slowKickArm.drf"];
    
    forcefiles = ["custom.csv","custom2.csv","customL.csv","fastArm.csv","fastKick.csv","fastKickArm.csv", ...
        "jumpFeetup.csv","maxJump.csv","maxJump2.csv","mediumArm.csv","mediumArmNOSTOMP.csv", "mediumKick.csv", ...
        "mediumKickArm.csv", "medJump.csv", "quickJump.csv", "slowArm.csv", "slowKick.csv", "slowKickArm.csv"];
    
    for i=1:length(MCfiles)
        
        disp('Reading file');
        F= readForce(forcefiles(i));
        [pos,ori,time]= readDRF(MCfiles(i));
        disp('Visualizating file:');
        disp(MCfiles(i));
        visualization(pos); % comment this line if you get bored of my poor animation
        disp('Type a key to continue');
        pause();
        
        %% TODO
        %% Compute NE for each serial or tree structure -> get the forces on the ground
        [alfa,beta,COM,mass,ms,inertia]= NE_foward(pos,ori,time,Body);
        [grdf,grdm]= NE_backward(pos,ori,time,Body,alfa,beta,COM,mass,ms,inertia);
        
        %% TODO
        %% Compare results
        % functions to visualize the obtained reactions vs the measurements
        % in vector F
        
        
    end
    

    

end



