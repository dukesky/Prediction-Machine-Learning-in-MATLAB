%% randonlize the data
function [feature_train_rnd,label_train_rnd,feature_test_rnd,label_test_rnd] = random( feature_train,label_train,feature_test,label_test,a,b )
% a,b are the new number of training set and test set, they are all
% randomlized
feature=[feature_train;feature_test];
label=[label_train;label_test];
[n,~]=size(feature);
num=randperm(n);
 for i=1:n
     if i<=a
     feature_train_rnd(i,:)=feature(num(i),:);
     label_train_rnd(i,:)=label(num(i),:);
     elseif (i>a) && (i<=a+b)
     feature_test_rnd(i-a,:)=feature(num(i),:);
     label_test_rnd(i-a,:)=label(num(i),:);
     end
 end

end

