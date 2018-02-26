function [ key_56 ] = transformKey( key)
% generateKey generates a 56-bit key for ease of testing

% key = 6744155797363555139;
key_64 = dec2bin(uint64(key))- '0';

% Reduce 64-bit to 56-bit (remove every 8th bit)
key_56=zeros(1,56);
offset = 0;
j=1;
for i=1:length(key)
    if mod(i,8)~=0
        key_56(1,j) = key_64(i);
        j = j+1;
    end
end

end
