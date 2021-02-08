function Z=NTU501
for i=1:5%%A 5*5 matrix.
    for j=1:5
        if mod(i+j,2)==0%%Divide all the grids into two parts, and each 
%point only connects with the grids that in the other part.            
            A(i,j)='B';%%There are 13 blue beads.
        else A(i,j)='R';%%There are 12 red beads.
        end
    end
end
%%Output the result of the configuration.
fid=fopen('NTU501.txt','wt');
for i=1:5
    for j=1:5
        fprintf(fid,'%s ',A(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);
end