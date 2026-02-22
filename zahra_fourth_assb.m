clc;
close all;

% Load Yale Face Database
load('Yale_64x64.mat');

% Define constants
imageWidth = 64;
imageHeight = 64;
expressionsPerIndividual = 6; % Different expressions per individual
numIndividuals = 5; % Number of individuals

% Perform low-rank approximation for different ranks
for rank = [5, 20, 35] % Select ranks
   
    % Compute mean-centered data
    meanData = mean(fea, 2);
    centeredData = fea - meanData * ones(1, size(fea, 2));
    
    % compute Singular Value Decomposition
    [U, S, V] = svds(centeredData, rank);
    approximation = U * S * V'; % Approximated matrix at rank 'rank'
    
    % Plot singular values
    singularValues = diag(S);
    figure()
    semilogy(singularValues, '-s', 'LineWidth', 1, 'MarkerSize', 7) % Plot logarithmically
    set(gca, 'FontSize', 15)
    title(['singular values at rank = ', num2str(rank)], 'FontSize', 12)
    xlabel('Components')
    ylabel('LOG Singular Values ')
end


