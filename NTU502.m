function Z=NTU502
B=1451;
W=1072;
G=977;
Y=457;
R=139;%%Input the color and the number of the grids.
L=64;%%Input the size of the matrix.
%Since 64*64=4096, W+G=2049,B+Y+R=2047, we can divide the grids according
%to color into two groups.White color and Green color are in one group,
%while Blue, Yellow and Red are in the other group. If the grids are
%divided into two groups, each one has 2048 grids, so at first we will
%process the special situation, that is, the grids of coordinates(1,1),
%(2,2),(1,3) are white because the number of white grids is more than green
%the grid of coordinate(1,2) is green. 
for i=1:L
    for j=1:L
        if ((i==1)&&(j==1)==1)
            A(i,j)='W';
            W=W-1;
        else if ((i==1)&&(j==2)==1)
                A(i,j)='G';
                G=G-1;
            else if ((i==1)&&(j==3)==1)
                    A(i,j)='W';
                    W=W-1;
                else if ((i==2)&&(j==2)==1)
                        A(i,j)='W';
                        W=W-1;
                    else
                        if mod(i+j,2)==0 %%If i+j is odd,the color of grid 
%will be white or green, the specific color is random. If one color has
%been used up, then all the grids will be the other color.
                            a=rand(1);
                            if a>=0.5
                                if W~=0
                                    A(i,j)='W';
                                    W=W-1;
                                else A(i,j)='G';
                                    G=G-1;
                                end
                            else
                                if G~=0
                                    A(i,j)='G';
                                    G=G-1;
                                else
                                    A(i,j)='W';
                                    W=W-1;
                                end
                            end                            
                        else%%If i+j is even,the color of grid will be
%blue, yellow or red, the specific color is random. If one color has
%been used up, then the grids will be one of the other two color that is 
%more.
                            a=3*rand(1);
                            if a>=2
                                if B~=0
                                    A(i,j)='B';
                                    B=B-1;
                                else
                                    if Y>=R
                                        A(i,j)='Y';
                                        Y=Y-1;
                                    else A(i,j)='R';
                                        R=R-1;
                                    end
                                end
                            else if a>=1
                                    if Y~=0
                                        A(i,j)='Y';
                                        Y=Y-1;
                                    else
                                        if B>=R
                                            A(i,j)='B';
                                            B=B-1;
                                        else A(i,j)='R';
                                            R=R-1;
                                        end
                                    end
                                else
                                    if R~=0
                                        A(i,j)='R';
                                        R=R-1;
                                    else
                                        if B>=Y
                                            A(i,j)='B';
                                            B=B-1;
                                        else A(i,j)='Y';
                                            Y=Y-1;
                                        end
                                    end
                                end
                            end                            
                        end
                    end
                end
            end
        end
    end
end
%%Output the result of the configuration.
fid=fopen('NTU502.txt','wt');
for i=1:L
    for j=1:L
        fprintf(fid,'%s ',A(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);
end