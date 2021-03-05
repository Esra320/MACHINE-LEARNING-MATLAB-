clear ; close all; clc
%%
data = load('diabetes.txt'); % load komutu ile veri seti al�nd�.
X = data(:, 1:8);  % veri setinin 1'den 8'e kadarki s�tunlar ve t�m sat�rlar� X'atand�.
y = data(:, 9);    % veri setinin 9. s�tunu ve t�m sat�rlar� y'ye atand�.
plotData(X, y);    % Grafik i�in plotData fonksiyonuna X ve y girdileri verildi.
%% 
[m, n] = size(X);  % X'in boyutu al�nd�.
X = [ones(m, 1) X]; % X'in �n�ne birlerden olu�an m sat�rl�k 1 s�tun eklendi.
fprintf('Theta s�f�r olarak ba�lat�l�r. \n'); % fprintf komutu ile mesaj ekrana yaz�ld�.
init_theta = zeros(n + 1, 1); % init_theta de�i�kenine n+1 sat�r ve 1 s�tunlu s�f�rlardan olu�an matris atand�.
[cost, grad] = costFunction(init_theta, X, y); 
% costFunction'a giri� de�eri olarak init_theta, X ve y de�erleri verilip ��k�� olarak cost ve grad de�erleri al�nd�.
fprintf('�lk theta^daki maliyet de�eri: %f\n', cost); % cost yani maliyet de�eri ekrana yaz�ld�. 
fprintf('�lk theta^daki gradient de�erleri: \n');  
fprintf(' %f \n', grad); % gradient de�eri ekrana yaz�ld�.
%% Test 
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
test_theta = [-10; 0.1; 0.05;-0.01;0.01;0.001;0.1;1;0.05]; 
% modelin testi i�in test_theta de�i�kenine yeni veriler eklendi.
[cost, grad] = costFunction(test_theta, X, y); 
fprintf('\n Test i�in veriler girildi');
fprintf('\n Test i�in maliyet de�eri: %f\n', cost);
fprintf(' Test i�in gradient de�erleri: \n');
fprintf(' %f \n', grad);
%%
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
options = optimset('GradObj', 'on', 'MaxIter', 400); 
% optimisazyon i�in se�enekler elirlendi ve options de�i�kenine atand�.
[theta, cost] = ... 
	fminunc(@(t)(costFunction(t, X, y)), init_theta, options);
% problemin minimum ��z�m� i�in optimisazyon i�lemi uyguland�.
fprintf('\n Optimizasyondan sonra theta de�erileri: \n');
fprintf(' %f \n', theta);
fprintf('Optimizasyondan sonra maliyet de�eri: %f\n', cost);
prob = sigmoid([1 10 150 50 25 100 25 0.5 25] * theta);
%%
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
fprintf('Girilen yeni de�erler i�in diyabet olas�l���:');
fprintf(' %f \n', prob);
if prob>0.5 % prop yani olas�l�k de�eri 0.5 ten b�y�k ise ki�i diyabet hastas�d�r.
fprintf('Diyabet hastas�. \n');
else % prop yani olas�l�k de�eri 0.5 ten k���k ise ki�i diyabet hastas� de�ildir.
fprintf('Diyabet hastas� de�il. \n');
end
p = predict(theta, X);
fprintf('Do�ruluk: %f\n', mean(double(p == y)) * 100); 
% predict te �retilen tahmin de�eri ile veri setindeki ��k�� de�eri kar��la�t�r�ld�. 
% Ortalama de�er al�n�p modelin do�ruluk de�eri hesapland�.