function [ hex_string ] = binary2hex( binary_array )
% binary2hex converts a binary array to a hexidecimal

bin_str = num2str(binary_array);
bin_str(isspace(bin_str)) = '';

i = length(bin_str);
n = ceil(i/4); 

for j = n : -1 : 1
    if i > 4
        hex_string(j) = b2h(bin_str(i-3 : i));
        i = i - 4;
    else
        hex_string(j) = b2h(bin_str(1 : i));
    end
end
 
% str_key = num2str(binary_array);
% str_key(isspace(str_key)) = '';
% b2d = @(s)sum(bsxfun(@times,s-'0',pow2(size(s,2)-1:-1:0)),2);
% hex_string = sprintf('%X',b2d(str_key));

end