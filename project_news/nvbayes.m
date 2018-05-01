%% Naive Bayes Method 

function [label_test,dec_values ] = nvbayes( feature_train,label_train,feature_test,label_test )
Mdl = fitcnb(feature_train,label_train);
[label_test(:,2),score,Cost]=predict(Mdl,feature_test);
%[~,score_nb] = resubPredict(Mdl);
dec_values=score(:,2);



end

