function mkhtml(name, checkvisu)
%MKHTML Create individual HTML help file from a matlab file
%
% Syntax: mkhtml( basename , checkvisu )
%
%       basename  = name of the function without the .m extension
%       checkvisu = optional argument allowing to decide wether
%                   mkhtmldoc opens the html file in the web browser
%                   after it has been created.
%                   1 means open the browser, 0 means do not show it
%
%
% Description:
%   This is an internal function used to build the html help of hytool.
%   It has been inspired by makehtmldoc from F. Moisy but significantly
%   modified to account for the specifity of hytool and in order to be less
%   general than the original version.
%
% Example:
%   mkhtml('trial')
%   mkhtml('ldf',1)
%
% See also: mkhelp


if(nargin==1) % Default value for d if not given by user
  checkvisu=0;
end

% Get the filename
filename=strcat(name,'.m');
% Create the output file name 
htmlfilename=strcat(name,'.html');

% Open the output file
fid=fopen(htmlfilename,'w');
if fid==-1
    error(['Can''t create ' htmlfilename]);
end;

% Check if it is a demo file in order to add a link
% allowing to run the demo in the command window
demoflag=regexpi(filename,'dmo');

% head of the html page:
fprintf(fid,'<html>\n');
fprintf(fid,'<head>\n');
fprintf(fid,'<title>%s :: Functions (Hytool Toolbox)</title>\n',name);
fprintf(fid,'<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\n');
fprintf(fid,'<link rel="stylesheet" type="text/css" href="hytool.css">\n');
fprintf(fid,'</head>\n\n');
fprintf(fid,'<body>\n');
fprintf(fid,'<table width="100%%" border=0 cellpadding=0 cellspacing=0><tr>\n');
fprintf(fid,'<td valign=baseline bgcolor="#e7ebf7">\n');
fprintf(fid,'<b>HYTOOL Function Reference</b></td></tr></table>\n\n');
fprintf(fid,'<h1>%s</h1>\n',name);

helptext=help(filename);

% number of initial spaces to jump at each line
% (this value may be overestimated):
firstchar=6;

remhelptext=helptext; % initialize the remainder of the help text
firstline = true;
while ~isempty(remhelptext),
    %extracts the first line of the remainder of the help text:
    pnextenter=strfind(remhelptext,10); pnextenter=pnextenter(1);
    curline=remhelptext(1:(pnextenter-1)); % current line

    % removes the < and > signs (confusion with html syntax):
    curline=strrep(curline,'<','&lt;');
    curline=strrep(curline,'>','&gt;');

    if firstline, % the first line of the help text is the name of the function
        % The name of the function has already been set
        % Now we search (regexpi) the name in the line and take
        % the remaining of the line.
        curline=curline(regexpi(curline,name)+length(name)+1:end);
        curline=eliminateminus(curline);
        fprintf(fid,'<p>%s</p>\n',curline);
        firstline = false;
        currentsection=0;
    else

        
%         % removes the first white spaces:
%         curline=[curline '           '];
%         while ~isequal(curline(firstchar-1),' '),
%             firstchar=firstchar-1; %
%         end;
%         % removes the last white spaces:
%         curline=deblank(curline(firstchar:end));

        
        % #########################
        % Detect section titles in order to add headers
        % #########################
        
        % List of the titles
        stitles={'Syntax','See Also','Description','Example'};
        % Loop of the different possible titles
        for is=1:4
            % take one title from the list above
            sectiontitle=cell2mat(stitles(is));
            titletosearch=[sectiontitle,':'];
            % Search for the position of the section title in the line
            idse=regexpi(curline,titletosearch);
            % If it is found:
            if ((~isempty(idse))&&(length(curline)>2)),
                if( is>1 )
                    fprintf(fid,'</pre>\n');
                end
                % Print the title in the html file
                fprintf(fid,'<h2>%s</h2>\n',sectiontitle);
                fprintf(fid,'<pre>');
                % Then it must be removed from the rest of the line
                % Get the position of the title on the line
                % Remove the section title from the line
                idse=min(idse+length(titletosearch));
                if idse<=length(curline)
                    curline=curline(idse:end);
                else
                    curline='';
                end
                % look for the first character after
                seealsotoken=strtok(curline);
                idse=strfind(curline,seealsotoken);
                if (~isempty(idse))
                    idse=idse(1); curline=curline(idse:end);
                end
                
                % #########################
                % In this part we build the links for the See also section
                % #########################

                % is==2 for the See also section
                if( is==2 )
                    % This is used to place no commas before the first link
                    firstitem=true;
                    % Remove commas and colon in the current line 
                    % (The function to do that is included in the end of
                    % this file.)
                    curline=eliminatecommacolon(curline);
                    while true % Infinite loop
                        % Extract one token
                        [namelink,curline]=strtok(curline); 
                        if( isempty(namelink) ) % End of the loop
                            break
                        end
                        if firstitem           % Do not put a comma
                            firstitem=false;
                        else
                            fprintf(fid,', ');  % Put a comma between two tokens
                        end
                        fprintf(fid,'<a href="%s.html">%s</a>',namelink,namelink);
                    end
                end
                % #######################
            end;
        end

        % Check if there is the Copyright word in order to remove the
        % end of the sentence that would duplicate the trailer of the html
        % file
        iscopyright=regexpi(curline,'Copyright');
        if (~isempty(iscopyright))
              curline=curline(1:iscopyright(1)-1);
        end
        
        fprintf(fid,'%s\n',curline);
    end;
    remhelptext=remhelptext((pnextenter+1):end); % new remainder
end;
fprintf(fid,'%s\n','</pre>');  % end of "code" section

% foot of the html page:
fprintf(fid,'\n');

% Add a link to run the demo when it is a demo
if( ~isempty(demoflag) )
    fprintf(fid,'<p>\n');
    fprintf(fid,'<a href="matlab:echodemo %s">',name);
    fprintf(fid,'Run in the Command Window</a></p>\n');
end

fprintf(fid,'<table width="100%%" border=0 cellpadding=0 cellspacing=0>\n');
fprintf(fid,'<tr><td valign=baseline bgcolor="#e7ebf7">Hytool</td></tr></table>\n');
fprintf(fid,'<p>&copy; 1998-2017 Philppe Renard and Co.\n');
fprintf(fid,'<tt class="minicdot">&#149;</tt> <a href="license.txt">Terms of Use</a>\n');
fprintf(fid,'<tt class="minicdot">&#149;</tt> <a href="acknowledgments.html">Acknowledgments</a></p>\n');
fprintf(fid,'</body></html>\n');
fclose(fid);

% Visualize the results to check - can be commented 
if( checkvisu==1 )
    web(htmlfilename)
end

    


%===============================================================================
function outputstr = eliminatecommacolon(inputstr)

cpos=strfind(inputstr,',');
inputstr(cpos)=[];
cpos=strfind(inputstr,':');
inputstr(cpos)=[];
outputstr=inputstr;


%===============================================================================
function outputstr = eliminateminus(inputstr)

cpos=strfind(inputstr,'-');
inputstr(cpos)=[];
outputstr=inputstr;    
