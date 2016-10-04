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
% Syntax:  [ rMean, zMean ] = radI(r, ind, I) 
%              or 
%          [ rMean, zMean ] = radI(r, ind, I, N);
%
% Inputs:
%    input1 - Description
%    input2 - Description
%    input3 - Description
%
% Outputs:
%    output1 - Description
%    output2 - Description
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

% Author: Dennis F Gardner
% JILA, Univeristy of Colorado, 440 UCB, Boulder, CO 80309
% email: dennis.gardner@colorado.edu
% Website 1: http://www.github.com/DennisFGardner 
% Website 2: http://www.linkedin.com/in/dennisfgardner
% File Creation: Oct. 3rd, 2016

%------------- BEGIN CODE --------------


% sorts the values of the image in the same order as rho
zMean = I(ind);


%------------- END OF CODE --------------
end

