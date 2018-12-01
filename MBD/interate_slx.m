%%function
% this script is used to find the all the *.slx
% input_abs_path: current need process folder path
% in the code, the DFS is used, pay attention on the "currentIterateFiles = interate_slx(temp_path, temp_file);"
function result = interate_slx(input_abs_path, temp_file)
    content = dir(input_abs_path);
    tempCount = 0;
    
    currentPathCount = 0;
    currentPathFiles = struct('name_path',string,...
                              'path',string,...
                              'name',string,...
                              'InportName',{},...
                              'InportType',{},...
                              'OutportName',{},...
                              'OutportType',{});
                          
    currentIterateFiles = struct('name_path',string,...
                              'path',string,...
                              'name',string,...
                              'InportName',{},...
                              'InportType',{},...
                              'OutportName',{},...
                              'OutportType',{});
    
    if 2 >= length(content)
        result = temp_file;
        currentCount = tempCount;
        return ;
    end
    
    if 2 <= length(content)
        for i = 1:length(content)
    %         first, second is . .., so we shall consider whether it is
            if ~content(i).isdir && ~strcmp('.',content(i).name) && ~strcmp('..', content(i).name)
                split_content = strsplit(content(i).name, '.');
                if 2 ==  length(split_content)
                    test_split_content = split_content{2};
                    if strcmp('slx', test_split_content)
                        % record the document name
                        tempCount = tempCount + 1;
                        currentPathFiles(tempCount).name_path = strcat(input_abs_path,'\', content(i).name);
                        currentPathFiles(tempCount).path = input_abs_path;
                        currentPathFiles(tempCount).name = content(i).name;
                    end
                end
            elseif content(i).isdir && ~strcmp('.',content(i).name) && ~strcmp('..', content(i).name)
                temp_path = strcat(input_abs_path, '\', content(i).name);
    %             another round of iterate xmls
                currentIterateFiles = interate_slx(temp_path, temp_file);
    %             here need to pay attention the empty folder(as if the foler
    %             is empty, return value currentIterateFiles will be empty
    %             string
                for j = 1:length(currentIterateFiles)
                    if ~strcmp('', currentIterateFiles(j))
%                         here need to check why will return the empty string
                        if ~strcmp('', currentIterateFiles(j).name)
                            tempCount = tempCount + 1;
                            currentPathFiles(tempCount) =  currentIterateFiles(j);
                        end
                    end
                end
            else   
            end
        end
    end
result = currentPathFiles;
end