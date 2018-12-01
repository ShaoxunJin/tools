[filename filepath] = uigetfile('*.slx');
uiopen([filepath filename],1);
Inportblks = find_system( bdroot,'SearchDepth',1,'BlockType','Inport');
Outportblks = find_system( bdroot,'SearchDepth',1,'BlockType','Outport');
Inport_Names = cell(length(Inportblks),1);
Inport_Types = cell(length(Inportblks),1);
for Index = 1: length(Inportblks)
Inport_Names(Index) = get_param(Inportblks(Index),'Name');
Inport_Types(Index)  = get_param(Inportblks(Index),'OutDataTypeStr');
end
Outport_Names = cell(length(Outportblks),1);
Outport_Types = cell(length(Outportblks),1);
for Index = 1: length(Outportblks)
Outport_Names(Index) = get_param(Outportblks(Index),'Name');
Outport_Types(Index)  = get_param(Outportblks(Index),'OutDataTypeStr');
end
[filename filepath] = uigetfile('*.xlsx');
[status,sheets] = xlsfinfo([filepath filename]);

xlswrite([filepath filename],Inport_Names,sheets{1},'D3')
xlswrite([filepath filename],Inport_Types,sheets{1},'E3')
xlswrite([filepath filename],Outport_Names,sheets{2},'D3')
xlswrite([filepath filename],Outport_Types,sheets{2},'E3')