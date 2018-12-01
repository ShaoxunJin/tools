clc;clear;
result = string;
temp_file = string;
model_list = interate_slx(cd, temp_file);
model_list'
main_dir = 'C:\Active\MBD\CodeGeneration\SimulinkMBD_FEGE';

%%
target_module_list = {
%                         'AsyActtnArbnMgr.slx',...
%                       'AsyEvlrCritEve.slx',...
%                       'AsyFltMgr.slx',...
%                       'AsyHmiArbnMgr.slx',...
%                       'AutDrvCtrl.slx',...
%                       'CllsnFwdWarnCtrl.slx',...
%                       'CllsnRednByBrkgCtrl.slx',...
%                       'CmrLnAdpr.slx',...
%                       'DrvrStEstimr.slx',...
%                       'DstNotifCtrl.slx',...
%                       'DynCalMgr.slx',...
                        'InpAdpr.slx'
%                       'OutpAdpr.slx',...
%                       'LaneKeepAidCtrl.slx',...
%                       'LatCtrl.slx',...                    
%                       'LkaAdpr.slx',...
%                       'ObjFusn.slx',...
%                       'RoadFricFusn.slx',...
%                       'SnsrFusn.slx',...
%                       'SnsrFusnSlow.slx',...
%                       'SpdCtrl.slx',...
%                       'TarSeln.slx'...
                         };
%%
for IndexModel = 1:length(model_list)
    Record = false;
%     find if this module is in the list ?
    for IndexList = 1: length(target_module_list)
        if strcmp(target_module_list(IndexList), model_list(IndexModel).name)
            Record = true;
            break;
        end
    end
    
    if Record == true
        cd(model_list(IndexModel).path)
        load_system(model_list(IndexModel).name);
        portType = {'Inport';'Outport'};
        for indexPortType = 1:length(portType)
            portBlocks = find_system(bdroot,'SearchDepth',1,'BlockType', portType{indexPortType});
            portNames = cell(length(portBlocks),1);
            portTypes = cell(length(portBlocks),1);
    %         portTypes = cell(length(portBlocks),1);
    %     Inportblks = find_system( bdroot,'SearchDepth',1,'BlockType','Inport');
    %     Outportblks = find_system( bdroot,'SearchDepth',1,'BlockType','Outport');
    %     Inport_Names = cell(length(Inportblks),1);
    %     Inport_Types = cell(length(Inportblks),1);
            for Index = 1: length(portBlocks)
                portNames(Index) = get_param(portBlocks(Index),'Name');
                portTypes(Index) = get_param(portBlocks(Index),'OutDataTypeStr');
%                 if strcmp('Inport', portType(indexPortType))
% %                     InportName(Index) = get_param(portBlocks(Index),'Name');
% %                     InportType(Index) = get_param(portBlocks(Index),'OutDataTypeStr')
%                     InportName = portNames;
%                     InportType = portTypes;
%                     close_system(model_list(Index).name);
%     %                 model_list(IndexModel).InpName(Index) = get_param(portBlocks(Index),'Name');
%     %                 model_list(IndexModel).InpType(Index) = get_param(portBlocks(Index),'OutDataTypeStr');
%                 elseif strcmp('Outport', portType(indexPortType))
% %                     OutportName(Index) = get_param(portBlocks(Index),'Name');
% %                     OutportType(Index) = get_param(portBlocks(Index),'OutDataTypeStr');
%                     OutportName(Index) = portNames;
%                     OutportType(Index) = portTypes;
%                 end
            end
            
            close_system(model_list(IndexModel).name);
            cd(main_dir);
            sheet_name = [model_list(IndexModel).name,'_', portType{indexPortType}];
            xlswrite('port_info.xlsx',{'Port_Names'},sheet_name,'A1');
            xlswrite('port_info.xlsx',portNames,sheet_name,'A2');
            xlswrite('port_info.xlsx',{'Port_Types'},sheet_name,'B1');
            xlswrite('port_info.xlsx',portTypes,sheet_name,'B2');
        end
    end
end
%%
% end
% data = calculate_(6)
% aaa = dir(cd);
% name = string;
% count = 0
% for i = 3:length(aaa)
%     if 1 == aaa(i).isdir
%         count = count + 1;
%         name(count) = aaa(i).name;
%     end
% end
% name'
% 
% target_suffix = 'xls'
% test = 'jin.m'
% split_content = strsplit(test, '.');
% test_suffix = split_content{2}
% if strcmp(target_suffix, test_suffix)
%     fprintf('same suffix\n')
% else
%     fprintf('not same suffix\n')
% end