%% Prepocessing of the data
%change string into value, make a 41 column feature and 1 column label
function [feature_train,feature_test,label_train,label_test]=preprocessing_bank(data);
clc
clear all
close all
%read data from csv file
fid = fopen('bank-additional.csv');
data = textscan(fid, '%d %s %s %s %s %s %s %s %s %s %d %d %d %s %f %f %f %f %f %s','HeaderLines',1,'Delimiter',',');
fclose(fid);
%convert string to cell, number to matrix
age(:,1)=double([data{1}]);
age=(age-min(age))/(max(age)-min(age));
job_pre(:,1)=[data{2}];
marital_pre(:,1)=[data{3}];
education_pre(:,1)=[data{4}];
housing_pre(:,1)=[data{6}];
loan_pre(:,1)=[data{7}];
contact_pre(:,1)=[data{8}];
month_pre(:,1)=[data{9}];
dayofweek_pre(:,1)=[data{10}];
campaign(:,1)=double([data{11}]);
campaign=(campaign-min(campaign))/(max(campaign)-min(campaign));
pdays(:,1)=double([data{12}]);
pdays=(pdays-min(pdays))/(max(pdays)-min(pdays));
previous(:,1)=double([data{13}]);
previous=(previous-min(previous))/(max(previous)-min(previous));
poutcome_pre(:,1)=[data{14}];
empvarrate(:,1)=[data{15}];
empvarrate=(empvarrate-min(empvarrate))/(max(empvarrate)-min(empvarrate));
conspriceidx(:,1)=[data{16}];
conspriceidx=(conspriceidx-min(conspriceidx))/(max(conspriceidx)-min(conspriceidx));
consconfidx(:,1)=[data{17}];
consconfidx=(consconfidx-min(consconfidx))/(max(consconfidx)-min(consconfidx));
euribor3m(:,1)=[data{18}];
euribor3m=(euribor3m-min(euribor3m))/(max(euribor3m)-min(euribor3m));
nremployed(:,1)=[data{19}];
nremployed=(nremployed-min(nremployed))/(max(nremployed)-min(nremployed));
y_pre(:,1)=[data{20}];
%data labelling
s2='blue-collar';
s3='services';
s4='admin.';
s5='entrepreneur';
s6='self-employed';
s7='technician';
s8='management';
s9='student';
s10='retired';
s11='housemaid';
s12='unknown';

s13='divorced';
s14='married';
s15='single';

s16='basic.4y';
s17='basic.6y';
s18='basic.9y';
s19='high.school';
s20='illiterate';
s21='professional.course';
s22='university.degree';

s23='no';
s24='yes';

s25='cellular';
s26='telephone';

s27='jan';
s28='feb';
s29='mar';
s30='apr';
s31='may';
s32='jun';
s33='jul';
s34='aug';
s35='sep';
s36='oct';
s37='nov';
s38='dec';

s39='mon';
s40='tue';
s41='wed';
s42='thu';
s43='fri';

s44='failure';
s45='nonexistent';
s46='success';

for i=1:4119
    s1=job_pre(i,1);
    job(i,1)=strcmp(s1,s2);
    job(i,2)=strcmp(s1,s3);
    job(i,3)=strcmp(s1,s4);
    job(i,4)=strcmp(s1,s5);
    job(i,5)=strcmp(s1,s6);
    job(i,6)=strcmp(s1,s7);
    job(i,7)=strcmp(s1,s8);
    job(i,8)=strcmp(s1,s9);
    job(i,9)=strcmp(s1,s10);
    job(i,10)=strcmp(s1,s11);
    job(i,11)=strcmp(s1,s12);
    s1=marital_pre(i,1);
    if strcmp(s1,s13)
        marital(i,1)=2;
    elseif strcmp(s1,s14)
        marital(i,1)=1;
    elseif strcmp(s1,s15)
        marital(i,1)=3;
    end
    s1=education_pre(i,1);
    if strcmp(s1,s16)
        education(i,1)=1;
    elseif strcmp(s1,s17)
        education(i,1)=2;
    elseif strcmp(s1,s18)
        education(i,1)=3;
    elseif strcmp(s1,s19)
        education(i,1)=4;
    elseif strcmp(s1,s20)
        education(i,1)=5;
    elseif strcmp(s1,s21)
        education(i,1)=6;
    elseif strcmp(s1,s22)
        education(i,1)=7;
    elseif strcmp(s1,s12)
        education(i,1)=8;
    end

    s1=housing_pre(i,1);
    if strcmp(s1,s23)
        housing(i,1)=1;
    elseif strcmp(s1,s24)
        housing(i,1)=3;
    elseif strcmp(s1,s12)
        housing(i,1)=2;
    end
    s1=loan_pre(i,1);
    if strcmp(s1,s23)
        loan(i,1)=1;
    elseif strcmp(s1,s24)
        loan(i,1)=3;
    elseif strcmp(s1,s12)
        loan(i,1)=2;
    end
    s1=contact_pre(i,1);
    if strcmp(s1,s25)
        contact(i,1)=1;
    elseif strcmp(s1,s26)
        contact(i,2)=1;
    end
    s1=month_pre(i,1);
    month(i,1)=strcmp(s1,s27);
    month(i,2)=strcmp(s1,s28);
    month(i,3)=strcmp(s1,s29);
    month(i,4)=strcmp(s1,s30);
    month(i,5)=strcmp(s1,s31);
    month(i,6)=strcmp(s1,s32);
    month(i,7)=strcmp(s1,s33);
    month(i,8)=strcmp(s1,s34);
    month(i,9)=strcmp(s1,s35);
    month(i,10)=strcmp(s1,s36);
    month(i,11)=strcmp(s1,s37);
    month(i,12)=strcmp(s1,s38);
    s1=dayofweek_pre(i,1);
    dayofweek(i,1)=strcmp(s1,s39);
    dayofweek(i,2)=strcmp(s1,s40);
    dayofweek(i,3)=strcmp(s1,s41);
    dayofweek(i,4)=strcmp(s1,s42);
    dayofweek(i,5)=strcmp(s1,s43);
    s1=poutcome_pre(i,1); 
    if strcmp(s1,s44)
        poutcome(i,1)=1;
    elseif strcmp(s1,s45)
        poutcome(i,1)=2;
    elseif strcmp(s1,s46)
        poutcome(i,1)=3;
    end
    s1=y_pre(i,1);
    if strcmp(s1,s23)
        y(i,1)=0;
    elseif strcmp(s1,s24)
        y(i,1)=1;
    end
end

education=(education-min(education))/(max(education)-min(education));
poutcome=(poutcome-min(poutcome))/(max(poutcome)-min(poutcome));

num_train=3000;
num_test=4000-num_train;
num_feature=41;

feature_train(:,1)=age(1:num_train,1); 
feature_train(:,2:12)=job(1:num_train,1:11);
feature_train(:,13)=marital(1:num_train,1);
feature_train(:,14)=education(1:num_train,1);
feature_train(:,15)=housing(1:num_train,1);
feature_train(:,16)=loan(1:num_train,1);
feature_train(:,17)=contact(1:num_train,1);
feature_train(:,18:29)=month(1:num_train,1:12);
feature_train(:,30:34)=dayofweek(1:num_train,1:5);
feature_train(:,35)=campaign(1:num_train,1);
feature_train(:,36)=pdays(1:num_train,1);
feature_train(:,37)=previous(1:num_train,1);
feature_train(:,38)=poutcome(1:num_train,1);
feature_train(:,39)=conspriceidx(1:num_train,1);
feature_train(:,40)=consconfidx(1:num_train,1);
feature_train(:,41)=euribor3m(1:num_train,1);
%feature_train(:,42)=y(1:num_train,1);

feature_test(:,1)=age(num_train+1:4000,1); 
feature_test(:,2:12)=job(num_train+1:4000,1:11);
feature_test(:,13)=marital(num_train+1:4000,1);
feature_test(:,14)=education(num_train+1:4000,1);
feature_test(:,15)=housing(num_train+1:4000,1);
feature_test(:,16)=loan(num_train+1:4000,1);
feature_test(:,17)=contact(num_train+1:4000,1);
feature_test(:,18:29)=month(num_train+1:4000,1:12);
feature_test(:,30:34)=dayofweek(num_train+1:4000,1:5);
feature_test(:,35)=campaign(num_train+1:4000,1);
feature_test(:,36)=pdays(num_train+1:4000,1);
feature_test(:,37)=previous(num_train+1:4000,1);
feature_test(:,38)=poutcome(num_train+1:4000,1);
feature_test(:,39)=conspriceidx(num_train+1:4000,1);
feature_test(:,40)=consconfidx(num_train+1:4000,1);
feature_test(:,41)=euribor3m(num_train+1:4000,1);

%[feature_train label_train] = SMOTE(feature_train(:,1:41), feature_train(:,42));%SMOTE

label_train=y(1:num_train,1);
label_test=y(num_train+1:4000,1);
R = corrcoef(feature_train);
R(isnan(R))=0;  

[num_train,c]=size(feature_train);%SMOTE


end