clc;
close all;

accuracy = zeros(897,1);
loocv = zeros(897,1);

for knn=[1 3 5 7]
    for i=1:897
       xtrain = x_train(i,:,:);
       xtrain = reshape(xtrain,140,98);
       xtest = x_test(i,:,:);
       xtest = reshape(xtest,140,98);
    
       mdl = fitcknn(xtrain,y_train,'NumNeighbors',knn);
       y_pred = predict(mdl,xtest);
       accuracy(i) = acc(y_test,y_pred);
       loocv(i) = LOOCV(xtrain,y_train,knn);
    end

figure;
time = (1:897)/128 ;
[accuracy_max, index] = max(accuracy);
time_max = time(index);
plot(time,accuracy,time_max,accuracy_max,'or');
ylim([0,1]);
xlabel('Time');
ylabel('Accuracy (KNN)');
title(['KNN (K=',num2str(knn),')']);
grid on;

figure;
plot(time,loocv);
xlabel('Time');
ylabel('LOOCV');
title(['KNN (K=',num2str(knn),')']);
grid on;

end

function accuracy = acc(y_test, y_pred)
n = 0;

for i = 1:length(y_test)
    if y_test(i) == y_pred(i)
        n = n+1;
    end
end

accuracy = n/length(y_test);
end

function u = LOOCV(x_train,y_train,k)
n=0;

for i=1:length(y_train)
    x = x_train([1:i-1 i+1:end],:);
    x_test = x_train(i,:);
    y = y_train([1:i-1 i+1:end]);
    y_test = y_train(i);
    
    mdl = fitcknn(x,y,'NumNeighbors',k);
    y_pred = predict(mdl,x_test);
   
    if y_pred==y_test
        n=n+1;
    end
end

u = n/length(y_train);
end