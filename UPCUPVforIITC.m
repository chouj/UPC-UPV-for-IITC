disp('___________________________ UPC / UPV for IITC v1 ____________________________');
disp(' ');
disp('Generating coordinate information of UPC / UPV for IITC according to your ');
disp('private Ingress GDPR data.');
disp(' ');
disp('There will be a menu in the console (Windows command shell) for you to choose');
disp('what you want to obtain.');
disp(' ');
disp('A txt file contains the coordinates will be generated in the same folder where');
disp('game_log.tsv is stored. Copy/Paste its content into your IITC draw tool for');
disp('visualization.');
disp(' ');
disp('Note: purple marker stands for the portal you''ve ever captured while red one');
disp('stands for the portal you''ve ever visited but have not captured yet.');
disp(' ');

s=input('Input path of the folder where game_log.tsv is stored: ','s');
while exist(s, 'dir')~=7
    s=input('Folder does not exist. Re-enter: ','s');
end
while exist(fullfile(s,'game_log.tsv'))~=2
    s=input('game_log.tsv not found. Re-enter: ','s');
end

disp(' ');
disp('MENU:');
disp('1. Only UPC');
disp('2. Both UPC and UPV');
disp(' ');

c=input('Enter what you want to obtain, 1 or 2: ','s');
while str2num(c)~=1 & str2num(c)~=2 | isempty(str2num(c))==1
    c=input('1 or 2 ? Re-enter: ','s');
end

% read game_log.tsv into workspace
[time,lat,lon,event,response,comment] = textread(fullfile(s,'game_log.tsv'),'%s%s%s%s%s%s','headerlines',1,'delimiter','\t');
%t = datetime(time{1},'InputFormat','yyyy MM-dd HH:mm:ss');

if str2num(c)==1
    
    disp(' ');
    disp('Great. The coordinate information of all portals you have captured will be generated.');
    
    n=0;
    for i=1:length(time);
        if strcmp(lat{i},'None')==0
            % GuangZhou City
            % if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'captured portal')==1 % Portal Captured
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
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
    % [latuniqueChina,lonuniqueChina]=wgs2gcj(latunique,lonunique);
    % plot(lonuniqueChina, latuniqueChina, 'sr','MarkerSize',1.5) ;
    % plot_google_map('maptype', 'roadmap');
    % zoomHandle = zoom;
    % set(zoomHandle, 'ActionPostCallback', @update_google_map);
    % export_fig f:\test_v1 -png -r300 -q111 -transparent
    
    for i=1:length(latunique)
        iitctextitem{i}={['{"type":"marker","latLng":{"lat":',num2str(latunique(i)),...
            ',"lng":',num2str(lonunique(i)),'},"color":"#a24ac3"},']};
    end
    temp=cell2mat(strcat(iitctextitem{:}));
    iitctext=['[',temp];
    iitctext(end)=']';
    
    outputname='UPC_for_IITC.txt';
    fid=fopen(fullfile(s,outputname),'wt');
    fprintf(fid,'%s\n',iitctext);
    fclose(fid);
    disp(' ');
    disp('Processing succeeded!');
    disp(' ');
    disp(['Find UPC_for_IITC.txt in the folder ',s]);
    disp('Then, copy/paste its content into your IITC draw tool.');
    disp(' ');
    disp('Thanks for using @Chouj''s Matlab application. Have fun.');
    pause(10);
elseif str2num(c)==2
    
    disp(' ');
    disp('Great. The coordinate information of all portals you have captured/visited will be generated.');
    
    n=0;
    for i=1:length(time);
        if strcmp(lat{i},'None')==0
            % GuangZhou City
            % if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'captured portal')==1 % Portal Captured
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
    
    [clon,ialon,iblon]=unique(londata,'stable');
    [clat,ialat,iblat]=unique(latdata,'stable');
    index=union(ialat,ialon);
    lonunique=londata(index);latunique=latdata(index); % duplicate checking
    
    for i=1:length(latunique)
        iitctextitem{i}={['{"type":"marker","latLng":{"lat":',num2str(latunique(i)),...
            ',"lng":',num2str(lonunique(i)),'},"color":"#a24ac3"},']};
    end
    
    clear londata latdata clon ialon iblon clat ialat iblat index
    n=0;
    for i=1:length(time);
        if strcmp(lat{i},'None')==0
            % GuangZhou City
            % if str2num(lat{i})>21.5&str2num(lat{i})<23.5&str2num(lon{i})>112&str2num(lon{i})<115
            if strcmp(event{i},'hacked friendly portal')==1 | strcmp(event{i},'created link')==1 |...
                    strcmp(event{i},'mod deployed')==1 | strcmp(event{i},'resonator deployed')==1 |...
                    strcmp(event{i},'hacked enemy portal')==1 | strcmp(event{i},'resonator upgraded')==1
                n=n+1;
                londata(n)=str2num(lon{i});
                latdata(n)=str2num(lat{i});
            end
        end
    end
    
    [clon,ialon,iblon]=unique(londata,'stable');
    [clat,ialat,iblat]=unique(latdata,'stable');
    index=union(ialat,ialon);
    lonuniqueV=londata(index);latuniqueV=latdata(index); % duplicate checking
    
    clear clon ialon iblon clat ialat iblat
    [clat,ialat] = setdiff(latuniqueV,latunique,'stable');
    [clon,ialon] = setdiff(lonuniqueV,lonunique,'stable');
    index=union(ialat,ialon);
    lonuniqueUPV=lonuniqueV(index);
    latuniqueUPV=latuniqueV(index);
    
    for i=1:length(latuniqueUPV)
        iitctextitem{i+length(latunique)}={['{"type":"marker","latLng":{"lat":',num2str(latuniqueUPV(i)),...
            ',"lng":',num2str(lonuniqueUPV(i)),'},"color":"#FE2F02"},']};
    end
    
    temp=cell2mat(strcat(iitctextitem{:}));
    iitctext=['[',temp];
    iitctext(end)=']';
    
    outputname='UPCUPV_for_IITC.txt';
    fid=fopen(fullfile(s,outputname),'wt');
    fprintf(fid,'%s\n',iitctext);
    fclose(fid);
    disp(' ');
    disp('Processing succeeded!')
    disp(' ');
    disp(['Find UPCUPV_for_IITC.txt in the folder ',s]);
    disp('Then, copy/paste its content into your IITC draw tool.');
    disp('Note: purple marker stands for your UPC.');
    disp(' ');
    disp('Thanks for using @Chouj''s Matlab application. Have fun.');
    pause(10);
end