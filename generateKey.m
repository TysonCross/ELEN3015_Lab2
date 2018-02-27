function [ outKey ] = generateKey(inKey)
% generateKey() produces a DES-compliant 48-bit key from an input 64-bit key

inKey = permuteKey(inKey, 'parity');                    % Take the 65-bit key, drops every 8th bit
[inKey_l, inKey_r] =  split(inKey);                     % splits the new 56-bit key into two subkeys.
inKey_l = shiftKey(inKey_l);                            % halves are each shifted by fixed 16-round schedule
inKey_r = shiftKey(inKey_r);
outKey = permuteKey([inKey_l inKey_r],'compression');   % combined and permuted/compressed down to a 48-bit key

end
