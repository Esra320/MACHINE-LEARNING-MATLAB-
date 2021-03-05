% Doğruluk değerini hesaplamak için X te bulunan özelliklerden tahmin yapıldı.
% learned logistic kullanarak etiketin 0 mı yoksa 1 mi olduğunu tahmin edildi.
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
