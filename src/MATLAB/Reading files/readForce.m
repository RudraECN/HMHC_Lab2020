%% Reads the content of the Force files
function F2 = readForce(filename)
    
    F = readtable(filename);
    F=F{:,:}';
    F=F(3:8,:);
    % Resample is neccesary because the force plate frequency is faster
    % than the motion capture measurments
    for i=1:6
        F2(i,:)=resample(F(i,:),60,1000);
    end
    
end