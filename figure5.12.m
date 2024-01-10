img = imread('C:\Users\Active\Desktop\imgproc\Fig0507.tif');

% Add additive uniform noise
uniform_noise = imnoise2(img, 'uniform', 0, 0.17); 

% Add salt-and-pepper noise on top of the uniform noise
noisy_img = imnoise(uniform_noise, 'salt & pepper', 0.1);

% Apply different filters on the noisy image
arithmetic_mean = imfilter(noisy_img, fspecial('average', [5, 5]), 'replicate');

% Apply geometric mean filter (5x5)
geometric_mean = nlfilter(noisy_img, [5, 5], @(block) geomean(reshape(block, [], 1)));

% Linearly stretch the intensity values for better visualization
geometric_mean = mat2gray(geometric_mean);

% Alpha-trimmed mean filter (5x5) with d=6
alpha_trimmed = ordfilt2(noisy_img, 13, ones(5, 5));

% Display the results
figure;

subplot(2, 3, 1);
imshow(uniform_noise);
title('Image Corrupted by Additive Uniform Noise');

subplot(2, 3, 2);
imshow(noisy_img);
title('Image Corrupted by Additive Salt-and-Pepper Noise');

subplot(2, 3, 3);
imshow(arithmetic_mean);
title('Arithmetic Mean Filter (5x5)');

subplot(2, 3, 4);
imshow(geometric_mean);
title('Geometric Mean Filter (5x5)');

subplot(2, 3, 5);
imshow(alpha_trimmed);
title('Alpha-Trimmed Mean Filter (5x5), d=6');