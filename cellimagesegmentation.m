figure; IMG = imread ('cell.png');
imshow (IMG);
title ('Original Image');
figure; subplot (2, 3, 1)
[~, threshold] = edge (IMG,'sobel');
fudgeFactor = 0.5;
BWs = edge (IMG,'sobel', threshold * fudgeFactor);
imshow (BWs)
title ('Binary Gradient Mask')
subplot (2, 3, 2)
se90 = strel ('line', 3, 90);
se0 = strel ('line', 3, 0);
BWsdil = imdilate (BWs, [se90 se0]);
imshow(BWsdil)
title ('Dilated Gradient Mask')
subplot (2, 3,3)
BWdfill = imfill (BWsdil, ‘holes');
imshow (BWdfill)
title ('BI with Filled Holes')
subplot (2, 3,4)
BWbord = imclearborder (BWdfill, 4);
imshow (BWbord)
title ('Cleared Border Image')
subplot (2, 3, 5)
SM = strel ('diamond', 1);
BWf = imerode (BWbord, SM);
BWf = imerode (BWf, SM);
imshow (BWf)
title ('Segmented Image');
subplot (2, 3, 6)
BWoutline = bwperim (BWf);
Segout = IMG;
Segout (BWoutline) = 255;
imshow (Segout)
title ('Outlined Original Image')