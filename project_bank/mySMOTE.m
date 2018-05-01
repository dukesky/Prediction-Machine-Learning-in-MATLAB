function [ sample ] = mySMOTE( minority,radio,k,attr_type )

if(nargin<2)%nargin ????????
    help mySOMTE
elseif(nargin<3)
    radio=1;
    k=1;
    attr_type=zeros(1,size(minority,2));
end

[minority_num,attr_num]=size(minority);%??????
if radio<=0
%warning('radio=%d',radio,'is less than 0');
%return
 error('radio is less than 0');
elseif radio<1
    new_num=floor(radio*minority_num);
    sample_index=randperm(minority_num,new_num);%????
    radio=1;
else
    radio=round(radio);
    sample_index=1:minority_num;    
end
%????
distance_matrix=dist(minority');%????
sample_num= size(sample_index,2)*radio;
sample=zeros(sample_num,attr_num);
 for i=1: size(sample_index,2)
    k_nearest_index= find_k_nearest(sample_index(i),k,distance_matrix);
    nn=randperm(k,1) ;%????????
    n_index=k_nearest_index(nn);%???????
    for r=1:radio
     for j=1:attr_num
         if attr_type(j)==0%numeric
           dif=minority(n_index,j)-minority(i,j);
           gap=rand(1,1);
           sample(radio*(i-1)+r,j)=minority(i,j)+dif*gap;
         else
             for kk=1:k
                 attribute(kk)=minority(k_nearest_index(kk),j);             
             end
             table = tabulate(attribute);%???k???????????
             [attr_j_num,index]=max(table(:,2));%?????????????
             attr_j=table(index,1);%??
            sample(radio*(i-1)+r,j)= minority(i,j);%??k???????????
         end
             
      end
   end
 end
end

function [k_nearest_index]=find_k_nearest(sample_index,k,distance_matrix)
[distance,index]=sort(distance_matrix(:,sample_index));%??
k_nearest_index=index(2:k+1,1);%???k?
end
