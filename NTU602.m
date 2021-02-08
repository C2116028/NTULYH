function A=NTU602
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 6\input_question_6_points.txt
%
% 由 MATLAB 于 2021-02-04 16:38:57 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 2);

% 指定范围和分隔符
opts.DataLines = [1, Inf];
opts.Delimiter = " ";

% 指定列名称和类型
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% 导入数据
inputquestion6points = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 6\input_question_6_points.txt", opts);

%% 转换为输出类型
inputquestion6points = table2array(inputquestion6points);

%% 清除临时变量
clear opts

opts = delimitedTextImportOptions("NumVariables", 2);

% 指定范围和分隔符
opts.DataLines = [1, Inf];
opts.Delimiter = " ";

% 指定列名称和类型
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% 导入数据
inputquestion6polygon = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 6\input_question_6_polygon.txt", opts);

%% 转换为输出类型
inputquestion6polygon = table2array(inputquestion6polygon);

%% 清除临时变量
clear opts

B=inputquestion6points;
A=inputquestion6polygon;
m=size(A);
n=size(B);
M=m(1);
N=n(1);
fid=fopen('NTU601.txt','wt');
for i=1:N
    C(i)=0;%Intermidate variable.
end
%%Here we default all points in the first quadrant.
for i=1:N
    k0=B(i,2)/B(i,1);%%Calculate the gradient of the line connecting point 
%B to the origin.
    for j=1:M-1%%Check whether the line segment between point B and the 
%origin will have an intersection with one edge of the polygon.
        k1=A(j,2)/A(j,1);%%Calculate the gradient of the line connecting 
%two end points of the edge of the polygon.
        k2=A(j+1,2)/A(j+1,1);
        if k1==k0 %%Special situation: the origin, end point of the edge 
%and the point B are on the same line.Then we will check whether the two 
%edges of this vertice are on either side of the line section between the
%point B and the origin. If YES, then will check whether the vertice of the
%polygon is on the line section between the point B and the origin.
            if k2>k0
                if j==1
                    kM=A(M,2)/A(M,1);
                    if kM<k0
                        if A(j,1)<B(i,1)
                           C(i)=C(i)+1;
                        end
                    end                               
                end   
                if j~=1
                    k4=A(j-1,2)/A(j-1,1);
                    if k4<k0
                        if A(j,1)<B(i,1)
                           C(i)=C(i)+1;
                        end
                    end
                end                        
            end
            
            if k2<k0
                if j==1
                    kM=A(M,2)/A(M,1);
                    if kM>k0
                        if A(j,1)<B(i,1)
                           C(i)=C(i)+1;
                        end
                    end                               
                end   
                if j~=1
                    k4=A(j-1,2)/A(j-1,1);
                    if k4>k0
                        if A(j,1)<B(i,1)
                           C(i)=C(i)+1;
                        end
                    end
                end                        
            end 
            
            if k2==k0%%Special special situation: one edge coincides with 
%the line section between point B and the origin. In this situtaion, we
%will check the other two edges that connected with this edge of the
%polygon, to see whether the two edges are on ether sides of the line
%section. If YES, then check whether the two vertices are on the line
%section between the point B and origin. Since the vertices are ordinal, 
%we have to consider the first, second, last and second to last as special
%situation to discuss them alone.
                if j==1
                    k3=A(3,2)/A(3,1);
                    k4=A(M,2)/A(M,1);
                    if k3>k0
                        if k4<k0
                            if B(i,1)>max(A(j,1),A(j+1,1))
                                C(i)=C(i)+1;
                            end
                        end
                    end
                    if k3<k0
                        if k4>k0
                            if B(i,1)>max(A(j,1),A(j+1,1))
                                C(i)=C(i)+1;
                            end
                        end
                    end
                end
                if j==M-1
                        k3=A(1,2)/A(1,1);
                        k4=A(M-2,2)/A(M-2,1);
                        if k3>k0
                           if k4<k0
                              if B(i,1)>max(A(j,1),A(j+1,1))
                                 C(i)=C(i)+1;
                              end
                           end
                        end
                        if k3<k0
                           if k4>k0
                              if B(i,1)>max(A(j,1),A(j+1,1))
                                 C(i)=C(i)+1;
                              end
                           end
                        end
                end
                    if ((j~=1)&&(j~=M-1))==1
                        k3=A(j+2,2)/A(j+2,1);
                        k4=A(j-1,2)/A(j-1,1);
                        if k3>k0
                           if k4<k0
                              if B(i,1)>max(A(j,1),A(j+1,1))
                                 C(i)=C(i)+1;
                              end
                           end
                        end
                        if k3<k0
                           if k4>k0
                              if B(i,1)>max(A(j,1),A(j+1,1))
                                 C(i)=C(i)+1;
                              end
                           end
                        end
                    end
              end            
           end
            
        if k1<k0%%Common situation
            if k2>k0%%Two end points of the edge of the polygon are on 
%the either sides of the line section between point B and the origin.
                if A(j+1,1)==A(j,1)%%Special occasion: the edge of the 
%polygon is perpendicular to the x-axis.
                    if A(j,1)<B(i,1)%%The edge of the polygon and line 
%section have one intersection point.
                        C(i)=C(i)+1;
                    end
                else%%Common occasion: the process to find the coordinate 
%of the intersection of the line and the edge of the polygon.
                    k3=(A(j+1,2)-A(j,2))/(A(j+1,1)-A(j,1));
                    b=A(j,2)-k3*A(j,1);
                    D1=[k3,-1;k0,-1];
                    D2=[-b;0];
                    D3=D1\D2;
                    if D3(1)<B(i,1)%%Check whether the point is on the line 
%section between point B and the origin.
                       C(i)=C(i)+1;
                    end
                end
            end
        end
        if k1>k0%% The same situation as previously stated.The only 
%difference is that the inequality is the opposite.
            if k2<k0
                if A(j+1,1)==A(j,1)
                    if A(j,1)<B(i,1)
                        C(i)=C(i)+1;
                    end
                else
                    k3=(A(j+1,2)-A(j,2))/(A(j+1,1)-A(j,1));
                    b=A(j,2)-k3*A(j,1);
                    D1=[k3,-1;k0,-1];
                    D2=[-b;0];
                    D3=D1\D2;
                    if D3(1)<B(i,1)
                       C(i)=C(i)+1;
                    end
                end
            end
        end
    end
k1=A(M,2)/A(M,1);%% The last situation: the edge of the polygon consists of
%the first and the last point of the polygon that we input.Then the process
%is the same as previously stated.
k2=A(1,2)/A(1,1);
if k1==k0
    kM=A(M-1,2)/A(M-1,1);
   if k2>k0
       if kM<k0
           if A(M,1)<B(i,1)
               C(i)=C(i)+1;
           end
       end
   end
   if k2<k0
       if kM>k0
           if A(M,1)<B(i,1)
               C(i)=C(i)+1;
           end
       end
   end
   if k2==0
       k4=A(2,2)/A(2,1);
       if k4<k0
           if kM>k0
               if B(i,1)>max(A(1,1),A(M,1))
                   C(i)=C(i)+1;
               end
           end
       end
       if k4>k0
           if kM<k0
               if B(i,1)>max(A(1,1),A(M,1))
                   C(i)=C(i)+1;
               end
           end
       end
   end
end
if k1<k0
   if k2>k0
       if A(1,1)==A(M,1)
           if A(M,1)<B(i,1)
               C(i)=C(i)+1;
           end
       else
           k3=(A(1,2)-A(M,2))/(A(1,1)-A(M,1));
           b=A(M,2)-k3*A(M,1);
           D1=[k3,-1;k0,-1];
           D2=[-b;0];
           D3=D1\D2;
           if D3(1)<B(i,1)
              C(i)=C(i)+1;
           end
       end
   end
end
if k1>k0
   if k2<k0
      if A(1,1)==A(M,1)
           if A(M,1)<B(i,1)
               C(i)=C(i)+1;
           end
       else
           k3=(A(1,2)-A(M,2))/(A(1,1)-A(M,1));
           b=A(M,2)-k3*A(M,1);
           D1=[k3,-1;k0,-1];
           D2=[-b;0];
           D3=D1\D2;
           if D3(1)<B(i,1)
              C(i)=C(i)+1;
           end
      end
   end    
end
E=rem(C(i),2);%%Check the number of intersection points of the line section
%between each testing point and the origin and all the edges of the
%polygon.If there are an odd number of the intersection points, then the
%point B is inside of the polygon. If there are an even number of the 
%intersection points, then the point B is outside of the polygon. 
if E==1
    d='inside';
else d='outside';
end
fprintf(fid,'%d ',B(i,1));
fprintf(fid,'%d ',B(i,2));
fprintf(fid,'%s',d);
fprintf(fid,'\n');
end
fclose(fid);%Output the result.
end