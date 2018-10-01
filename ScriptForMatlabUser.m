%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB script for generating map of UPC, UPV, etc. based on your private 
% Ingress GDPR Data.
%
% Denpendencies:
% * https://www.mathworks.com/matlabcentral/fileexchange/27627-zoharby-plot_google_map
% * https://www.mathworks.com/matlabcentral/fileexchange/65234-adclose-mars2wgs
% * https://www.mathworks.com/matlabcentral/fileexchange/23629-export_fig 
%
% Author: https://github.com/chouj 2018.10.01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


s=input('Input path of the folder where game_log.tsv is stored: ','s');
while exist(s, 'dir')~=7
    s=input('Folder does not exist. Re-enter: ','s');
end
while exist(fullfile(s,'game_log.tsv'))~=2
    s=input('game_log.tsv not found. Re-enter: ','s');
end

% read game_log.tsv into workspace
[time,lat,lon,event,response,comment] = textread(fullfile(s,'game_log.tsv'),'%s%s%s%s%s%s','headerlines',1,'delimiter','\t');



%%%%%%%%%%%%%%%%%%%%%%%%%%% UPV green %%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for i=1:length(time);
    if strcmp(lat{i},'None')==0
        % Pearl River Delta
        if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'hacked friendly portal')==1 | strcmp(event{i},'created link')==1 |...
                    strcmp(event{i},'mod deployed')==1 | strcmp(event{i},'resonator deployed')==1 |...
                    strcmp(event{i},'hacked enemy portal')==1 | strcmp(event{i},'resonator upgraded')==1
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
end

[clon,ialon,iblon]=unique(londata,'stable');
[clat,ialat,iblat]=unique(latdata,'stable');
index=union(ialat,ialon);
lonunique=londata(index);latunique=latdata(index); % duplicate checking

% coordinates transform
[latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);

f=figure;
plot(lonuniqueChina, latuniqueChina, '.g','MarkerSize',9) ;
hold on
clear londata latdata clon ialon iblon clat ialat iblat index lonunique latunique lonuniqueChina latuniqueChina

%%%%%%%%%%%%%%%%%%%%%%%%%%% fire XMP red %%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for i=1:length(time);
    if strcmp(lat{i},'None')==0
        % Pearl River Delta
        if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'fired weapon')==1
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
end

[clon,ialon,iblon]=unique(londata,'stable');
[clat,ialat,iblat]=unique(latdata,'stable');
index=union(ialat,ialon);
lonunique=londata(index);latunique=latdata(index); % duplicate checking

% coordinates transform
[latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);


plot(lonuniqueChina, latuniqueChina, '.r','MarkerSize',1.5) ;
clear londata latdata clon ialon iblon clat ialat iblat index lonunique latunique lonuniqueChina latuniqueChina

%%%%%%%%%%%%%%%%%%%%%%%%%%% login cyan %%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for i=1:length(time);
    if strcmp(lat{i},'None')==0
        % Pearl River Delta
        if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'login')==1
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
end

[clon,ialon,iblon]=unique(londata,'stable');
[clat,ialat,iblat]=unique(latdata,'stable');
index=union(ialat,ialon);
lonunique=londata(index);latunique=latdata(index); % duplicate checking

% coordinates transform
[latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);


plot(lonuniqueChina, latuniqueChina, '.c','MarkerSize',1.5) ;
clear londata latdata clon ialon iblon clat ialat iblat index lonunique latunique lonuniqueChina latuniqueChina

%%%%%%%%%%%%%%%%%%%%%%%%%%% UPC blue %%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for i=1:length(time);
    if strcmp(lat{i},'None')==0
        % Pearl River Delta
        if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'captured portal')==1 % Portal Captured
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
end

[clon,ialon,iblon]=unique(londata,'stable');
[clat,ialat,iblat]=unique(latdata,'stable');
index=union(ialat,ialon);
lonunique=londata(index);latunique=latdata(index); % duplicate checking

% write into a kml file
% filename = 'test_v2.kml';
% kmlwritepoint(filename, latunique, lonunique);

% coordinates transform
[latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);

plot(lonuniqueChina, latuniqueChina, '.b','MarkerSize',10) ;

clear londata latdata clon ialon iblon clat ialat iblat index lonunique latunique lonuniqueChina latuniqueChina

%%%%%%%%%%%%%%%%%%%%%%%%%%% dropped item yellow %%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for i=1:length(time);
    if strcmp(lat{i},'None')==0
        % Pearl River Delta
        if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'dropped item')==1
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
end

[clon,ialon,iblon]=unique(londata,'stable');
[clat,ialat,iblat]=unique(latdata,'stable');
index=union(ialat,ialon);
lonunique=londata(index);latunique=latdata(index); % duplicate checking

% coordinates transform
[latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);


plot(lonuniqueChina, latuniqueChina, '.y','MarkerSize',1.5) ;
clear londata latdata clon ialon iblon clat ialat iblat index lonunique latunique lonuniqueChina latuniqueChina

% add background of google map
plot_google_map('maptype', 'roadmap');
zoomHandle = zoom;
set(zoomHandle, 'ActionPostCallback', @update_google_map);

legend('Only UPV','Fired weapon','Login','UPC','Dropped item');
% export_fig f:\test_v1 -png -r300 -q111 -transparent
