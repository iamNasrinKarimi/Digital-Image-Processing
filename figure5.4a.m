img = imread('C:\Users\Active\Desktop\imgproc\Fig0503.tif');

% Define an array of different noise types
noise_types = {'gaussian', 'rayleigh', 'erlang'}; 

% Parameters for each type of noise 
noise_params = [
    0.1, 0.05 ;    % Parameters for 'gaussian'
    0, 0.013; % Parameters for 'rayleigh'
    8, 1     % Parameters for 'erlang'
];

figure;

for i = 1:numel(noise_types)
    
    img_processed = imnoise2(img, noise_types{i}, noise_params(i, 1), noise_params(i, 2));
    
    % Display each processed image
    subplot(2, numel(noise_types), i);
    imshow(img_processed);
    title(sprintf('Processed Image - %s Noise', noise_types{i}));
    
    % Compute histogram of the processed image
    subplot(2, numel(noise_types), i + numel(noise_types));
    imhist(img_processed);
    title(sprintf('Histogram - %s Noise', noise_types{i}));
end