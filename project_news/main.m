%% STRUCTURE OF CLASSIFACATION
% this is the stucture, choose the method we used.
clc;
clear all;
close all;
%% prepocessing 
[feature_train,feature_test,label_train,label_test]=preprocessing_news(2800,2000);
label_train=label_train(:,2);
label_test=label_test(:,2);

%% randomlization

[feature_train_rd,label_train_rd,feature_test_rd,label_test_rd] = random(feature_train,label_train,feature_test,label_test,2500,1900);

%% balance data [2 method: SMOTE / multiply positive site]
 % ***********************  method1  SMOTE  ******************************
%
% counter=1;
% feature_train_rd=[feature_train_rd label_train_rd];
% for i=1:size(feature_train_rd,1)
%     if label_train_rd(i,1)==1
%          feature_train_minority(counter,:)=feature_train_rd(i,:);
%          counter=counter+1;
%      end
% end
% for j=1:8
%     feature_train_bal=cat(1,feature_train_rd, mySMOTE( feature_train_minority,1 ));
% end
% 
% label_train=feature_train_bal(:,42);
% feature_train=feature_train_bal(:,1:41);

% ****************************************************************8**********

%  ***********  method 2 multiple positive data ********************************
 
[feature_train,label_train,rate]  = balance_data( feature_train_rd,label_train_rd,1, 0 );

%************************************************************************ 
%% choose features  [two method: KNN Sequencial Forward selection / experiencial choose]

% **********  sequential forward selection  ****************
%original sequential forward selection is in SFS_featureselection.m
% in order to save time, record first 18 feature selected by previous code
% feature_train=feature_train(:,[26 12 37 17 1 27 33 36 31 22 28 46 19]);  
% feature_test=feature_test(:,[26 12 37 17 1 27 33 36 31 22 28 46 19]);

%  ********* experiencial choose **************
%  use in bayes method because some feature has 0 variance
 feature_train=feature_train(:,[1:16 20 24:59]);
 feature_test=feature_test(:,[1:16  20 24:59]);


%% choose the final training and test data.
  feature_test_use=feature_test;
  feature_train_use=feature_train;
  label_test_use=label_test;
  label_train_use=label_train;

%% calssification function
% choose method to classificate the data.

%  ********** sigmoid SVM method with kernel function *********
%gamma=0.5, C=-0.5 
%[ label_test_use,dec_values] = kernelSVM( feature_train_use,label_train_use,feature_test_use,label_test_use);

% *************        naive bayes method        ***************
[label_test_use,dec_values ] = nvbayes( feature_train_use,label_train_use,feature_test_use,label_test_use );

% *************       logistic regression     ******************
%[label_test_use,dec_values ] = logisticR( feature_train_use,label_train_use,feature_test_use,label_test_use );

% *************               KNN         **********************
%label_test_use  = fKNN( feature_train_use,label_train_use,feature_test_use,label_test_use,5 );
 
% *************            perceptron       ********************
%[label_test_use,dec_values]=perceptron(feature_train_use,label_train_use,feature_test_use,label_test_use);

% ***************              SVM        **********************
%[label_test_use,dec_values]=SVM(feature_train_use,label_train_use,feature_test_use,label_test_use);

% ****************             ANN        **********************
%[label_test_use,dec_values]=ANNRBF(feature_train_use,label_train_use,feature_test_use,label_test_use);
%[label_test_use,dec_values]=ANNFWBP(feature_train_use,label_train_use,feature_test_use,label_test_use);

%% ROC
[x,y,~,auc] = perfcurve(label_test_use(:,1),dec_values,1);
plot(x,y);
%legend('sigmoid SVM curve','Location','SE');
xlabel('False positive rate'); ylabel('True positive rate');
title('ROC for classification');
% 
%% get maximum F1 score and optimal result

% ************** get TFPN & F1 socre from method has dec_value ************
%
threshold=[0:0.001:1];
 for j=1:1000
 [~,TP,TN,FN,FP,F1(j) ] = F1score(dec_values,label_test_use,threshold(j) );
 end
 [F1_max n]=max(F1)
 
 [label_test_use,TP,TN,FN,FP,F1_final ] = F1score(dec_values,label_test_use,n/1000 );

ACC= (TP+TN)/(TP+TN+FP+FN)
precision=TP/(TP+FP);
 recall=TP/(TP+FN);
% ************** get TFPN & F1 socre from  KNN ************
%
%     TP=0;
%     TN=0;
%     FP=0;
%     FN=0; 
%  for i=1:size(label_test_use,1)
%     
%     if label_test_use(i,1)==1 && label_test_use(i,2)==1
%         TP=TP+1;
%     elseif label_test_use(i,1)==1 && label_test_use(i,2)==0
%         FN=FN+1;
%     elseif label_test_use(i,1)==0 && label_test_use(i,2)==1
%        FP=FP+1;
%     elseif label_test_use(i,1)==0&& label_test_use(i,2)==0
%        TN=TN+1;
%     end
%  end
% precision=TP/(TP+FP);
% recall=TP/(TP+FN);
% F1=2*(precision*recall)/(precision+recall);
% 



