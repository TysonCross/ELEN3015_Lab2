clc 
clear all

key1 = '1F1F1F1F0E0E0E0E';
key2 = '1FFE1FFE0EFE0EFE';
key3 = '1FFEFE1F0EFEFE0E';

key_string1 = permuteKey(key1);
key_string2 = permuteKey(key2);
key_string3 = permuteKey(key3);

for round_no=1:16
    key_schedule1(round_no,:) = generateSubKey(key_string1,round_no);
    key_schedule2(round_no,:) = generateSubKey(key_string2,round_no);
    key_schedule3(round_no,:) = generateSubKey(key_string3,round_no);

end

[count1, classification1] = analyseSubKeys(key_schedule1);
[count2, classification2] =  analyseSubKeys(key_schedule2);
[count3, classification3] =  analyseSubKeys(key_schedule3);

% output
disp(['Key ', key1, ' has ', num2str(count1), ' unique subkey(s). It is a ', classification1, ' key'])
disp(['Key ', key2, ' has ', num2str(count2), ' unique subkey(s). It is a ', classification2, ' key'])
disp(['Key ', key3, ' has ', num2str(count3), ' unique subkey(s). It is a ', classification3, ' key'])


