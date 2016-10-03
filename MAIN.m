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

%% Radiall integrate the circle

[ r, z ] = radI( I );

%% Testing


% array dimensions [rows, cols]
[M, N] = size(I);

% grid vectors (cartesian)
x = -N/2:N/2-1;
y = -M/2:M/2-1;

% grid array (cartesian)
[X , Y] = meshgrid(x, y);

[theta,rho] = cart2pol(X,Y);

clear M N x y X Y
[rAvg,yAvg,rStd,yStd,r,y] = rscan2(I,rho, 120);

%%

