def caesar_cipher(string,shift)
    result = ""
    string.each_char do |char|
        case_offset = char.ord < 91 ? 65 : 97
        if char.ord.between?(65,90) || char.ord.between?(97,122)
            new_char = (((char.ord - case_offset) + shift) % 26) + case_offset
            result += new_char.chr
        else
            result += char
        end
    end
    result
end

if __FILE__ == $0
    enc = caesar_cipher("Testing the Caesar Cipher algorithm!", 13)
    dec = caesar_cipher(enc, -13)
    puts enc
    puts dec
end