function Z=NTU714
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.2\input_index_7_2.txt
%
% 由 MATLAB 于 2021-02-05 10:11:11 自动生成

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 1);

% 指定范围和分隔符
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% 指定列名称和类型
opts.VariableNames = "index";
opts.VariableTypes = "double";

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
inputindex72 = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.2\input_index_7_2.txt", opts);

%% 转换为输出类型
inputindex72 = table2array(inputindex72);

%% 清除临时变量
clear opts
index=inputindex72;
L(1)=4;
L(2)=8;
L(3)=5;
L(4)=9;
L(5)=6;
L(6)=7;
n=size(index);
N=n(1);
M=6;
B='x';
fid=fopen('NTU704.txt','wt');
for i=1:M
    fprintf(fid,'%s',B);
    fprintf(fid,'%d      ',i);
end
fprintf(fid,'\n');
for i=1:N
    for j=1:M
        x(i,j)=0;
    end
end
for k=1:N
    for i=1:M
        A=1;
        for j=1:M-i
            A=A*L(j);
        end
        for j=1:L(M+1-i)
            if index(k)>=A
               index(k)=index(k)-A;
               x(k,M+1-i)=x(k,M+1-i)+1;
            else break;
            end
        end
    end
    for i=1:M
        fprintf(fid,'%d        ',x(k,i));
    end
    fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end