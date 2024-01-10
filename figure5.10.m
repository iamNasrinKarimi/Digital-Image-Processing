img = imread('C:\Users\Active\Desktop\imgproc\Fig0507.tif');

% Add salt-and-pepper noise with probabilities Pp = Ps = 0.1
noisy_img = imnoise(img, 'salt & pepper', 0.1);

% Apply one pass of a 3x3 median filter
filtered_img_1 = medfilt2(noisy_img, [3, 3]);

% Perform the second pass of filtering on the result of the first pass
filtered_img_2 = medfilt2(filtered_img_1, [3, 3]);

% Perform the third pass of filtering on the result of the second pass
filtered_img_3 = medfilt2(filtered_img_2, [3, 3]);

% Display the results
figure;

subplot(2, 2, 1);
imshow(noisy_img);
title('Image Corrupted by Salt-and-Pepper Noise');

subplot(2, 2, 2);
imshow(filtered_img_1);
title('Result of One Pass with Median Filter (3x3)');

subplot(2, 2, 3);
imshow(filtered_img_2);
title('Result of Processing (b) with Same Filter');

subplot(2, 2, 4);
imshow(filtered_img_3);
title('Result of Processing (c) with Same Filter');