function [ label_test ] = fKNN( feature_train,label_train,feature_test,label_test,k )
for i=1:size(feature_train,1)
    if label_train(i,1)==0
        label_train(i,1)=2;
    end
 end
 
 [classhypo,D] = KNNI(feature_train,feature_test,label_train,k,1 ,0 );
 for i=1:size(classhypo,1)
     if classhypo(i,1)==2
         classhypo(i,1)=0;
     end
 end
 label_test(:,2)=classhypo(:,1);


end

