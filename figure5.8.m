img = imread('C:\Users\Active\Desktop\imgproc\Fig0507.tif');

% Create pepper noise with probability 0.1
rng(42); % Set seed for reproducibility
pepper_mask = rand(size(img));
img_pepper = img;
img_pepper(pepper_mask <= 0.1) = 0;

% Create salt noise with probability 0.1
salt_mask = rand(size(img));
img_salt = img;
img_salt(salt_mask <= 0.1) = 255;

% Apply a 3x3 contraharmonic filter to the pepper noise image (Q = 1.5)
Q_pepper = 1.5;
filtered_pepper = contraharmonic_mean_filter(img_pepper, 3, Q_pepper);

% Apply a 3x3 contraharmonic filter to the salt noise image (Q = -1.5)
Q_salt = -1.5;
filtered_salt = contraharmonic_mean_filter(img_salt, 3, Q_salt);

% Display the results
figure;

subplot(2, 2, 1);
imshow(img_pepper, []);
title('Image Corrupted by Pepper Noise');

subplot(2, 2, 2);
imshow(img_salt, []);
title('Image Corrupted by Salt Noise');

subplot(2, 2, 3);
imshow(filtered_pepper, []);
title('Filtered Image (Pepper Noise)');

subplot(2, 2, 4);
imshow(filtered_salt, []);
title('Filtered Image (Salt Noise)');

%%
function output = contraharmonic_mean_filter(input, window_size, Q)
    % Apply a contraharmonic mean filter
    padded_input = padarray(double(input), [floor(window_size/2) floor(window_size/2)], 'replicate');
    output = zeros(size(input));

    for i = 1:size(input, 1)
        for j = 1:size(input, 2)
            window = padded_input(i:i+window_size-1, j:j+window_size-1);
            numerator = sum(window(:).^(Q+1));
            denominator = sum(window(:).^Q);
            output(i, j) = numerator / max(denominator, eps); % Avoid division by zero
        end
    end
end