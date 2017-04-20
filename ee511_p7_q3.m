%%--------------------------------------------------------------------------
%%Project-7:: Question - 3
%%To simulate Expectation Maximization and Gaussian Mixture Models
%%Author                Date               Revision
%%Rajasekar Raja     04/17/17         Initial Revision
%%--------------------------------------------------------------------------
mean = [0 4;4 0];
sigma_matrix = cat(3,[1 0;0 1],[1 0;0 1]);
weights = [0.95,0.05];


sample_obj = gmdistribution(mean,sigma_matrix,weights);
sample_gen_matrix = random(sample_obj,300);
 
subplot(2,2,1);
hold on
opt = statset('Display','final');

%EM approach to calculate the minimum number of iteration it takes to converge to two gaussin distributions
max_expectation = gmdistribution.fit(sample_gen_matrix,2,'Options',opt);

% Plots the contour plot of two cluster data points
ezcontour(@(x,y)pdf(max_expectation,[x y]),[-4 10],[-4 10]);
title('Scatter plot after convergence'); 
xlabel('Range of X'); 
ylabel('Range of Y');
hold off
 
%3D plot of the Gaussian distribution
subplot(2,2,2);
pdf(max_expectation,sample_gen_matrix);
ezsurf(@(x,y)pdf(max_expectation,[x y]),[-5 10],[-5 10])
