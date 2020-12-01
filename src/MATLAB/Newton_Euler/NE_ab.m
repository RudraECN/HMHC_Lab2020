%% In progress
function [alfa,beta]= NE_ab(pose,ori,body)

    posed=diff(pose);
    orid=diff(ori);
    posedd=diff(posed);
    oridd=diff(orid);
    
    for i=1:length(body)
        COM(i,:)=body(i).COMpos;
        mass(i)=body(i).Mass;
        ms(i,:)= mass(i) * COM(i,:);
        inertia(:,:,i)=body(i).Inertia;
    end
    
    
    
end