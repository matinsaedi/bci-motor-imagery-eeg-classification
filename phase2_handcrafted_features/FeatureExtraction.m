clc;
close all;

x_train = zeros(897,140,98);
x_test  = zeros(897,140,98);
accuracy = zeros(897,1);
loocv = zeros(897,1);

for i=1
    for j=1:140
        for k=1:3
          x_train(i,j,k) = E(xx_train,i,j,k);
          x_test(i,j,k)  = E(xx_test,i,j,k);
        end
        
        for k=4:6
          x_train(i,j,k) = skew(xx_train,i,j,k-3);
          x_test(i,j,k)  = skew(xx_test,i,j,k-3);  
        end
        
        for k=7:9
          x_train(i,j,k) = kurt(xx_train,i,j,k-6);
          x_test(i,j,k)  = kurt(xx_test,i,j,k-6);  
        end   
        
        for k=10:12
          x_train(i,j,k) = shannon(xx_train,i,j,k-9);
          x_test(i,j,k)  = shannon(xx_test,i,j,k-9);  
        end    
        
        for k=13:15
          x_train(i,j,k) = ar4(xx_train,i,j,k-12,2);
          x_test(i,j,k)  = ar4(xx_test,i,j,k-12,2);  
        end 
        
        for k=16:18
          x_train(i,j,k) = ar4(xx_train,i,j,k-15,3);
          x_test(i,j,k)  = ar4(xx_test,i,j,k-15,3);  
        end
        
        for k=19:21
          x_train(i,j,k) = ar4(xx_train,i,j,k-18,4);
          x_test(i,j,k)  = ar4(xx_test,i,j,k-18,4);  
        end
        
        for k=22:24
          x_train(i,j,k) = ar4(xx_train,i,j,k-21,5);
          x_test(i,j,k)  = ar4(xx_test,i,j,k-21,5);  
        end
        
        for k=25:27
          x_train(i,j,k) = ar5(xx_train,i,j,k-24,2);
          x_test(i,j,k)  = ar5(xx_test,i,j,k-24,2);  
        end
        
        for k=28:30
          x_train(i,j,k) = ar5(xx_train,i,j,k-27,3);
          x_test(i,j,k)  = ar5(xx_test,i,j,k-27,3);  
        end
        
        for k=31:33
          x_train(i,j,k) = ar5(xx_train,i,j,k-30,4);
          x_test(i,j,k)  = ar5(xx_test,i,j,k-30,4);  
        end
        
        for k=34:36
          x_train(i,j,k) = ar5(xx_train,i,j,k-33,5);
          x_test(i,j,k)  = ar5(xx_test,i,j,k-33,5);  
        end
        
        for k=37:39
          x_train(i,j,k) = ar5(xx_train,i,j,k-36,6);
          x_test(i,j,k)  = ar5(xx_test,i,j,k-36,6);  
        end
        
        for k=40:42
          x_train(i,j,k) = pvbsd(xx_train,i,j,k-39);
          x_test(i,j,k)  = pvbsd(xx_test,i,j,k-39);  
        end
        
        for k=43:45
          x_train(i,j,k) = pvbsd2(xx_train,i,j,k-42);
          x_test(i,j,k)  = pvbsd2(xx_test,i,j,k-42);  
        end
        
        for k=46:48
          x_train(i,j,k) = pvbsd3(xx_train,i,j,k-45);
          x_test(i,j,k)  = pvbsd3(xx_test,i,j,k-45);  
        end
        
        for k=49:51
          x_train(i,j,k) = am1(xx_train,i,j,k-48);
          x_test(i,j,k)  = am1(xx_test,i,j,k-48);  
        end
        
        for k=52:54
          x_train(i,j,k) = am2(xx_train,i,j,k-51);
          x_test(i,j,k)  = am2(xx_test,i,j,k-51);  
        end
        
        for k=55:57
          x_train(i,j,k) = am3(xx_train,i,j,k-54);
          x_test(i,j,k)  = am3(xx_test,i,j,k-54);  
        end
        
        for k=58:60
          x_train(i,j,k) = sm1(xx_train,i,j,k-57);
          x_test(i,j,k)  = sm1(xx_test,i,j,k-57);  
        end
        
        for k=61:63
          x_train(i,j,k) = sm2(xx_train,i,j,k-60);
          x_test(i,j,k)  = sm2(xx_test,i,j,k-60);  
        end
        
        for k=64:66
          x_train(i,j,k) = sm3(xx_train,i,j,k-63);
          x_test(i,j,k)  = sm3(xx_test,i,j,k-63);  
        end
        
        for k=67:69
          x_train(i,j,k) = std1(xx_train,i,j,k-66);
          x_test(i,j,k)  = std1(xx_test,i,j,k-66);  
        end
        
        for k=70:72
          x_train(i,j,k) = std2(xx_train,i,j,k-69);
          x_test(i,j,k)  = std2(xx_test,i,j,k-69);  
        end
        
        for k=73:75
          x_train(i,j,k) = std3(xx_train,i,j,k-72);
          x_test(i,j,k)  = std3(xx_test,i,j,k-72);  
        end
        
        for k=76:78
          x_train(i,j,k) = om1(xx_train,i,j,k-75);
          x_test(i,j,k)  = om1(xx_test,i,j,k-75);  
        end
        
        for k=79:81
          x_train(i,j,k) = om2(xx_train,i,j,k-78);
          x_test(i,j,k)  = om2(xx_test,i,j,k-78);  
        end
        
        for k=82:84
          x_train(i,j,k) = om3(xx_train,i,j,k-81);
          x_test(i,j,k)  = om3(xx_test,i,j,k-81);  
        end
        
        for k=85:87
          x_train(i,j,k) = ku1(xx_train,i,j,k-84);
          x_test(i,j,k)  = ku1(xx_test,i,j,k-84);  
        end
        
        for k=88:90
          x_train(i,j,k) = ku2(xx_train,i,j,k-87);
          x_test(i,j,k)  = ku2(xx_test,i,j,k-87);  
        end
        
        for k=91:93
          x_train(i,j,k) = ku3(xx_train,i,j,k-90);
          x_test(i,j,k)  = ku3(xx_test,i,j,k-90);  
        end
        
        for k=94
          x_train(i,j,k) = mscoh1(xx_train,i,j);
          x_test(i,j,k)  = mscoh1(xx_test,i,j);  
        end
        
        for k=95
          x_train(i,j,k) = mscoh2(xx_train,i,j);
          x_test(i,j,k)  = mscoh2(xx_test,i,j);  
        end
        
        for k=96
          x_train(i,j,k) = mscoh3(xx_train,i,j);
          x_test(i,j,k)  = mscoh3(xx_test,i,j);  
        end
        
        for k=97
          x_train(i,j,k) = mscoh4(xx_train,i,j);
          x_test(i,j,k)  = mscoh4(xx_test,i,j);  
        end
        
        for k=98
          x_train(i,j,k) = mscoh5(xx_train,i,j);
          x_test(i,j,k)  = mscoh5(xx_test,i,j);  
        end
    end
    
end


function energy = E(x,i,j,k)
    
    x = x(i:i+255,k,j);
    energy = 0;
    for n = 1:256
        energy = energy + (x(n))^2;
    end
end

function s = skew(x,i,j,k)
    
    x = x(i:i+255,k,j);
    s = skewness(x);
    
end

function k = kurt(x,i,j,k)
    
    x = x(i:i+255,k,j);
    k = kurtosis(x);
    
end

function s = shannon(x,i,j,k)
    
    x = x(i:i+255,k,j);
    s = wentropy(x,'shannon');
    
end

function s = ar4(x,i,j,k,n)
    
    x = x(i:i+255,k,j);
    a = arburg(x,4);
    s = a(n);
end

function s = ar5(x,i,j,k,n)
    
    x = x(i:i+255,k,j);
    a = arburg(x,5);
    s = a(n);
end

function s = pvbsd(x,i,j,k)
    
    x = x(i:i+255,k,j);
    pxx = pburg(x,12,[],128);
    s = max(pxx);
end

function s = pvbsd2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    pxx = pburg(x,12,[],128);
    s = mean(pxx);
end

function s = pvbsd3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    pxx = pburg(x,12,[],128);
    s = var(pxx);
end

function s = am1(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean(abs(cd2));
end

function s = am2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean(abs(cd3));
end

function s = am3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean(abs(cd4));
end

function s = sm1(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean((cd2.^2));
end

function s = sm2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean((cd3.^2));
end

function s = sm3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = mean((cd4.^2));
end

function s = std1(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = std(cd2);
end

function s = std2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = std(cd3);
end

function s = std3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = std(cd4);
end

function s = om1(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = skewness(cd2);
end

function s = om2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = skewness(cd3);
end

function s = om3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = skewness(cd4);
end

function s = ku1(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = kurtosis(cd2);
end

function s = ku2(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = kurtosis(cd3);
end

function s = ku3(x,i,j,k)
    
    x = x(i:i+255,k,j);
    [c,l] = wavedec(x,5,'db9');
    [cd2,cd3,cd4] = detcoef(c,l,[2 3 4]);
    s = kurtosis(cd4);
end

function s = mscoh1(x,i,j)
    
    c3 = x(i:i+255,1,j);
    c4 = x(i:i+255,3,j);
    cxy = mscohere(c3,c4);
    s = mean(cxy);
end

function s = mscoh2(x,i,j)
    
    c3 = x(i:i+255,1,j);
    c4 = x(i:i+255,3,j);
    cxy = mscohere(c3,c4);
    s = mean((cxy).^2);
end

function s = mscoh3(x,i,j)
    
    c3 = x(i:i+255,1,j);
    c4 = x(i:i+255,3,j);
    cxy = mscohere(c3,c4);
    s = std(cxy);
end

function s = mscoh4(x,i,j)
    
    c3 = x(i:i+255,1,j);
    c4 = x(i:i+255,3,j);
    cxy = mscohere(c3,c4);
    s = skewness(cxy);
end

function s = mscoh5(x,i,j)
    
    c3 = x(i:i+255,1,j);
    c4 = x(i:i+255,3,j);
    cxy = mscohere(c3,c4);
    s = kurtosis(cxy);
end