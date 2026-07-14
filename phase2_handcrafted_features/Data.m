clc;
clear;

folder = 'C:\Users\MATIN\Desktop\Mat';  
fullMatFileName = fullfile(folder,'dataset_BCIcomp1.mat');
s = load(fullMatFileName);

folder = 'C:\Users\MATIN\Desktop\Mat';  
fullMatFileName = fullfile(folder,'labels_data_set_iii.mat');
q = load(fullMatFileName);

xx_train = s.x_train;
y_train = s.y_train;

xx_test = s.x_test;
y_test = q.y_test;

load('train2.mat');
load('test.mat');
