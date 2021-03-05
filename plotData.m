% PLOTDATA X ve y veri noktalarýný yeni bir þekle dönüþtürür.
% PLOTDATA (x, y), pozitif örnekler için veri noktalarýný + ile, negatif noktalarý ise o ile çizer. 
function plotData(X, y)

figure; hold on;

pos = find(y==1);
neg = find(y==0);

plot(X(pos, 1), X(pos, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

hold off;
end