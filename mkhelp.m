function mkhelp( option1, option2, option3 )
% MKHELP Internal script used to generate the help files for hytool.
%
%   Syntax: mkhelp( option1, option2, option3  )
%
%       options can be: 'html', 'demo', 'search'
% 
%   Description:
%      Build some components of the html help files.
%
%   Warning: do not use unless you are one of the hytool developpers!
%
% See also: mkhtml, mkdemo


htmlflag=0;
demoflag=0;
dbflag=0;

if(nargin==0) % Default value for d if not given by user
  htmlflag=1;
  demoflag=1;
  dbflag=1;
end
if(nargin==1) 
    options=option1;
end
if(nargin==2) 
    options=strcat(option1,option2);
end
if(nargin==3) 
    options=strcat(option1,option2,option3);
end
if( ~isempty(regexpi(options,'html')) )
    htmlflag=1;
end
if( ~isempty(regexpi(options,'demo')) )
    demoflag=1;
end
if( ~isempty(regexpi(options,'search')) )
    dbflag=1;
end

%instaldir='C:\Users\gehrenard\Travail\projects\1997_wtest\hytool';
instaldir='C:\Users\gehrenard\Travail\projets\libre\1997_wtest\hytool';
helpdir=[instaldir,'\html'];

%% Creates the html version of the individual routines help files

if( htmlflag==1 ) 
    cd(instaldir)

    % List of the models by category

    category(1)={'Interference tests'};
    tmp={...
        'ths','Theis (1935)','Ideal confined aquifer';...
        'thc','Theis (1941)','Linear constant head boundary';...
        'thn','Theis (1941)','Linear no flow boundary';...
        'pca','Papadopulos and Cooper (1967)','Large diameter well: 1 storativity';...
        'pcb','Papadopulos and Cooper (1967)','Large diameter well: 2 storativities';...
        'aga','Agarwal et al (1980)','Large diameter well with skin';...
        'jcb','Cooper and Jacob (1946)','Ideal confined aquifer'; ...
        'del','Delay (2004)','Fractal with anomalous diffusion'; ...
        'grf','Barker (1988)','General Radial Flow'; ...
        'htj','Hantush (1956)','Leaky aquifer'; ...
        'war','Warren and Root (1965)','Double porosity';...
        'blt','Boulton (1963)','Unconfined aquifer with delayed yield';...
        'grg','Gringarten and Ramey (1974)','Vertical fracture of infinite conductivity';...
        };
    models(1)={tmp};


    category(2)={'Single well test'};
    tmp={...
        'pcw','Papadopoulos and Cooper (1967)','Large diameter well';...
        'waw','Warren and Root + Well-bore storage','Large diameter well + double porosity';...
        'eha','Eden-Hazel (1980)','Step drawdown test - Quadratic head losses';...
        };
    models(2)={tmp};

    % Models to validate and integrate:
    %    'agw','Agarwal et al. (1980)','Large diameter and skin';...
    %    'hmb','Hamm and Bideaux (1996)','Large diameter, double porosity, skin, fractal';...

    category(3)={'Variable rate interference tests'};
    tmp={....
        'tmr','Theis (1935)','Stepwise variable rate';...
        'tmc','Theis (1941)','Linear constant head boundary with stepwise variable rate';...
        };
    models(3)={tmp};
    % Models to validate and integrate:
    %    'vrt','Theis (1935)','Continuously variable rate';..
    %    'lvr','Theis (1935)','Linearly variable rate';...

    category(4)={'Slug and other tests'};
    tmp={...
        'csl','Cooper et al. (1967)','Slug test confined aquifer';...
        'nsl','Neuzil (1982)','Pulse test confined aquifer';...
        'jlq','Jacob and Lohman (1952)','Constant head test';...
        'dsq','Doe and Geier (1990)','Constant head test with skin';...
        };
    models(4)={tmp};
    % Models to validate and integrate:
    %    'hvs','Hvorslev (1951)','Slug test confined aquifer';...

    nbcategories=size(models,2);

    %% Generates the file listofmodels.html which is basically the table
    %  indicating all the possible prefixes.

    f=fopen('listmodels.html','w');

    fprintf(f,'<html>');
    fprintf(f,'<head>');
    fprintf(f,'<title>Hytool Toolbox Documentation</title>\n');
    fprintf(f,'<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\n');
    fprintf(f,'<link rel="stylesheet" type="text/css" href="hytool.css">\n');
    fprintf(f,'</head>\n');
    fprintf(f,'<body>\n');
    fprintf(f,'<table width="100%%" border=0 cellpadding=0 cellspacing=0><tr>\n');
    fprintf(f,'<td valign=baseline bgcolor="#e7ebf7">\n');
    fprintf(f,'<b>Hydrogeological Toolbox</b></td></tr></table>\n');
    fprintf(f,'<h1>Model names</h1>');
    for ic=1:nbcategories
        nomcat=cell2mat(category(ic));
        nbmodels=size(models{ic},1);
        fprintf(f,'<h2>%s</h2>\n',nomcat);
        fprintf(f,'<table border="0">');
        for im=1:nbmodels
            prefix=cell2mat(models{ic}(im,1));
            link=strcat(prefix,'_dim.html');
            refer=cell2mat(models{ic}(im,2));
            comment=cell2mat(models{ic}(im,3));
            legend=strcat(refer,' - ',comment);
            fprintf(f,'<tr><td width="30"><a href="%s">%s</a></td>\n',link,prefix);
            fprintf(f,' <td width="700"> %s </td>\n',legend);
        end
        fprintf(f,'</table></p>\n');
    end
    fprintf(f,'<table width="100%%" border=0 cellpadding=0 cellspacing=0><tr>');
    fprintf(f,'<td valign=baseline bgcolor="#e7ebf7">Hytool</td></tr></table>');
    fprintf(f,'<p>&copy; 1998-2017 Philippe Renard and Co.');
    fprintf(f,'<tt class="minicdot">&#149;</tt> <a href="file:license.txt">Terms of Use</a> ');
    fprintf(f,'<tt class="minicdot">&#149;</tt> <a href="file:acknowledgments.html">Acknowledgments</a></p>');
    fprintf(f,'</body>');
    fprintf(f,'</html>');

    fclose(f);


    %% Prepare all the individual html files except the demos

    cd(instaldir)
    listefilename=dir('*.m');
    listefilename={listefilename.name};

    for f=1:length(listefilename)
        filename=listefilename{f};
        [pathstr,name,ext] = fileparts(filename);
        if( isempty(strfind(name,'dmo')) )
            disp(name)
            mkhtml(name)
        end
    end

    system('mv *.html html');


    %% Alphabetical list

    f=fopen('alphabetical.html','w');
    fprintf(f,'<html>');
    fprintf(f,'<head>');
    fprintf(f,'<title>Hytool Toolbox Documentation</title>\n');
    fprintf(f,'<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\n');
    fprintf(f,'<link rel="stylesheet" type="text/css" href="hytool.css">\n');
    fprintf(f,'</head>\n');
    fprintf(f,'<body>\n');
    fprintf(f,'<table width="100%%" border=0 cellpadding=0 cellspacing=0><tr>\n');
    fprintf(f,'<td valign=baseline bgcolor="#e7ebf7">\n');
    fprintf(f,'<b>Hydrogeological Toolbox</b></td></tr></table>\n');
    fprintf(f,'<h1>Functions — Alphabetical List</h1>');

    fprintf(f,'<table border="0">');
    for i=1:length(listefilename)
        filename=listefilename{i};
        [pathstr,name,ext] = fileparts(filename);
        fprintf(f,'<tr><td width="50%%"><a href="%s.html">%s</a></td></tr>\n',name,name);
    end
    fprintf(f,'</table></p>\n');
    fclose(f);
    system('mv alphabetical.html html');

end
%% Prepare the demo html files
if( demoflag==1 )
    cd(instaldir)
    listefilename=dir('*_dmo.m');
    listefilename={listefilename.name};

    cd(helpdir)
    for f=1:length(listefilename)
        filename=listefilename{f};
        [pathstr,name,ext] = fileparts(filename);
        disp(name)
        mkdemo(name)
    end
end

%% Build the searchable data base : helpsearch directory

    
if( dbflag==1 )
    cd(instaldir)
    builddocsearchdb(helpdir)
end
