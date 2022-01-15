% 1/12/2021
% Convert histogram from counts into proportions 

% a clear MATLAB workspace 
close all; clear
%% create data for the plot

% number of data points
n = 500;

% generate log-normal distribution
data = exp( randn(n,1)/2 );

%% show a histogram

% number of histogram bins
k = 20;

figure(1), clf

% one way to show a histogram


%% movie showing histograms with increasing bins

bins2try = round( linspace(5,n/2,30) );
[y,x] = hist(data,k);
plot(x,y,'s-','linew',2,'markersize',12,'markerfacecolor','k')
xlabel('Value')
ylabel('Count')
h = plot(x,y,'s-','linew',2,'markersize',12,'markerfacecolor','k');
xlabel('Value'), ylabel('Count')

for bini=1:length(bins2try)
    % use hist to get histogram graph data for this bin count
   
    [y,x] = histcounts(data,bins2try(bini));
    x = (x(1:end-1) + x(2:end))/2; 
    y =  y/sum(y) 
    %bc the x and y vector aren't the same length
    % (x represents the boundaries and y the heights therefore x would be
    % longer). To fix that we average out the x values together to get the
    % center of each bin. 
    % update xdata and ydata
    set(h,'XData',x,'ydata',y);
    
    
    
    % update title
    title([ 'Histogram with ' num2str(bins2try(bini)) ' bins.' ])
    pause(.1)
    
  
end
 figure(2),clf 
 histogram(data,k,'Normalization','probability')
