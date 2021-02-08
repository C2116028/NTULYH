function Z=NTU301
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 3\train_data.txt
%
% 由 MATLAB 于 2021-02-05 11:24:34 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 3);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["x1", "x2", "x3"];
opts.VariableTypes = ["double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
traindata = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 3\train_data.txt", opts);

%% 转换为输出类型
traindata = table2array(traindata);
%% 清除临时变量
clear opts

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 1);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% 指定列名称和类型
opts.VariableNames = "y";
opts.VariableTypes = "double";

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
traintruth = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 3\train_truth.txt", opts);

%% 转换为输出类型
traintruth = table2array(traintruth);

%% 清除临时变量
clear opts

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 3);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% 指定列名称和类型
opts.VariableNames = ["x1", "x2", "x3"];
opts.VariableTypes = ["double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
testdata = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 3\test_data.txt", opts);

%% 转换为输出类型
testdata = table2array(testdata);

%% 清除临时变量
clear opts
M=size(testdata);
Y=traintruth;
net = newff(traindata',Y',4);%%Train net.
net = train(net,traindata',Y');%%Doing training.
outputs = net(testdata');%%Doing test.
fid=fopen('NTU301.txt','wt');
B='y';
fprintf(fid,'%s',B);
fprintf(fid,'\n');
for i=1:M(1)
    fprintf(fid,'%20.18f',outputs(i));
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end