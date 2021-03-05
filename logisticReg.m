clear ; close all; clc
%%
data = load('diabetes.txt'); % load komutu ile veri seti alýndý.
X = data(:, 1:8);  % veri setinin 1'den 8'e kadarki sütunlar ve tüm satýrlarý X'atandý.
y = data(:, 9);    % veri setinin 9. sütunu ve tüm satýrlarý y'ye atandý.
plotData(X, y);    % Grafik için plotData fonksiyonuna X ve y girdileri verildi.
%% 
[m, n] = size(X);  % X'in boyutu alýndý.
X = [ones(m, 1) X]; % X'in önüne birlerden oluþan m satýrlýk 1 sütun eklendi.
fprintf('Theta sýfýr olarak baþlatýlýr. \n'); % fprintf komutu ile mesaj ekrana yazýldý.
init_theta = zeros(n + 1, 1); % init_theta deðiþkenine n+1 satýr ve 1 sütunlu sýfýrlardan oluþan matris atandý.
[cost, grad] = costFunction(init_theta, X, y); 
% costFunction'a giriþ deðeri olarak init_theta, X ve y deðerleri verilip çýkýþ olarak cost ve grad deðerleri alýndý.
fprintf('Ýlk theta^daki maliyet deðeri: %f\n', cost); % cost yani maliyet deðeri ekrana yazýldý. 
fprintf('Ýlk theta^daki gradient deðerleri: \n');  
fprintf(' %f \n', grad); % gradient deðeri ekrana yazýldý.
%% Test 
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
test_theta = [-10; 0.1; 0.05;-0.01;0.01;0.001;0.1;1;0.05]; 
% modelin testi için test_theta deðiþkenine yeni veriler eklendi.
[cost, grad] = costFunction(test_theta, X, y); 
fprintf('\n Test için veriler girildi');
fprintf('\n Test için maliyet deðeri: %f\n', cost);
fprintf(' Test için gradient deðerleri: \n');
fprintf(' %f \n', grad);
%%
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
options = optimset('GradObj', 'on', 'MaxIter', 400); 
% optimisazyon için seçenekler elirlendi ve options deðiþkenine atandý.
[theta, cost] = ... 
	fminunc(@(t)(costFunction(t, X, y)), init_theta, options);
% problemin minimum çözümü için optimisazyon iþlemi uygulandý.
fprintf('\n Optimizasyondan sonra theta deðerileri: \n');
fprintf(' %f \n', theta);
fprintf('Optimizasyondan sonra maliyet deðeri: %f\n', cost);
prob = sigmoid([1 10 150 50 25 100 25 0.5 25] * theta);
%%
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
fprintf('Girilen yeni deðerler için diyabet olasýlýðý:');
fprintf(' %f \n', prob);
if prob>0.5 % prop yani olasýlýk deðeri 0.5 ten büyük ise kiþi diyabet hastasýdýr.
fprintf('Diyabet hastasý. \n');
else % prop yani olasýlýk deðeri 0.5 ten küçük ise kiþi diyabet hastasý deðildir.
fprintf('Diyabet hastasý deðil. \n');
end
p = predict(theta, X);
fprintf('Doðruluk: %f\n', mean(double(p == y)) * 100); 
% predict te üretilen tahmin deðeri ile veri setindeki çýkýþ deðeri karþýlaþtýrýldý. 
% Ortalama deðer alýnýp modelin doðruluk deðeri hesaplandý.