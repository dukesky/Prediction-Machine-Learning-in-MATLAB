%% Logistic Regression Method
function [label_test,dec_values ] = logisticR( feature_train,label_train,feature_test,label_test )
mdl = fitglm(feature_train,label_train,'Distribution','binomial','Link','logit')   %if add 'interactions' change largely
dec_values=predict(mdl,feature_test);


end

