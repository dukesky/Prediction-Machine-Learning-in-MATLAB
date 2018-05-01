%% balance positive and negative data
%time is the multipler, if number is 0, new positive data= former*time, if number is not 0, new positive data=number
%rate is the ratio of new positive/negative data.
function [ feature_train_bal,label_train_bal,rate] = balance_data( feature_train,label_train, time, number );
num=size(feature_train,1);
m=0;
n=0;
for i=1:num
    if label_train(i,1)==1
    m=m+1;
    feature_train_positive(m,:)=feature_train(i,:);
    else
    n=n+1;
    feature_train_negtive(n,:)=feature_train(i,:);
    end
end
   if number==0
      feature_train_positive_new= repmat(feature_train_positive,time,1);  
       
   else
       time_new=fix(number/m);
       k=mod(number,m);
       feature_train_positive_new=[repmat(feature_train_positive,time_new,1);feature_train_positive(1:k,:)];
   end
    


feature_train_bal=[feature_train_positive_new;feature_train_negtive];
A=ones(size(feature_train_positive_new,1),1);
B=zeros(size(feature_train_negtive,1),1);
label_train_bal=[A;B];
rate=size(feature_train_positive_new,1)/size(feature_train_negtive,1);
end