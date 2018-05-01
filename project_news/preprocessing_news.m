%% Prepocessing of the data

function [feature_train,feature_test,label_train,label_test]=preprocessing_news(m,n);
% m,n are random selected number of training and test data, m+n<4954

%read data from csv file
% change the string into value and standardlize data
fid = fopen('OnlineNewsPopularityReduced.csv');
data = textscan(fid, '%s %d %d %d %f %d %f %d %d %d %d %f %d %d %d %d %d %d %d %d %d %f %d %d %f %f %f %f %d %d %d %d %d %d %d %d %d %d %d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %d %d %d','HeaderLines',1,'Delimiter',',');
fclose(fid);
timedelta(:,1)=double([data{2}]);
timedelta=(timedelta-min(timedelta))/(max(timedelta)-min(timedelta));
n_tokens_title(:,1)=double([data{3}]);
n_tokens_title=(n_tokens_title-min(n_tokens_title))/(max(n_tokens_title)-min(n_tokens_title));
n_tokens_content(:,1)=double([data{4}]);
n_tokens_content=(n_tokens_content-min(n_tokens_content))/(max(n_tokens_content)-min(n_tokens_content));
n_unique_tokens(:,1)=double([data{5}]);
n_non_stop_words(:,1)=double([data{6}]);
n_non_stop_tokens(:,1)=double([data{7}]);
num_hrefs(:,1)=double([data{8}]);
num_hrefs=(num_hrefs-min(num_hrefs))/(max(num_hrefs)-min(num_hrefs));
num_self_hrefs(:,1)=double([data{9}]);
num_self_hrefs=(num_self_hrefs-min(num_self_hrefs))/(max(num_self_hrefs)-min(num_self_hrefs));
num_imgs(:,1)=double([data{10}]);
num_imgs=(num_imgs-min(num_imgs))/(max(num_imgs)-min(num_imgs));
num_videos(:,1)=double([data{11}]);
average_token_length(:,1)=double([data{12}]);
average_token_length=(average_token_length-min(average_token_length))/(max(average_token_length)-min(average_token_length));
num_keyword(:,1)=double([data{13}]);
num_keyword=(num_keyword-min(num_keyword))/(max(num_keyword)-min(num_keyword));
datachanel_lifestyle(:,1)=double([data{14}]);
datachanel_entertainment(:,1)=double([data{15}]);
datachanel_bus(:,1)=double([data{16}]);
datachanel_socmed(:,1)=double([data{17}]);
datachanel_teach(:,1)=double([data{18}]);
datachanel_world(:,1)=double([data{19}]);
kw_min_min(:,1)=double([data{20}]);
kw_max_min(:,1)=double([data{21}]);
kw_max_min=(kw_max_min-min(kw_max_min))/(max(kw_max_min)-min(kw_max_min));
kw_avg_min(:,1)=double([data{22}]);
kw_avg_min=(kw_avg_min-min(kw_avg_min))/(max(kw_avg_min)-min(kw_avg_min));
kw_min_max(:,1)=double([data{23}]);
kw_min_max=(kw_min_max-min(kw_min_max))/(max(kw_min_max)-min(kw_min_max));
kw_max_max(:,1)=double([data{24}]);
kw_max_max=(kw_max_max-min(kw_max_max))/(max(kw_max_max)-min(kw_max_max));
kw_avg_max(:,1)=double([data{25}]);
kw_avg_max=(kw_avg_max-min(kw_avg_max))/(max(kw_avg_max)-min(kw_avg_max));
kw_min_avg(:,1)=double([data{26}]);
kw_min_avg=(kw_min_avg-min(kw_min_avg))/(max(kw_min_avg)-min(kw_min_avg));
kw_max_avg(:,1)=double([data{27}]);
kw_max_avg=(kw_max_avg-min(kw_max_avg))/(max(kw_max_avg)-min(kw_max_avg));
kw_avg_avg(:,1)=double([data{28}]);
kw_avg_avg=(kw_avg_avg-min(kw_avg_avg))/(max(kw_avg_avg)-min(kw_avg_avg));
self_ref_min(:,1)=double([data{29}]);
self_ref_min=(self_ref_min-min(self_ref_min))/(max(self_ref_min)-min(self_ref_min));
self_ref_max(:,1)=double([data{30}]);
self_ref_max=(self_ref_max-min(self_ref_max))/(max(self_ref_max)-min(self_ref_max));
self_ref_avg(:,1)=double([data{31}]);
self_ref_avg=(self_ref_avg-min(self_ref_avg))/(max(self_ref_avg)-min(self_ref_avg));
mon(:,1)=double([data{32}]);
tues(:,1)=double([data{33}]);
wed(:,1)=double([data{34}]);
thur(:,1)=double([data{35}]);
fri(:,1)=double([data{36}]);
sat(:,1)=double([data{37}]);
sun(:,1)=double([data{38}]);
weekend(:,1)=double([data{39}]);
LDA0(:,1)=double([data{40}]);
LDA1(:,1)=double([data{41}]);
LDA2(:,1)=double([data{42}]);
LDA3(:,1)=double([data{43}]);
LDA4(:,1)=double([data{44}]);
global_sub(:,1)=double([data{45}]);
global_senti(:,1)=double([data{46}]);
global_rate_positive(:,1)=double([data{47}]);
global_rate_negative(:,1)=double([data{48}]);
rate_positive(:,1)=double([data{49}]);
rate_negative(:,1)=double([data{50}]);
avg_positive_popu(:,1)=double([data{51}]);
min_positive_popu(:,1)=double([data{52}]);
max_positive_popu(:,1)=double([data{53}]);
avg_negative_popu(:,1)=double([data{54}]);
min_negative_popu(:,1)=double([data{55}]);
max_negative_popu(:,1)=double([data{56}]);
title_sub(:,1)=double([data{57}]);
title_senti(:,1)=double([data{58}]);
abs_title_sub(:,1)=double([data{59}]);
abs_title_senti(:,1)=double([data{60}]);


data_all(:,1)=timedelta(:,1);
data_all(:,2)=n_tokens_title(:,1);
data_all(:,3)=n_tokens_content(:,1);
data_all(:,4)=n_unique_tokens(:,1);
data_all(:,5)=n_non_stop_words(:,1);
data_all(:,6)=n_non_stop_tokens(:,1);
data_all(:,7)=num_hrefs(:,1);
data_all(:,8)=num_self_hrefs(:,1);
data_all(:,9)=num_imgs(:,1);
data_all(:,10)=num_videos(:,1);
data_all(:,11)=average_token_length(:,1);
data_all(:,12)=num_keyword(:,1);
data_all(:,13)=datachanel_lifestyle(:,1);
data_all(:,14)=datachanel_entertainment(:,1);
data_all(:,15)=datachanel_bus(:,1);
data_all(:,16)=datachanel_socmed(:,1);
data_all(:,17)=datachanel_teach(:,1);
data_all(:,18)=datachanel_world(:,1);
data_all(:,19)=kw_min_min(:,1);
data_all(:,20)=kw_max_min(:,1);
data_all(:,21)=kw_avg_min(:,1);
data_all(:,22)=kw_min_max(:,1);
data_all(:,23)=kw_max_max(:,1);
data_all(:,24)=kw_avg_max(:,1);
data_all(:,25)=kw_min_avg(:,1);
data_all(:,26)=kw_max_avg(:,1);
data_all(:,27)=kw_avg_avg(:,1);
data_all(:,28)=self_ref_min(:,1);
data_all(:,29)=self_ref_max(:,1);
data_all(:,30)=self_ref_avg(:,1);
data_all(:,31)=mon(:,1);
data_all(:,32)=tues(:,1);
data_all(:,33)=wed(:,1);
data_all(:,34)=thur(:,1);
data_all(:,35)=fri(:,1);
data_all(:,36)=sat(:,1);
data_all(:,37)=sun(:,1);
data_all(:,38)=weekend(:,1);
data_all(:,39)=LDA0(:,1);
data_all(:,40)=LDA1(:,1);
data_all(:,41)=LDA2(:,1);
data_all(:,42)=LDA3(:,1);
data_all(:,43)=LDA4(:,1);
data_all(:,44)=global_sub(:,1);
data_all(:,45)=global_senti(:,1);
data_all(:,46)=global_rate_positive(:,1);
data_all(:,47)=global_rate_negative(:,1);
data_all(:,48)=rate_positive(:,1);
data_all(:,49)=rate_negative(:,1);
data_all(:,50)=avg_positive_popu(:,1);
data_all(:,51)=min_positive_popu(:,1);
data_all(:,52)=max_positive_popu(:,1);
data_all(:,53)=avg_negative_popu(:,1);
data_all(:,54)=min_negative_popu(:,1);
data_all(:,55)=max_negative_popu(:,1);
data_all(:,56)=title_sub(:,1);
data_all(:,57)=title_senti(:,1);
data_all(:,58)=abs_title_sub(:,1);
data_all(:,59)=abs_title_senti(:,1);

share(:,1)=double([data{61}]);

num_data=size(share,1);
for i=1:num_data
    if share(i,1)<=900
        label(i,1)=1;
        label(i,2)=0;
    elseif share(i,1)>900 && share(i,1)<=1200
        label(i,1)=2;
        label(i,2)=0;
    elseif share(i,1)>1200 && share(i,1)<=1600
        label(i,1)=3;
        label(i,2)=0;
    elseif share(i,1)>1600 && share(i,1)<=3400
        label(i,1)=4;
        label(i,2)=1;
    elseif share(i,1)>3400
        label(i,1)=5;
        label(i,2)=1;
    else
        label(i,1)=0; 
        label(i,2)=0;
    end
end

num=randperm(num_data);
 for i=1:num_data
     if i<=m
     feature_train(i,:)=data_all(num(i),:);
     label_train(i,:)=label(num(i),:);
     elseif (i>m) && (i<=m+n)
     feature_test(i-m,:)=data_all(num(i),:);
     label_test(i-m,:)=label(num(i),:);
     end
 end

end

