function [ output ] = permuteKey( key )
% permuteKey reduces a 64-bit key to a 56-bit key

key_64 = hex2binary(key);
key_56 = permuter(key_64, 'parity');
output = binary2hex(key_56);

end
