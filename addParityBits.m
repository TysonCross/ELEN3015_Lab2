function [ output ] = addParityBits( key_string )
% addParityBits adds paritys bits to a 56-bit key, producing a 64-bit key

if length(hex2binary(key_string))~=56
    error('Please provide a 56-bit key')
end

bin_array = hex2binary(key_string);
bin_matrix = reshape(bin_array,[7,8])';
bin_matrix = [bin_matrix zeros(8,1)];

for i=1:8
    sum=0;
    for j=1:7
        sum = sum + bin_matrix(i,j);
    end
    bin_matrix(i,8)= mod(sum, 2);
end

output = binary2hex(reshape(bin_matrix,1,64));

end
