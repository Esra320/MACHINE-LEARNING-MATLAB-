% Do�ruluk de�erini hesaplamak i�in X te bulunan �zelliklerden tahmin yap�ld�.
% learned logistic kullanarak etiketin 0 m� yoksa 1 mi oldu�unu tahmin edildi.
function p = predict(theta, X)
m = size(X, 1); 
p = zeros(m, 1);
o= X*theta;
o=sigmoid(o);
for i=1 : m
    if o(i) >=0.5
        p(i)=1;
    end 
end
end
