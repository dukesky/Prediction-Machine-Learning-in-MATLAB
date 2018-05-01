%% find F1 score and TFPN for a single threshold
% threshold compared dec_value, if dec_value> hereshold, seen as positive
% data, get label,TP,TN,FP,FN and F1 score from a threshold
function [label_test, TP,TN,FN,FP,F1 ] = F1score(dec_values,label_test,threshold )
    TP=0;
    TN=0;
    FP=0;
    FN=0; 
 for i=1:size(label_test,1)
     if dec_values(i)>threshold
         label_test(i,3)=1;
     else 
         label_test(i,3)=0;
     end
    if label_test(i,1)==1 && label_test(i,3)==1
        TP=TP+1;
    elseif label_test(i,1)==1 && label_test(i,3)==0
        FN=FN+1;
    elseif label_test(i,1)==0 && label_test(i,3)==1
       FP=FP+1;
    elseif label_test(i,1)==0&& label_test(i,3)==0
       TN=TN+1;
    end
 end
precision=TP/(TP+FP);
recall=TP/(TP+FN);
F1=2*(precision*recall)/(precision+recall);


end

