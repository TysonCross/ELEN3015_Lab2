function [ outStr ] = num2string( inNum )
% num2string converts a number into a concatenated string without spaces

outStr = num2str(inNum);
outStr(isspace(outStr)) = '';

end

