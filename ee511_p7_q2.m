%%--------------------------------------------------------------------------
%%Project-7:: Question - 2
%%To simulate Mixture Distribution
%%Author                Date               Revision
%%Rajasekar Raja     04/17/17         Initial Revision
%%--------------------------------------------------------------------------
function [] = ee511_p7_q2(no_of_samples)
%Based on the equation f(x)=0.4*N(-1,1)+0.6*N(1,1)
for iter=1:no_of_samples
    r_number = rand <= 0.4;
    mix_pdf(:,iter)=r_number.*normrnd(-1,1)+(1-r_number).*normrnd(1,1);
end

%--Histogram of the generated samples--------%
yyaxis left
hist(mix_pdf,25);
title('Theoretical pdf generated over the histogram for the mixture distribution f(x)');  
xlabel('Range of X');
ylabel('Frequency');
 
%--Calculating and overlaying the Theoretical PDF of the mixture distribution---%
yyaxis right
xaxis=-3:0.1:3;
theo_norm_pdf=0.4*normpdf(xaxis,-1,1)+0.6*normpdf(xaxis,1,1);
plot(xaxis,theo_norm_pdf);
ylabel('Theoretical Normal PDF of the mixture distribution');
end