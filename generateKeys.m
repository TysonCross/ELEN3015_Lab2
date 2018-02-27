function [ outKeys ] = generateKeys( inKey )
% generateKey() produces a DES-compliant 48-bit key from an input 64-bit key

% Take the 64-bit key, drops every 8th bit
% Split the new 56-bit key into 2 subkeys
% Each subkey half undergoes 16 rounds of subkey generation:
%    a) bitshift each half by (1 or 2) bits, on a fixed schedule
%    b) combine halves, compress down to a 48-bit key which is stored.

inKey = permuter(inKey, 'parity');                         
[keyL, keyR] =  splitter(inKey);                           
outKeys = zeros(16,48);
for round_no=1:16
keyL = shiftKey(keyL,round_no);                            
keyR = shiftKey(keyR,round_no);
outKeys(round_no,:) = permuter([keyL keyR],'compression'); 
end

end
