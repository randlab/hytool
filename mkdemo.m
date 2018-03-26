function mkdemo(name)
%MKDEMO  Internal function used to create the html demo files
%
%   Syntax: mkdemo(name)
%
%       name is the name of demo file without the html extension.
%
%   Warning: do not use unless you are one of the hytool developpers!
%
% See also: mkhelp


% Use the publish function of matlab to create the html demo file

filename=publish(name);
[pathstr,name,ext] = fileparts(filename);
% Open the html file that has just been created
htmlfilename=strcat(name,'.html');
fid=fopen(htmlfilename,'r');
if fid==-1
    error(['Can''t open ' htmlfilename]);
end;
% Open a temporary output html file
fo=fopen('tmp.html','w');

% Loop over all the lines of the input file
while 1
    tline = fgetl(fid); % read a line 
    if ~ischar(tline)   % if empty the file is finished
        break
    end
    % Copy the line in the output file
    fprintf(fo,'%s\n',tline); 
    % if the line contains <body> it is the place where we must add the
    % header and the link
    isbody=strfind(tline,'<body>');
    if ~isempty(isbody)                                                                     
        fprintf(fo,'<table width="100%%" border=0 cellpadding=0 cellspacing=0><tr>\n');               
        fprintf(fo,'<td valign=baseline bgcolor="#e7ebf7">\n');
        fprintf(fo,'<b>HYTOOL Demo</b></td></tr></table>\n');
        fprintf(fo,'<p><a href="matlab:echodemo %s">\n',name);
        fprintf(fo,'Run in the Command Window</a></p>\n');
    end
end
% Close the two files
fclose(fid);
fclose(fo);

% Rename the temporary file to replace the original one

    if isunix
        tcmo=sprintf('mv tmp.html %s.html',name);
        system(tcmo);
    elseif ispc
        tcmo=sprintf('move tmp.html %s.html',name);
        system(tcmo);
    end

% Show the results
%web(htmlfilename)
