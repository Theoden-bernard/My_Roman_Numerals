def n_fois_10(num)

    index = -1;

    while(num != 0)

        num /= 10;

        index += 1;
    end

    return index;
end

def my_roman_numerals_converter(decimal_num)

    if (decimal_num == 0)
        
        return 0;
    end
    
    num_romain_principal = {

        1000 => "M",
        500 => "D",
        100 => "C",
        50 => "L",
        10 => "X",
        5 => "V",
        1 => "I"
    }
    
    num_romain_second = {

        900 => "CM",
        400 => "CD",
        90 => "XC",
        40 => "XL",
        9 => "IX",
        4 => "IV"
    }
    

    if (num_romain_principal.select {|keys| keys == decimal_num}.length > 0)
        return num_romain_principal[decimal_num];
    end

    if (num_romain_second.select {|keys| keys == decimal_num}.length > 0)
        return num_romain_second[decimal_num];
    end

    result_romain = "";
    num = 0;

    if(decimal_num > 10)
        
        n_10 = n_fois_10(decimal_num);
        save_num = decimal_num;
        
        while (n_10 != -1)
            
            num = 0;

            decimal_num = save_num;
            
            decimal_num /= 10**n_10;

            decimal_num %= 10;

            decimal_num *= 10**n_10;

            array = num_romain_principal.keys.select {|keys| keys <= decimal_num}

            truc = 0;
            index = 0;
            add = 0;
            
            while (num != decimal_num && truc < 5)
                
                save_add = add;
                add = 0;
                
                if (num_romain_second.select {|keys| keys == decimal_num}.length > 0)
                
                    result_romain << num_romain_second[decimal_num];
                    break;
                
                else 
                
                    if (save_add + array[index] <= decimal_num)
                        
                        add += array[index];
                        result_romain << num_romain_principal[array[index]];
                    
                    else
                        
                        index += 1;
                        
                    end

                end
                
                num += add;
                truc += 1;
                
            end
            
            n_10 -= 1;
        end
    
    else

        array = num_romain_principal.keys.select {|keys| keys < decimal_num}

        add = 0;
        while (num != decimal_num)
            
            index = 0;

            while (index < array.length)
                
                # puts "array #{array[index]}";
                # puts "add + array[index] = #{add + array[index]}";

                if (add + array[index] <= decimal_num)
                    add += array[index];
                    result_romain << num_romain_principal[array[index]];
                end

                index += 1;

            end
                        
            num += 1;

        end

    end

    return result_romain;
end

# puts my_roman_numerals_converter(200);