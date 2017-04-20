%%--------------------------------------------------------------------------
%%Project-7:: Question - 4
%%To simulate k-means clustering
%%Author                Date               Revision
%%Rajasekar Raja     04/17/17         Initial Revision
%%--------------------------------------------------------------------------
max_data = 272;
%Loading faithful.txt file into the matlab
fullname = fullfile('D:\Usc\Sem1\511\Project7','faithful.txt');
%Initialize
loaded_data= load(fullname);
eruption_time_272 = loaded_data(:,2);
eruption_waiting_time_272(1,:) = loaded_data(:,3);
eruption_time_272= eruption_time_272.';
 
for iter = 1:max_data
    merged_eruption_waiting_time(iter,1)= eruption_time_272(iter);
    merged_eruption_waiting_time(iter,2)= eruption_waiting_time_272(iter);
end   
 
figure(1);
plot(merged_eruption_waiting_time(:,1), merged_eruption_waiting_time(:,2), 'o');
[y,C]= kmeans(merged_eruption_waiting_time,2);
title('Data Point without labels');
xlabel('waiting time since last eruption(min)');
ylabel('Duration of eruption(min)');
 
%---- The scattered plot of the two clusters specifying the centroids---%
figure(2)
plot(merged_eruption_waiting_time(y==1,1),merged_eruption_waiting_time(y==1,2), 'x');
hold on
plot(merged_eruption_waiting_time(y==2,1),merged_eruption_waiting_time(y==2,2), 'o');
plot(C(1,1),C(1,2), 'rx','LineWidth',2);
plot(C(2,1),C(2,2), 'rx','LineWidth',2);
legend('Points of cluster 1','Points of cluster 2');
title('Data Points with Labels by K-means Clustering');
hold off
 
X1_count= 1;
X2_count= 1;
for iter = 1:max_data
    if(y(iter,1)==1)
        X1(X1_count,1)= merged_eruption_waiting_time(iter,1);
        X1(X1_count,2)= merged_eruption_waiting_time(iter,2);
        X1_count= X1_count+1;
    elseif(y(iter,1)==2)
        X2(X2_count,1)= merged_eruption_waiting_time(iter,1);
        X2(X2_count,2)= merged_eruption_waiting_time(iter,2);
        X2_count= X2_count+1;
    end
end
 
GMM_of_X= [X1;X2];
 
%---Overlaying the scatter plot on the contour plot generated by EM Approach---%
figure(3);
%subplot(2,2,1);
hold on
scatter(X1(:,1),X1(:,2),10,'b.');
hold on 
scatter(X2(:,1),X2(:,2),10,'r.');
hold on
opt = statset('Display','final');
%---This is to calculate the PDF parameters using EM approach---%
max_expectation = gmdistribution.fit(GMM_of_X,2,'Options',opt);
ezcontour(@(x,y)pdf(max_expectation,[x y]),[0,7],[40,100]);
title('Scatter plot after convergence'); xlabel('Range of X');
ylabel('Range of Y');
hold off
 
%---Calculating the 3D plot of the the GMM----% 
figure(4);
pdf(max_expectation,GMM_of_X);
ezsurf(@(x,y)pdf(max_expectation,[x y]),[0,7],[40 100]);