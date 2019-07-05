function [ fixp_twos_cmp ] = dec2fix_p(number, num_bits)
  
  binary = dec2bin(round(abs(number)*2**(num_bits-1)), num_bits);
  
  sign = number;
  sign(sign>0) = 0;
  sign(sign<0) = 1;
  sign = dec2bin (sign);

  
  twos_comp = binary;

  for i = 1:length(sign)
    if(sign(i)=='1')
      tmp = twos_comp(i, :);
      tmp = bin2dec( tmp );
      tmp = 2**24 - tmp;
      tmp = dec2bin(tmp, num_bits);
      twos_comp(i, :) = tmp;
    endif
  endfor
  
  fixp_twos_cmp = twos_comp;
  
  
endfunction
