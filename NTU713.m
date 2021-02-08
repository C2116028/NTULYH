function Z=NTU713
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.2\input_coordinates_7_2.txt
%
% 由 MATLAB 于 2021-02-04 19:05:54 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 6);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["x1", "x2", "x3", "x4", "x5", "x6"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
inputcoordinates72 = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.2\input_coordinates_7_2.txt", opts);

%% 转换为输出类型
inputcoordinates72 = table2array(inputcoordinates72);

%% 清除临时变量
clear opts

A=inputcoordinates72;
m=size(A);
M=m(1);
B='index';
fid=fopen('NTU703.txt','wt');
fprintf(fid,'%s',B);
fprintf(fid,'\n');
N=6;
for i=1:N
    L(i)=0;
end
L(1)=4;
L(2)=8;
L(3)=5;
L(4)=9;
L(5)=6;
L(6)=7;
for i=1:M
    index(i)=0;
end
for i=1:M
    for j=1:N
        C=A(i,N+1-j);
        for k=1:N-j
            C=C*L(k);
        end
    index(i)=index(i)+C;
    end%%The mathematical equation.
    fprintf(fid,'%d',index(i));
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end