function [ output ] = addParityBits( bin_array )
% addParityBits counts and adds parity bits to a 56-bit key, producing a 64-bit key

if length(bin_array)~=56
    error('Please provide a 56-bit key')
end

bin_matrix = reshape(bin_array,[7,8])';
bin_matrix = [bin_matrix zeros(8,1)];

for i=1:8
    sum=0;
    for j=1:7
        sum = sum + bin_matrix(i,j);
    end
    bin_matrix(i,8)= 1-mod(sum, 2);
end

output = reshape(bin_matrix,1,64);

end
