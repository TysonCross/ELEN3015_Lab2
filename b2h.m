function hex_val = b2h(bin_val)
switch bin_val
    case {'0', '00', '000', '0000'}
        hex_val = '0';
    case {'1', '01', '001', '0001'}
        hex_val = '1';
    case {'10', '010', '0010'}
        hex_val = '2';
    case {'11', '011', '0011'}
        hex_val = '3';
    case {'100', '0100'}
        hex_val = '4';
    case {'101', '0101'}
        hex_val = '5';
    case {'110', '0110'}
        hex_val = '6';
    case {'111', '0111'}
        hex_val = '7';
    case '1000'
        hex_val = '8';
    case '1001'
        hex_val = '9';
    case '1010'
        hex_val = 'A';
    case '1011'
        hex_val = 'B';
    case '1100'
        hex_val = 'C';
    case '1101'
        hex_val = 'D';
    case '1110'
        hex_val = 'E';
    case '1111'
        hex_val = 'F';
end
