img = imread('C:\Users\Active\Desktop\imgproc\Fig0503.tif');

% Define an array of different noise types
noise_types = {'exponential', 'uniform', 'salt & pepper'}; 

% Parameters for each type of noise 
noise_params = [
    7, 0 ;    % Parameters for 'exponential'
    0, 0.17; % Parameters for 'uniform'
    0.05, 0.05     % Parameters for 'salt & pepper'
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