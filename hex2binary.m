function [ binary_array ] = hex2binary( hex_string )
% hex2binary converts a hexidecimal number to a binary array

hex = upper(hex_string);

for i=1:length(hex)
    if hex(i)=='F'
        binary_array((i*4)-3:i*4)=[1 1 1 1];
    elseif hex(i)=='E'
        binary_array((i*4)-3:i*4)=[1 1 1 0];
    elseif hex(i)=='D'
        binary_array((i*4)-3:i*4)=[1 1 0 1];
    elseif hex(i)=='C'
        binary_array((i*4)-3:i*4)=[1 1 0 0];
    elseif hex(i)=='B'
        binary_array((i*4)-3:i*4)=[1 0 1 1];
    elseif hex(i)=='A'
        binary_array((i*4)-3:i*4)=[1 0 1 0];
    elseif hex(i)=='9'
        binary_array((i*4)-3:i*4)=[1 0 0 1];
    elseif hex(i)=='8'
        binary_array((i*4)-3:i*4)=[1 0 0 0];
    elseif hex(i)=='7'
        binary_array((i*4)-3:i*4)=[0 1 1 1];
    elseif hex(i)=='6'
        binary_array((i*4)-3:i*4)=[0 1 1 0];
    elseif hex(i)=='5'
        binary_array((i*4)-3:i*4)=[0 1 0 1];
    elseif hex(i)=='4'
        binary_array((i*4)-3:i*4)=[0 1 0 0];
    elseif hex(i)=='3'
        binary_array((i*4)-3:i*4)=[0 0 1 1];
    elseif hex(i)=='2'
        binary_array((i*4)-3:i*4)=[0 0 1 0];
    elseif hex(i)=='1'
        binary_array((i*4)-3:i*4)=[0 0 0 1];
    elseif hex(i)=='0'
        binary_array((i*4)-3:i*4)=[0 0 0 0];
    end
end 

end