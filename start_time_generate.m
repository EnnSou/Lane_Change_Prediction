%% Initialization and Configuration
clear all; clc;     % Clear environment, and start counting running time
ini = IniConfig();
ini.ReadFile('configuration.ini');

Data_Path = ini.GetValues('Dev Dataset Path', 'DATA_PATH');
home = ini.GetValues('Path Setting', 'HOME_PATH');
fd_list = dir(Data_Path);
num_folder = 0;

tic;                            % PROGRAM EFFICIENCY ESTIMATE
for i = 1:size(fd_list,1)
    stuct = fd_list(i,1);
    if (stuct.isdir == 1)
        num_folder = num_folder + 1;
    end
end
num_folder = num_folder - 2;    % ignore './' and '../'

enumeration Signals;

signal_number = 7;
Start_time_reference = cell(signal_number, num_folder);

for m = 1:num_folder
%     % read GSR.csv file  # 1
%     [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/GSR.csv'));
%     % find the column number of Timestamp
%     [truefalse, index]  = ismember('Timestamp', Header);
%     % convert double format to string format
%     GSR_start_Time      = datestr(Data(1,index), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.GSR, m} = GSR_start_Time;
%     
%     % read ECG.csv file  # 2
%     [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/ECG.csv'));
%     % find the column number of Timestamp
%     [truefalse, index]  = ismember('Timestamp', Header);
%     ECG_start_Time      = datestr(Data(1,index), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.ECG, m} = ECG_start_Time;
%     
%     % read RSP.csv file  # 3
%     [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/RSP.csv'));  % have some problem here
%     Header = Header(1,:);
%     % find the column number of Timestamp
%     [truefalse, index]  = ismember('Timestamp', Header);
%     RSP_start_Time      = datestr(Data(1,index), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.RSP, m} = RSP_start_Time;
%     
%     % read OBD.csv file  # 4
%     [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/OBD.csv'));
%     timeformat          = '[0-9]+:[0-9]+:[0-9]+ (PM|AM)';
%     reg_time            = regexp(Header{3,1}, timeformat, 'match');
%     OBD_start_Time      = datestr(cell2mat(reg_time), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.OBD, m} = OBD_start_Time;
%     
%     % read ECGraw.csv file # 5
%     [Data, Header, ~]   = xlsread(strcat(Data_Path, '/', num2str(m),'/ECGraw.csv'));
%     % find the column number of Timestamp
%     [truefalse, index] = ismember('Timestamp', Header);
%     % convert double format to string format
%     ECG_RAW_start_Time      = datestr(Data(1,index), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.ECG_RAW, m} = ECG_RAW_start_Time;
%     
%     % read GSRRaw.csv file # 6
%     [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/GSRRaw.csv'));
%     [truefalse, index]  = ismember('Timestamp', Header);
%     % convert double format to string format
%     GSR_RAW_start_Time  = datestr(Data(1,index), 'HH:MM:SS.FFF');
%     Start_time_reference{Signals.GSR_RAW, m} = GSR_RAW_start_Time;
    
    % read Belt.csv file # 7
    try
        [Data, Header, ~]   =  xlsread(strcat(Data_Path, '/', num2str(m),'/RSPraw.csv'));
        [truefalse, index]  = ismember('Timestamp', Header);
        % convert double format to string format
        BELT_RAW_start_Time  = datestr(Data(1,index), 'HH:MM:SS.FFF');
        Start_time_reference{Signals.BELT_RAW, m} = BELT_RAW_start_Time;
    catch
        continue;
    end
end         % end of program
save('Start_time_reference.mat', 'Start_time_reference');