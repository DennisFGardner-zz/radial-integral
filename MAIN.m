%% MAIN

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Oct. 3rd, 2016


%% Open the circle image

I = imread('circle.jpg');
I = double(I);
I = mean(I,3);
I(I>=200) = 0;
I(I>0) = 1;
figure; imagesc(I); axis image;


