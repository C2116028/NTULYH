function Z=NTU711
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.1\input_coordinates_7_1.txt
%
% 由 MATLAB 于 2021-02-04 18:14:43 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 2);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["x1", "x2"];
opts.VariableTypes = ["double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
inputcoordinates71 = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.1\input_coordinates_7_1.txt", opts);

%% 转换为输出类型
inputcoordinates71 = table2array(inputcoordinates71);

%% 清除临时变量
clear opts
A=inputcoordinates71;
m=size(A);
M=m(1);
L1=50;
L2=57;
B='index';
fid=fopen('NTU701.txt','wt');
fprintf(fid,'%s',B);
fprintf(fid,'\n');
for i=1:M
    index(i)=A(i,2)*L1+A(i,1);%%The mathematical equation.
    fprintf(fid,'%d',index(i));
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end