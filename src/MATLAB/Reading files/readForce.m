%% Reads the content of the Force files
function F = readForce(filename)
    
    F = readtable(filename);
    F=F{:,:}';
    F=F(3:8,:);
    
end
