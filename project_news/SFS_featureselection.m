clc;
clear all;
close all;
%% prepocessing 
% change the string into value and standardlize data

[feature_train,feature_test,label_train,label_test]=preprocessing_news(3000,1000);
feature_all=[feature_train;feature_test];
label_all=[label_train;label_test];
label_train=label_train(:,2);
label_test=label_test(:,2);

%% choose features

% **********  use knn method to choose feature  *****************

[num_train,num_feature]=size(feature_train);
% change label 0 to label 2 for KNN feature selection
for i=1:size(feature_train,1)
    if label_train(i,1)==0
        label_train(i,1)=2;
    end
end

[S,W] = SFS(feature_train(1:1500,:),feature_train(1501:num_train-1,:),label_train(1:1500,:),label_train(1501:num_train-1,:),5,20,20);
[rS,cS]=size(S);
for i=1:size(feature_all,2)
    flag=0;
    for j=1:cS
        if i==S(1,j)
            flag=1;
        end
    end
    if flag==0
        feature_train(:,i)=1;
        feature_test(:,i)=1;
    end
end

% change the label back
for i=1:size(feature_train,1)
    if label_train(i,1)==2
        label_train(i,1)=0;
    end
end