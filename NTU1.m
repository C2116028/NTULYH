function [sum]=NTU1
M=input('please input M=');%%Input the number of rows.
N=input('please input N=');%%Input the number of columns.
sum=input('please input sum=');%%Input the number that will be summed up.
a=M*M/2+M/2;%%Count the minimum sum of the M*N matrix.
%%For example, if M=4, N=4, then a=10.
b=sum-a;
%%Find the difference between the number that we input and the minimum sum. 
%%For example, if the input sum is 16, then b=sum-a=16-10=6.
sum1=0;%Intermediate variable.
for i=1:N-1 
%%Since the number of columns is N, the maximum number of 'R' is N-1.
    c(i)=1;
%%Suppose all the 'R's are in the first row, 
%which means the sequence is RRRDDD in a 4*4 matrix.
    sum1=sum1+c(i);
end
d1=0;
d2=0;%%Two Intermediate variables.
for i=1:N-1%%Since there will be N-1 'R's, we will check each 'R' point to
%find a turning point.
%%What is a turning point? 
%For example, the sequence RRDRDD, the third 'R' between two 'D's is the 
%turning point that we'll look for.
%%For example, the sequence RDDDRR, the second 'R' after all 'D's is the
%turning point.
%%For example, the sequence DDRDRR, the first 'R' between two 'D's is the 
%turning point.
%%In this design, the sequence can be divided into five parts, the first
%part, third part and the fifth part consist all 'R's, while the second and
%the  fourth part consist all 'D's, the third part of R is the turning part
%and there will be only one 'R' in this part. And you can see all the
%results are just like this: R...R-D...D-R-D...D-R...R. Since there will be
%some special occasions, sometimes the middle R will come together with
%'R'on two sides. 
    if sum1==b %%We will check whether the sum1 is equal to b.
        if i==1%%The turning point will be in the last column.
            d1=c(N-i);%%d1 is the number of the turning point in the matrix. 
            d2=N-i;%%d2 is the location of the turning point. 
        else
%%i==1 is one of the special situation, so we need to discuss it alone.
            d1=c(N-i+1);
            d2=N-i+1;
        end
        break %%The turning point is found, then the cycle will be broken.
    else %% We still need to look for the turning point.
        for j=1:M-1
            if sum1==b %% sum1 is equal to b, the turning point is coming.
               d1=c(N-i);
               d2=N-i;
               break%%The cycle is broken.
            else %% We still need to look for the turning point.            
               c(N-i)=c(N-i)+1;%%For one column, the number will start from
%1 to M, each step will add 1 to sum1, when sum1 is equal to b, the cycle
%will stop.
               sum1=sum1+1;
               d1=c(N-i);
               d2=N-i;
            end
         end
    end
end
%%How to find the turning point?
%%b is the differences between the minimum sum and the sum we input. At
%first,all the 'R's are in the first row, which means the pathway will 
%traversing all the '1', we will add from 1 to M in each cycle from the 
%last column to the first column. Once the sum1=b, then the number in the
%middle of the matrix will be the turning point. In some special situation,
%the turning point will be in the first column, the last row, the first row
%or the last column, which means the some parts of 'D's or 'R's will miss,
%but it doesn't influence the sequence.
for i=1:d2-1%%The first part of 'R's.
    A(i)='R';
end
for i=1:d1-1%%The second part of 'D's.
    A(d2-1+i)='D';
end
A(d1+d2-1)='R';%%The third part of R, the turning point. 
for i=d1:M-1
    A(d2+i)='D';%%The fourth part of 'D's.
end
for i=d2:N-2
    A(M+i)='R';%%The fifth part of 'R's.
end  
%%Output all the sequence.
fid=fopen('NTU101.txt','wt');
fprintf(fid,'%d ',sum);
fprintf(fid,'%s',A);
fclose(fid);
end