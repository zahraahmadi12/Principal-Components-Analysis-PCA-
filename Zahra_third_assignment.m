load IrisDataAnnotated.mat
g = size(X,2);
%center the  matrix 1*150
x_means = 1/g *sum(X,2);
X_centered = X - x_means*ones(1,g);
 %centered data

%compute SVD
[U,D,V] = svd(X_centered);
% U matrix of dim 4*4 in orthogonal 
% D matrix of dim 150* 150 is diagonal matrices of sigular values 
% V matrix of dim 1*150 has singular values on its orthogonal and other
% values are 0
 %%%%%
Z = U(:,1:2)'*X_centered;
%species plotted by groups

%create binary matrices 
setosa = I == 1;
versicolor= I == 2;
virginica = I == 3;


%PC plots layered with diferent color by group

figure()
plot(Z(1, setosa), Z(2, setosa), 'blue.', 'MarkerSize', 25 )
hold on
plot(Z(1, virginica), Z(2, virginica), 'bla.', 'MarkerSize',25)
hold on
plot(Z(1, versicolor), Z(2, versicolor), 'r.', 'MarkerSize', 25)



title('PCs scatter plot', 'FontSize', 18)
set(gca,'FontSize',12 ,'color',[0.9 0.9 0.9] )
xlabel('Principal component 1')
ylabel('Principal component 2')
legend('Setosa', 'Versicolor', 'Virginica')
