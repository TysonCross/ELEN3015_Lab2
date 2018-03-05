function [ hex_string ] = binary2hex( binary_array )
% binary2hex converts a binary array to a hexidecimal
% The bit depth varies with the input value's size/length

bin_str = num2string(binary_array);
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
 
end