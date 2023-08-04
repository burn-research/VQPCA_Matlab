close all;
clear all;

% Addpath
addpath(genpath('/Users/mattepsavarese/Desktop/Dottorato/Github/LocalPCA_Suite'));

% Generate random data
X = randn(10000, 5);

% Perform local_pca
opt.Scaling = 'range';
opt.Center = 1;
opt.Algorithm = 'VQPCA';
opt.Init = 'uniform';

k = 7;
[idx, infos] = local_pca_new(X, k, 1, 0.99, opt);

% Plot
figure;
scatter(X(:,3), X(:,2), 10, idx, 'filled');
cmname = append('parula(', num2str(k), ')');
colormap(cmname);
cb = colorbar;
fig = gcf; fig.Units = 'centimeters';
fig.Position = [15 15 14 12];

! rm -r VQPCA_*

% Use k-means for a comparison
X_center = center(X, 1);
X_scaled = scale(X_center, X, 2);
idx_kmeans = kmeans(X_scaled, k, 'start', 'plus', 'MaxIter',1000);
figure;
scatter(X(:,3), X(:,2), 10, idx_kmeans, 'filled');
cmname = append('parula(', num2str(k), ')');
colormap(cmname);
cb = colorbar;
fig = gcf; fig.Units = 'centimeters';
fig.Position = [15 15 14 12];






