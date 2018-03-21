function [ outKey ] = generateSubKey( inKey, i )
% generateSubKey() produces a DES-compliant 48-bit key from an input 56-bit key
% for a specific round number

if i>16 || i<1
    error('Round number not in valid range [1-16]')
end

if length(inKey)~=56
    error('Please provide a 56-bit key')
end

% Take the 56-bit key, split into 2 subkeys
% Each subkey half undergoes 16 rounds of subkey generation:
%    a) bitshift each half by (1 or 2) bits, on a fixed schedule
%    b) combine halves, compress down to a 48-bit key which is stored.

[keyL, keyR] =  splitter(inKey);                           
for round_no=1:i
keyL = shiftKey(keyL,round_no);                            
keyR = shiftKey(keyR,round_no);
end

outKey = permuter([keyL keyR],'compression'); 

end
