function pendulum_visualization(pos,ori,b,dt,n,l)
% pos: position of body start point 
% ori: orientation of body 
% b: number of body
% dt:time step
% n: position dimension
% l: length of the body

figure
for time = 1:n
    cla,
    for body = 1:b
        pos1 = pos(:,time,body);
        pos2 = pos1 + l(body)*[cos(ori(3,time,body));sin(ori(3,time,body));0];
        animation_cylinder(pos1,pos2,0.1);
    end
    axis equal;
    axis on
    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    xlim([-2,2])
    ylim([-2,2])
    zlim([-2,2])
    view([45,30]) % in degree
    pause(dt)
end
end