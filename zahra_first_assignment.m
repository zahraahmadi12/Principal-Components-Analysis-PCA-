close all
clear
load ModelReductionData.mat %upload the dataset

%the question part A 

%1)we will check the projection of Row 1 against Row 2
figure('Name',"Projection of Row 1 against Row 2")
plot(X(1,:) ,X (2,:),'k.', "MarkerSize",5 , "Color","Blue") % the plot that shows row 1 against 2 
axis("equal")
set(gca,"Fontsize" , 20 ) % set the properties of the plot
xlabel("Row1", "Color","BLack" , "FontSize", 20);
ylabel("Row2", 'Color',"black" , "FontSize", 20);

%%%%%%we will do  one other Projection and will go to the other part of the
%%%%%%exercise

%2)we will check the projection of row2 agianst row3
figure("Name","Projection of Row2 against Row 3")
plot(X(2,:), X(3,:) ,'k.','Color','Blue','MarkerSize',5)
axis("equal")
set(gca,"Fontsize",20)
xlabel('Row2','FontSize',20 , 'Color','Black')
ylabel('Row3','FontSize',20 ,'Color','Black')

%we will plot all the possible combinations using the binomial coefficient
m = 1 ;
figure ('Name', '15 patterns')
for i = 1:5
    for j = i + 1:6
        subplot(5,3,m)
        m = m+1 ;
        plot (X(i,:) ,X(j,:) ,'k.' , 'MarkerSize', 4 , 'Color','Blue')
        set(gca,'Fontsize',10)
        axis('equal');
        xlabel('Row'+ ' ' + i ,'Color','Black','FontSize',8)
        ylabel('Row'+ ' ' + j ,'Color','Black','FontSize',8)
    end
end
X_mean = mean(X,2);
C = X - Xmean ;
[U,S,V]=svd(C);
Z=U(:,1:2)'*C;
SV = diag(s);

figure("Name", 'Fisrt two principal components')
plot(Z(1,:),Z(2,:), 'k.', 'MarkerSize', 7, 'Color', 'Blue')
set(gca, 'FontSize', 20)
axis('equal');
xlabel('PC 1', 'Color', 'Black', 'FontSize', 10)
ylabel('PC 2', 'Color', 'Black', 'FontSize', 10)

Z = U(:,[3 4])' * C; %Find the first two principal components

figure("Name", 'Principal components 3 and 4')
plot(Z(1,:),Z(2,:), 'k.', 'MarkerSize', 7, 'Color', 'Blue')
plot(Z(1,:),Z(2,:), 'k.', 'MarkerSize', 7, 'Color', 'Blue')
set(gca, 'FontSize', 16)
axis('equal');
xlabel('PC 3', 'Color', 'Blue')
ylabel('PC 4', 'Color', 'Blue')

figure("Name", 'Singular values')
plot(SV, '-k.', 'Color', 'Blue', 'MarkerSize', 7, 'LineWidth', 5)
set(gca, 'FontSize', 16)%the graphicL THE FONT SIZE 
xlabel('Principal components', 'Color', 'Blue', 'FontSize', 16)
ylabel('Singular values', 'Color', 'Blue', 'FontSize', 16)






