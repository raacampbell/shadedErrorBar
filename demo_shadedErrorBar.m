function demo_shadedErrorBar
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
y=randn(30,80); x=1:size(y,2);
shadedErrorBar(x,mean(y,1),std(y),'g');
shadedErrorBar(x,y,{@median,@std},{'r-o','markerfacecolor','r'});    
shadedErrorBar([],y,{@median,@std},{'r-o','markerfacecolor','r'});    
xlim([0,81])



subplot(rows,cols,2)
%Overlay two transparent lines
y=randn(30,80)*5; 
x=(1:size(y,2))-40;
yP = sin( linspace(-2*pi,2*pi,length(x)) )*20;
y = bsxfun(@plus,y,yP)+60;

shadedErrorBar(x,y,{@mean,@std},'-r',1); 

hold on
y=ones(30,1)*x; 
y=y+0.06*y.^2+randn(size(y))*10;
shadedErrorBar(x,y,{@mean,@std},'-b',1); 
hold off

grid on



subplot(rows,cols,3)
x=1:10:300;
y=randn(30,length(x));
y = bsxfun(@times,y,x.^2);
y = bsxfun(@plus,y,x.^2);

shadedErrorBar(x,y,{@mean,@std},'-r',1); 
set(gca,'YScale','log')

subplot(rows,cols,4)
%log space
x=1:10:300;
y=randn(30,length(x));
y = bsxfun(@times,y,x.^2);
y = bsxfun(@plus,y,x.^2);

semilogy(x,mean(y),'-r')
