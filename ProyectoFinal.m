clear all, clc, close all

digitDatasetPath = '/Users/isaacmenchacapanecatl/Documents/UAG 🗂/DSPs/Project/archive/asl_alphabet_train/asl_alphabet_train';
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds);
img = readimage(imds,1);
size(img)

numTrainFiles = 2100;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

% Define the convolutional neural network architecture.


layers = [
    imageInputLayer([200 200 3])
    
    convolution2dLayer(3,8,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(24)
    softmaxLayer
    classificationLayer];


options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',6, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

%%
net = trainNetwork(imdsTrain,layers,options);
%%
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);
%% Test

I = imread("/Users/isaacmenchacapanecatl/Documents/UAG 🗂/DSPs/Project/archive/asl_alphabet_test/asl_alphabet_test/Y_test.jpg");
[YPred,probs] = classify(net,I);
%imshow(I)
label = YPred;
%title(string(label) + ", " + num2str(100*max(probs),3) + "%");
fprintf(s, string(label) + num2str(100*max(probs),3) + "%");
%%
delete(instrfind)
s = serial('/dev/cu.usbmodem14103','BaudRate',115200);
fopen(s);
fprintf(s, string(label) + num2str(100*max(probs),3) + "%");
fclose(s);
%%
vid = videoinput('macvideo',1);
set(vid, 'ReturnedColorspace', 'rgb')
start(vid)
preview(vid)

for n=1:30
    pause(1)
    foto = getsnapshot(vid);
    I = imcrop(foto,[280 0 720 720]);
    I = imresize(I, [200 200]);
    imshow(I)
    [YPred,probs] = classify(net,I);
    imshow(I)
    label = YPred;
    fprintf(s, string(label) + num2str(100*max(probs),3) + "%");
end
closepreview(vid);stop(vid)

%%