%% Computes alfa and beta for all the bodies
%% WORKS BUT IT NEEDS TESTING

function [alfa,beta,COM,mass,ms,inertia]= NE_foward(pos,ori,time,body)

    [v, vd, w, wd] = central_difference(pos,ori,time);
    
    bodyparts=["lowertrunk","middletrunk","uppertrunk","head","","","upperarmL","upperarmR","forearmL",...
        "forearmR","handL","handR","","","thighL","thighR","shankL","shankR","footL","footR"];
    
    % Ignoring frame 5 6 13 and 14 since their velocities don't correspond
    % to an specific body
    for i=1:length(bodyparts)
        if (i ~= [5,6,13,14])
            COM(i,:)=body.(bodyparts(i)).COMpos;
            mass(i)=body.(bodyparts(i)).Mass/1000;
            ms(i,:)= mass(i) * COM(i,:);
            inertia(:,:,i)=body.(bodyparts(i)).Inertia;
        end
    end
    
    for i=1:length(bodyparts)
        if (i ~= [5,6,13,14])
            for j=1:length(pos)-5
                R= rotx(ori(i,1,j))*roty(ori(i,2,j))*rotz(ori(i,3,j));
                alfa(i,:,j)= mass(i)* vd(i,:,j) + cross(wd(i,:,j),R*ms(i,:)') + cross(w(i,:,j),(cross(w(i,:,j),R*ms(i,:)')));
                beta(i,:,j)= (R*inertia(:,:,i)*R'*wd(i,:,j)')'+ cross(R*ms(i,:)',vd(i,:,j))+cross(w(i,:,j),R*inertia(:,:,i)*R'*w(i,:,j)');
            end
        end
    end
end