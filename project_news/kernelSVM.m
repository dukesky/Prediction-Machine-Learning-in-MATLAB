function [ label_test,dec_values] = kernelSVM( feature_train,label_train,feature_test,label_test)
%kernelSVM method, kernel function is in 'mysigmoid',change gamma and C to
%find the best performance.

for i=1:size(label_train,1)
    if label_train(i,1)==0
        label_train(i,1)=-1;
    end
end


SVMModel1 = fitcsvm(feature_train,label_train,'KernelFunction','mysigmoid',...
				'Standardize',true);
SVMModel1 = fitPosterior(SVMModel1);
%[~,scores1] = resubPredict(SVMModel1);
[label_test(:,2),test_score(:,1:2)]=predict(SVMModel1,feature_test);
dec_values=test_score(:,2);
for i=1:size(label_test,1)
    if label_test(i,2)==-1
        label_train(i,2)=0;
    end
end

end

