function [label_test,dec_values]=ANNFWBP(feature_train,label_train,feature_test,label_test)

[num_test,num_feature]=size(feature_test);
net_bp=newff(minmax(feature_train'),[20,1],{'logsig','tansig'},'trainrp'); 

net_bp.trainParam.show=50;
net_bp.trainParam.epochs=1000;
net_bp.trainParam.goal=0;
net_bp=train(net_bp,feature_train',label_train');

bp_train_result=sim(net_bp,feature_test');
bp_train_result=bp_train_result';
label_test(:,2)=bp_train_result;
dec_values=bp_train_result;

[num_test,num_feature]=size(feature_test);
for i=1:num_test
    if abs(1-bp_train_result(i,1))>=bp_train_result(i,1)
        label_test(i,3)=0;
    else
        label_test(i,3)=1;
    end
end