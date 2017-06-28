function igmeread(input,location,jpgfile,plotq)
%IGMEREAD - Import IGME csv file from the low permeability testing unit.
%
% Syntax: igmeread(input,location,jpgfile,plotq)
%
%   MANDATORY ARGUMENT:
%   input    = base name for the csv file 
%
%   OPTIONAL ARGUMENTS:
%   location = text that appears in the title of the figure 
%   jpgfile  = name of the JPEG file in which the figure is saved 
%   plotq    = allows to decide wether the figure must contain a plot of
%              the flow rates
%   plotq    = 0 - no flow rate is displayed
%   plotq    = 1 - the flow rate is displayed
%
% Description:
%   The function allows to read the csv file that is produced by the data
%   acquisition of the hydrogeological testing unit of IGME. The result of
%   the function are two plots of the data as a function of time, either 
%   in date and time units, or in seconds since the begininig of the 
%   recording.
% 
%   The most important data (time, head in the test section, flow rate,
%   dates) are exported to the matlab workspace in the vectors t, h, q,
%   and d. Finally a JPEG figure is automatically produced for reporting. 
%
%   Note that only the first argument in the function call is required, the
%   three other arguments are optionnals.
%
% Example:
%   igmeread( 'cv2s1p1' )
%   igmeread( 'cv2s1p1', 'Cadalso de los Vidrios' )
%   igmeread( 'cv2s1p1', 'Cadalso de los Vidrios','cv2.jpg', 1 ) 
%   igmeread( 'cv2s1p1', 'Cadalso', 'cv2s2p1.jpg', 0);
%
% See Also: ldf, csvread



%% Check the input data for potential errors

if(nargin==0) % Is there at least one input argument ?
    disp(' ');
    disp(' ERROR: The function igmeget needs at list one input argument.')
    disp(' ');
    return
end

inputfile=sprintf('%s.csv',input); % Does the file exists ?
[fo,message]=fopen(inputfile,'r');
if( fo==-1 )
    disp(' ');
    disp(sprintf(' ERROR: File %s not found.',inputfile))
    disp(' ');
    return
end
fclose(fo);

if(nargin==1)              % If only one argument. 
  location=input;          % The title of the figure will be the  base name of the file
  jpgfile='tmpexport.jpg'; % The filename for the figure will be the default one
  plotq=-1;                 % By default q is ploted
end

if(nargin==2)              % If two arguments. 
  jpgfile='tmpexport.jpg'; % The filename for the figure will be the default one
  plotq=-1;                 % By default q is ploted
end

if(nargin==3)              % If three arguments. 
  plotq=-1;                 % By default q is ploted
end

%% Data import

disp(' IGMEREAD:')
disp(sprintf('   - Reading input file: %s',inputfile))
m=csvread(inputfile,1,1);
fo=fopen(inputfile,'r');
tline=fgets(fo);
tline=fgets(fo);
fclose(fo);

month=str2num(tline(1:2));
day=str2num(tline(4:5));
year=str2num(tline(7:10));
hour=str2num(tline(12:13));
minute=str2num(tline(15:16));
second=str2num(tline(18:19));
depart=datenum(year,month,day,hour,minute,second);

t=m(:,1);
d=depart+(t-t(1))/60/60/24;
p2=m(:,4);
p3=m(:,6);
p4=m(:,8);
c1=m(:,10)*1e-6/60;   % convert from ml/min to m3/s
c2=m(:,11)*1e-3/60;   % convert from  l/min to m3/s

% Cleaning the data
i=find(c1<0);
c1(i)=0;
i=find(c2<0);
c2(i)=0;

% Selection of c1
q=c1;

%%%%%%%   <<<<<==== TO CHANGE TO USE C2 INSTEAD OF C1

% q=c2;
% i=find(c2<0.3e-3*60);   %% IF YOU WANT AN AUTOMATIC COMBINATION
% q(i)=c1(i);

if max(q)<=0 & plotq==-1 
    plotq=0;
end

%% Produce figures to check the data

disp('   - Plotting the data')

ti=sprintf('%s',location);
%ti=sprintf('%s - %s',location,datestr(d(1),'dd mmmm yyyy'));

figure(1)
clf
if plotq ~= 0
  subplot(2,1,1)
end
plot(t,p2,t,p3,t,p4)
plot(d,p2,'k--',d,p3,'k-',d,p4,'k-.')
datetick
legend('P2','P3','P4')
title(ti)
xlabel('Time')
ylabel('Head in meter')
axis([d(1) d(end) min([p4;p2;p3])*0.95 max([p3;p2;p4])*1.05])
%axis tight

if plotq ~= 0
  subplot(2,1,2)
  plot(d,q,'k-')
  datetick
  legend('Q')
  xlabel('Time')
  ylabel('Flow in m^3/s')
  axis([d(1) d(end) 0 (max(0,max(q))+1e-9)*1.1])
end

figure(2)
clf
if plotq ~= 0
    subplot(2,1,1)
end
plot(t,p3)
legend('P3')
title(ti)
xlabel('Time in seconds')
ylabel('Head in meter')

if plotq ~= 0
  subplot(2,1,2)
  plot(t,q,'k-')
  legend('Q')
  xlabel('Time in seconds')
  ylabel('Flow in m^3/s')
  axis([t(1) t(end) 0 (max(0,max(q))+1e-9)*1.1])
end

%% Exporting data to workspace

disp('   - Exporting data to workspace:')
disp('     p3 as h, discharge rate as q, date as d, and time as t')
assignin('base','h',p3);
assignin('base','t',t);
assignin('base','q',q);
assignin('base','d',d);

%% Exporting Figure 1 in jpeg format


disp(sprintf('   - Exporting Figure 1 in the file %s',jpgfile))
figure(1)
print('-djpeg','-r300',jpgfile)
