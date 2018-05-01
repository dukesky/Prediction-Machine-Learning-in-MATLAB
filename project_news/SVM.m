function [label_test,dec_values]=SVM(feature_train,label_train,feature_test,label_test)

[num_train,num_feature]=size(feature_train);
[num_test,num_feature]=size(feature_test);


double_label_train=double(label_train);
cv = cvpartition(double_label_train,'KFold',5);
for i=1:5
    train_index=training(cv,i);
    valid_index=test(cv,i);
    X_train= feature_train(train_index,1:num_feature);
    X_valid=feature_train(valid_index,1:num_feature);
    Label_train=label_train(train_index);
    Label_valid=label_train(valid_index);
    model=svmtrain(double(Label_train), X_train,'-t 2 -c 7 -g 1');
    [predict_label, accuracy, dec_values]=svmpredict(double(Label_valid),X_valid,model);
    Accuracy(i)=accuracy(1);
 end
accurancy_validation=mean(Accuracy);


X_test=feature_test(:,1:num_feature);
[predict_label, accuracy, dec_values]=svmpredict(double(label_test),X_test,model);
accuracy_test=accuracy(1,1);

label_test(:,2)=predict_label;
label_test(:,3)=predict_label;