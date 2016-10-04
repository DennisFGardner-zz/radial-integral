function [r, ind] = preRadI( I )
%PRERADI initialize variables (r & ind) for the radial integral function
%   To speed up the radial integral function, radI, this function
%   initializes the nessescary variables: r & ind. 
%
%   An cartesian grid is created with the same dimensions as the input
%   image, I. The grid is converted to polor coordinates and the rho values
%   are sorted. The output of the sort function is the output of this
%   function. 
%
% Syntax:  [r, ind] = preRadI(I);
%
% Inputs:
%    I - 2D array - image or diffraction
%
% Outputs:
%    r - 1D arry - distance from the center of I
%    ind - 1D array - index for I in increasing radial order
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: RADI,  OTHER_FUNCTION_NAME2

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Oct. 4th, 2016

%------------- BEGIN CODE --------------

% array dimensions [rows, cols]
[M, N] = size(I);

% grid vectors (cartesian)
x = -N/2:N/2-1;
y = -M/2:M/2-1;

% grid array (cartesian)
[X , Y] = meshgrid(x, y);

% polor coordinates (rho has dims M x N)
[~,rho] = cart2pol(X,Y);

% sorts rho into ascending order, ind is the index
[r, ind] = sort(rho(:));

%------------- END OF CODE --------------
end
