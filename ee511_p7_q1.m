%%--------------------------------------------------------------------------
%%Project-7:: Question - 1
%%To simulate Multivariate Gaussian Distribution
%%Author                Date               Revision
%%Rajasekar Raja     04/17/17         Initial Revision
%%--------------------------------------------------------------------------
function [] = ee511_p7_q1(No_of_samples)
%%Initialize
given_mean=[1 2 3];
given_cov_matrix=[ 3 -1  1
                  -1  5  3
                   1  3  4];
matrix_A=chol(given_cov_matrix,'lower');%choleski function
 
for iter=1:No_of_samples
    z1_value=normrnd(0,1);
    z2_value=normrnd(0,1);
    z3_value=normrnd(0,1);
    ind_std_norm_Z=[z1_value z2_value z3_value];
    norm_vec_X=matrix_A*ind_std_norm_Z.'+given_mean.';
    Vector_X(iter,:)=norm_vec_X;
end 
disp(['Statistics of ',num2str(No_of_samples),' samples'])
X1_Mean=mean(Vector_X(:,1));
X2_Mean=mean(Vector_X(:,2));
X3_Mean=mean(Vector_X(:,3));
disp(['The Sample mean of X1 = ',num2str(X1_Mean),' X2 = ',num2str(X2_Mean),' X3 = ',num2str(X3_Mean)]);

cov_X12=cov(Vector_X(:,1),Vector_X(:,2));
cov_X13=cov(Vector_X(:,1),Vector_X(:,3));
cov_X23=cov(Vector_X(:,2),Vector_X(:,3));
disp(['The Covariance of X1 = ',num2str(cov_X12(1,2)),' X2 = ',num2str(cov_X13(1,2)),' X3 = ',num2str(cov_X23(1,2))]);
end
