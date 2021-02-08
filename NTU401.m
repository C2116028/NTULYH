function Z=NTU401
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 4\input_question_4
%
% 由 MATLAB 于 2021-02-05 15:52:44 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 20);

% 指定范围和分隔符
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
inputquestion4 = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 4\input_question_4", opts);

%% 转换为输出类型
inputquestion4 = table2array(inputquestion4);

%% 清除临时变量
clear opts
A=inputquestion4;
M=size(A);
X=bwlabel(A,4);%%4-connectivity processing.
Y=bwlabel(A,8);%%8-connectivity processing.
fid=fopen('NTU401.txt','wt');
for i=1:M(1)
    for j=1:M(2)
        fprintf(fid,'%d ',X(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
fid=fopen('NTU402.txt','wt');
for i=1:M(1)
    for j=1:M(2)
        fprintf(fid,'%d ',Y(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end