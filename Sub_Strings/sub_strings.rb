def substrings(str, dict)
    result = Hash.new(0)
    dict.each do |word|
        if str.downcase.include?(word)
            result[word] = str.downcase.scan(word).count
        end
    end
    result
end

if __FILE__ == $0
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    p substrings("below", dictionary)
    p substrings("Howdy partner, sit down! How's it going?", dictionary)
end