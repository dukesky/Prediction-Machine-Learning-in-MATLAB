function [label_test,dec_values]=ANNRBF(feature_train,label_train,feature_test,label_test)


[num_test,num_feature]=size(feature_test);
spread=5000;
mse=1e-8;
net_rbf=newrb(feature_train',label_train',mse,spread,80);

rbf_train_result=sim(net_rbf,feature_test');

rbf_train_result=rbf_train_result';

label_test(:,2)=rbf_train_result;
dec_values=rbf_train_result;
for i=1:num_test
    if abs(1-rbf_train_result(i,1))>=rbf_train_result(i,1)
        label_test(i,3)=0;
    else
        label_test(i,3)=1;
    end
end