function [ rMean, zMean ] = radI(r, ind, I, N)
%RADI - radially integrate the 2D array into N partitions
%   From the center of the 2D array, I, radially integrate outwards. This
%   function is capable of handling an array with NaN elements.
%
%   The two variables for this funtion, r & ind, are initialized by another
%   function called preRadI. This was done to speed up this function
%   becasue this function, in my analysis, is used within a for loop and is
%   called hundreds of times. 
%
%   This function is largely based on Narupon Chattrapiban's code posted in
%   the comments of Radial Scan at: 
%   https://www.mathworks.com/matlabcentral/fileexchange/18102-radial-scan
% 
% Syntax:  [ rMean, zMean ] = radI(r, ind, I) 
%              or 
%          [ rMean, zMean ] = radI(r, ind, I, N);
%
% Inputs:
%    r - 1D array - distance from the center of I (from preRadI)
%    ind - 1D array - index for I in increasing radial order (from preRadI)
%    I - 2D array - image (or diffraction) to be radially integrated
%    N - numbmer - divide integral into N sections, default N = rows * cols
%
% Outputs:
%    rMean - 1D vector - the average value of r in the section
%    zMean - 1D vector - average value of image at the given r values
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
% See also: preRadI,  OTHER_FUNCTION_NAME2
%
% Notes: The N breaks up the integral into N parts. Each part has the same
% number of pixels equal to NumberOfElments/N . This function is fast, but
% it's not radially integrating with a fixed delta r. The number of
% sections cannot excede the number of elements in the array, I. If it
% does excede, then it's set to number of elements. 

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Oct. 3rd, 2016

%------------- BEGIN CODE --------------

% sorts the values of the image in radially increasing order
z = I(ind);

% default value of N if not given, N = rows * cols
if nargin < 4, 
    N = numel(I); 
end

% N mush be less than the number of elements
if N > numel(I), 
    N = numel(I); 
end


% number of elements in I
Nelements = numel(I);

% if the number of section is less than the number of elements, then some
% average needs to be done. Otherwise, nothing  and define outputs. 
if N < Nelements
    % from N, calculate number of pixel in each section. Round down to ensure
    % there are enough pixels for each section. 
    pixelsPerSection = floor(Nelements/N);

    % due to rounding down, there may be left over pixels not used
    % redefine the number of elements
    Nelements = pixelsPerSection*N; 

    % there may be extra pixels, get rid of them
    r(Nelements+1:end) = []; 
    z(Nelements+1:end) = [];
    
    % reshape the linear vector, so each col has pixelsPerSecion and ther
    % are Nelement colums
    rMean = nanmean(reshape(r,pixelsPerSection,N),1); 
    zMean = nanmean(reshape(z,pixelsPerSection,N),1); 
    
elseif N == Nelements
    zMean = z;
    rMean = r;
end



%------------- END OF CODE --------------
end

