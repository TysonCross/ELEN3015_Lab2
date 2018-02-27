function [ outKey_l, outKey_r ] = split(inKey)
% split() splits an input vector in half, into two seperate vectors

if mod(length(inKey),2)
    error('Block length must be even')
else len = length(inKey)/2;
end

outKey_l = inKey(1:len);
outKey_r = inKey(len+1:end);
end
