function H=demo_shadedErrorBar
% demo function for shadedErrorBar
%
% function demo_shadedErrorBar
%
% No input or output arguments.
%
%
% 


rows=2;
cols=2;

clf



subplot(rows,cols,1)
%Plot the mean and standard deviation then overlay the raw data
y=randn(30,80)*5;
x=(1:size(y,2))-40;
yP = sin( linspace(-2*pi,2*pi,length(x)) )*20;
y = bsxfun(@plus,y,yP)+60;
shadedErrorBar(x,y,{@mean,@std}); 

hold on
plot(x,y,'.','color',[0.5,0.5,0.95])

hold off

grid on




subplot(rows,cols,2)
%Overlay different lines (transparent) lines and change their properties
hold on

y=ones(30,1)*x; 
y=y+0.06*y.^2+randn(size(y))*10;
shadedErrorBar(x,y,{@mean,@std},'lineprops','-b','patchSaturation',0.33)
shadedErrorBar(x,2*y+20,{@mean,@std},'lineprops',{'-go','MarkerFaceColor','g'});

y=randn(30,80)*5; 
x=(1:size(y,2))-40;
yP = sin( linspace(-2*pi,2*pi,length(x)) )*20;
y = bsxfun(@plus,y,yP)+60;

%Make red line non-transparent
shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)
hold off

grid on




subplot(rows,cols,3)
% Post-hoc modifications of line properties


y=randn(30,80)*5; 
x=(1:size(y,2));
yP = sin( linspace(-2*pi,2*pi,length(x)) )*20;
y = bsxfun(@plus,y,yP);


s = shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r');

%Set face and edge properties
set(s.edge,'LineWidth',2,'LineStyle',':')
s.mainLine.LineWidth = 5;
s.patch.FaceColor = [0.5,0.25,0.25];

hold on
plot(s.mainLine.XData, s.mainLine.YData,'or','MarkerFaceColor','w')

hold off
grid on

set(gca,'XTickLabel',[],'YTickLabel',[])





subplot(rows,cols,4)
% Post-hoc modifications of line properties


y=randn(256,80)*5; 
x=(1:size(y,2));
yP = cos( linspace(-2*pi,2*pi,length(x)) )*10;
y = bsxfun(@plus,y,yP);


shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r')

hold on

y=mean(y)+16;
errbar = [2*ones(1,length(x)) ; 4*ones(1,length(x))];

shadedErrorBar(x, y, errbar, 'lineprops', '-g')

