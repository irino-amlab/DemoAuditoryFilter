﻿%
%     Demonstrations for introducting auditory filters
%     DemoAF_PrintFig
%     Irino, T.
%     Created:  20 Mar 2010
%     Modified: 20 Mar 2010
%     Modified: 11 May 2010 (function)
%     Modified: 25 Jun 2010 (eps)
%     Modified: 27 Jul 2010 (SwEps = 0)
%     Modified: 18 Aug 2010 (Linewidth)
%     Modified:  2 Sep 2010 (No print on Octave)
%     Modified: 25 May 2015 (introduction of SwPrint)
%     Modified: 12 Dec 2017 (eval('print -deps -tiff ') --> NG MATLAB2017a)
%     Modified: 21 Jan 2018 (print(Name, '-deps', '-tiff'))
%     Modified: 17 Aug 2018 (if SwPrint == 2, set(gcf,'PaperPosition',[2 2 27 20]))
%     Modified: 17 Apr 2020 (Win octave でもprintできた。）
%     Modified: 17 Jul 2023 (Win Octave8.2.0で、epsが出力できずフリーズ。その行をコメントアウト。
%
%
function DemoAF_PrintFig(NameFig,SwPrint)

if nargin < 2, SwPrint = []; end
if length(SwPrint)==0, SwPrint = 1; end

%if exist('OCTAVE_VERSION') > 0,
%    warning('No print on Octave.');
%    SwPrint = 0;
%    return;
%end;

if SwPrint  < 1
    warning(['No print.  SwPrint = ' int2str(SwPrint) '.']);
    return;
end

%% for MATLAB

set(0,'DefaultTextFontSize',12);
set(0,'DefaultAxesFontSize',12);

if 0
    set(0,'DefaultAxesLinewidth', 1.0);
    set(0,'DefaultLineLinewidth', 1.0);
    set(0,'DefaultPatchLinewidth', 1.0);
end

set(gcf,'PaperOrientation','portrait');
set(gcf,'PaperUnits','centimeters');
set(gcf,'PaperPosition',[3 8 14 12]);
if SwPrint == 2  % for Excitation Pattern
    %set(gcf,'PaperPosition',[2 2 20 20]);
    set(gcf,'PaperPosition',[2 2 27 20]);  % 17 Aug 18
end
drawnow
try
    print(NameFig,'-dpng','-r300');
    % 17 Jul 2023
    % print(NameFig,'-deps'); % Win, Octave8.2.0ではフリーズする
    % 21 Jan 2018
    % print(NameFig,'-dpng','-r300');
    % print(NameFig,'-deps','-tiff'); % -tiffがあるとエラーMATLAB2017a
catch
    warning('No print available')
end

    
    %str = ['print -dpng -r300 ' NameFig];
    %eval(str);
    %str = ['print -deps -tiff ' NameFig]; %両方とも出す。
    %eval(str);
    
    %SwEps = 1;
    %SwEps = SwPrint;
    %if SwEps >= 1,
    %end;
    %%%
    %set(hx,'Interpreter','latex');
    %set(hy,'Interpreter','latex');
    
