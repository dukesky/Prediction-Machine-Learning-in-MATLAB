function [label_test,dec_values]=perceptron(feature_train,label_train,feature_test,label_test)

[num_train,num_feature]=size(feature_train);
[num_test,num_feature]=size(feature_test);
p = randperm(num_train);
%train the system
for i=1:1:num_train
    if label_train(p(1,i),1)==1
        z(i,1)=1;
    elseif label_train(p(1,i),1)==0
        z(i,1)=-1;
    end
    for j=1:num_feature
        train(i,j)=feature_train(p(1,i),j)*z(i,1);
    end
    train(i,num_feature+1)=1*z(i,1);
end
w(1,1:(num_feature+1))=0.1;


stop=0;

for e=1:2999 %999 epochs
    for i=1:1:num_train
        temp=0;
        for j=1:1:(num_feature+1)
            temp=temp+train(i,j)*w(1,j);
        end
        if temp<=0
            w=w+train(i,:);
        else 
            stop=stop+1; %usual perceptron halting condition
        end
        if stop==num_train
            break;
        end
    end
    stop=0;
end

J=zeros(num_train,1);
weight=zeros(num_train,num_feature+1);
weight(1,:)=w(1,:);
for i=1:1:num_train %the last epochs
    temp=0;
    for j=1:1:(num_feature+1)
        temp=temp+train(i,j)*w(1,j);
    end
    if i>=2
        if temp<=0
            weight(i,:)=weight(i-1,:)+train(i,:);
        else
            weight(i,:)=weight(i-1,:);
        end
    end
    for i2=1:1:num_train
        temp2=0;
        for j=1:1:num_feature+1
            temp2=temp2+train(i2,j)*weight(i,j);
        end
        if temp2<=0
            J(i,1)=J(i,1)-temp2;
        end
    end
end
 x=min(abs(J));
for i=1:1:num_train
    if abs(J(i,1))==x
        position=i;
    end
end
for i=1:1:num_train
    temp2=0;
    for j=1:1:num_feature
        temp2=temp2+weight(position,j)*feature_train(p(1,i),j);
        store_temp(i,1)=temp2;
    end
    
    store_temp(i,1)=store_temp(i,1)+weight(position,num_feature+1);
    if store_temp(i,1)>0
        label(i,1)=1;
    else 
        label(i,1)=0;
    end
end
error_train=0;
for i=1:1:num_train
    if label(i,1)~=label_train(p(1,i),1)
        error_train=error_train+1;
    end
end

for i=1:1:num_test
    temp3=0;
    for j=1:1:num_feature
        temp3=temp3+weight(position,j)*feature_test(i,j);
        store_temp3(i,1)=temp3;
    end
    
    store_temp3(i,1)=store_temp3(i,1)+weight(position,num_feature+1);
    if store_temp3(i,1)>0
        label_t(i,1)=1;
        label_test(i,2)=1;
    else 
        label_t(i,1)=0;
        label_test(i,2)=0;
    end
end
error_test=0;
for i=1:1:num_test
    if label_t(i,1)~=label_test(i,1)
        error_test=error_test+1;
    end
end
label_test(:,2)=label_t;
dec_values=label_t;