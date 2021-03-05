% PLOTDATA X ve y veri noktalar�n� yeni bir �ekle d�n��t�r�r.
% PLOTDATA (x, y), pozitif �rnekler i�in veri noktalar�n� + ile, negatif noktalar� ise o ile �izer. 
function plotData(X, y)

figure; hold on;

pos = find(y==1);
neg = find(y==0);

plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

hold off;
end