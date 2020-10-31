addpath(genpath('/Users/wu/Documents/MATLAB/work/lib_basic/'));
%EEGLAB:
addpath('/Users/wu/Documents/MATLAB/work/toolbox/eeglab14_0_0b/');
addpath('/Users/wu/Documents/MATLAB/work/toolbox/eeglab14_0_0b/sample_locs');
addpath(genpath('/Users/wu/Documents/MATLAB/work/toolbox/eeglab14_0_0b/functions'));
addpath(genpath('/Users/wu/Documents/MATLAB/work/toolbox/eeglab14_0_0b/plugins'));

eventtypes = {'ERN13','ERN2','go_FRN2','go1','nogo1',...
    'go2','nogo2','go3','nogo3'};
baseline = 100;
group_name = {'s1_only', 's1', 's2'};
%group_name = 'test';
%test = ITC_read_egi_ave(eventtypes,baseline,...
%    group_name,ID_type,net_type);
ID_type = 3;
net_type = 1;
for i = 1:length(group_name)
    EEG_ave(i) = ITC_read_egi_ave(eventtypes,baseline,...
    group_name{i},ID_type,net_type, ['ave/ave_raw_' group_name{i} '/']);
end

poi(1).name = 'ERN';
poi(1).cluster = [16, 11, 19, 4, 12, 5, 6];
poi(1).time = [0, 70];
poi(1).stats_type = 'negpeak';
poi(1).condition_selected = [1,2];

poi(2).name = 'FRN';
poi(2).cluster = [16, 11, 19, 4, 12, 5, 6];
poi(2).time = [200, 350];
poi(2).stats_type = 'negpeak';
poi(2).condition_selected = 3;

poi(3).name = 'frontalN1';
poi(3).cluster = [16, 11, 19, 4, 12, 5, 6];
poi(3).time = [0, 200];
poi(3).stats_type = 'negpeak';
poi(3).condition_selected = 4:9;

poi(4).name = 'frontalN2';
poi(4).cluster = [16, 11, 19, 4, 12, 5, 6];
poi(4).time = [200, 350];
poi(4).stats_type = 'negpeak';
poi(4).condition_selected = 4:9;

poi(5).name = 'frontalSW';
poi(5).cluster = [16, 11, 19, 4, 12, 5, 6];
poi(5).time = [500, 600];
poi(5).stats_type = 'avg';
poi(5).condition_selected = 4:9;


poi(6).name = 'posteriorP1';
poi(6).cluster = [71, 76, 75, 74, 81, 82];
poi(6).time = [0, 150];
poi(6).stats_type = 'pospeak';
poi(6).condition_selected = 4:9;


poi(7).name = 'posteriorN1';
poi(7).cluster = [71, 76, 75, 74, 81, 82];
poi(7).time = [100, 250];
poi(7).stats_type = 'negpeak';
poi(7).condition_selected = 4:9;


poi(8).name = 'posterioP3';
poi(8).cluster = [71, 76, 75, 74, 81, 82];
poi(8).time = [200, 350];
poi(8).stats_type = 'avg';
poi(8).condition_selected = 4:9;


poi(9).name = 'posteriorSW';
poi(9).cluster = [71, 76, 75, 74, 81, 82];
poi(9).time = [350, 500];
poi(9).stats_type = 'avg';
poi(9).condition_selected = 4:9;

filename_export = 'export_ERP_gonogo.csv';
FH_multiple_poi(EEG_ave, poi, filename_export);