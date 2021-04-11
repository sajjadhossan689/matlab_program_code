img = (imread('hestain.png'));
figure;
imshow(img);
title ('Tissue Image');
conversionform = makecform ('srgb2lab');
lab_img = applycform (img, conversionform);
ab = double (lab_img (:,:, 2:3));
nrows = size (ab, 1);
ncols = size (ab, 2);
ab = reshape (ab, nrows*ncols, 2);
nColors = 3;
[cluster_idx, cluster_center] = kmeans (ab, nColors,'distance',�sqEuclidean�,
'Replicates', 3);
pixel_labels = reshape (cluster_idx, nrows, ncols);
figure; subplot (2, 2, 1);
imshow (pixel_labels,[]);
title('image labeled by cluster index');
segmented_images = cell (1, 3);
rgb_label = repmat(pixel_labels,[1 1 3]);
for k = 1: nColors
color = img;
color(rgb_label ~= k) = 0;
segmented_images{k} = color;
end
subplot (2, 2, 2);
imshow (segmented_images {1});
title ('objects in cluster 1');
subplot (2, 2, 3);
imshow (segmented_images{2});
title('objects in cluster 2');
subplot (2, 2, 4);
imshow(segmented_images{3});
title ('objects in cluster');