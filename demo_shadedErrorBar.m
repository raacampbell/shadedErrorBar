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
%Basic usage
y=randn(30,80); 
x=1:size(y,2);
shadedErrorBar(x,mean(y,1),std(y))
hold on
y=randn(30,80)+3; 
%Define a color
shadedErrorBar(x,mean(y,1),std(y),'lineprops','g');
xlim([0,81])



subplot(rows,cols,2)
%Overlay two transparent lines
y=randn(30,80)*5; 
x=(1:size(y,2))-40;
yP = sin( linspace(-2*pi,2*pi,length(x)) )*20;
y = bsxfun(@plus,y,yP);
shadedErrorBar(x,y+60,{@mean,@std},'lineprops','-r','transparent',1); 

hold on
shadedErrorBar(x,2*y+20,{@mean,@std},'lineprops','-g','transparent',1); 

y=ones(30,1)*x; 
y=y+0.06*y.^2+randn(size(y))*10;
shadedErrorBar(x,y,{@mean,@std},'lineprops','-b','transparent',true); 
hold off

grid on



subplot(rows,cols,3)
x=1:10:300;
y=randn(30,length(x));
y = bsxfun(@times,y,x.^2);
y = bsxfun(@plus,y,x.^2);

H=shadedErrorBar(x,y,{@mean,@std},'logY',true); 


