function Z=NTU712
%% 从文本文件中导入数据
% 用于从以下文本文件中导入数据的脚本:
%
%    filename: C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.1\input_index_7_1.txt
%
% 由 MATLAB 于 2021-02-05 09:14:21 自动生成

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
inputindex71 = readtable("C:\Users\admin\Desktop\AY20_MBDS_questions\Question 7\Question 7.1\input_index_7_1.txt", opts);

%% 转换为输出类型
inputindex71 = table2array(inputindex71);

%% 清除临时变量
clear opts
index=inputindex71;
m=size(index);
M=m(1);
L1=50;
L2=57;
B='x';
fid=fopen('NTU702.txt','wt');
fprintf(fid,'%s',B);
fprintf(fid,'%d      ',1);
fprintf(fid,'%s',B);
fprintf(fid,'%d',2);
fprintf(fid,'\n');
for j=1:M
    x(j,2)=0;
    for i=1:L2
        if index(j)>=L1
           index(j)=index(j)-L1;
           x(j,2)=x(j,2)+1;%%Calculate x2.
        else break;
        end
    end
     x(j,1)=index(j);%%Calculate x1.
     if x(j,1)<10
     fprintf(fid,'%d        ',x(j,1));
     else fprintf(fid,'%d      ',x(j,1));
     end
     fprintf(fid,'%d',x(j,2));
     fprintf(fid,'\n');
end
fclose(fid);%%Output all the results.
end