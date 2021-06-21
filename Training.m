clc;
clear all;
close all;
%% Taking an Image
[fname, path]=uigetfile('.png','Open an Image as input for training');
fname=strcat(path, fname);
im=imread(fname);
im=im2bw(im);
imshow(im);
title('Input Image');
c=input('Enter the Class(1 or 2)= ');
%% Feature Extraction
F=FeatureStatistical(im);
try 
    load db;
    F=[F c];
    db=[db; F];
    save db.mat db 
catch 
    db=[F c]; % 10 12 1
    save db.mat db 
end
