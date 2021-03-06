def bubble_sort(list)
    n = list.length
    not_sorted = true
    while not_sorted do
        not_sorted = false
        list.each_with_index do |x,i|
            next if i == 0
            break if i > n
            if x < list[i-1]
                not_sorted = true
                list[i-1], list[i] = x, list[i-1]
            end
        end
        n -= 1
    end
    list
end

if __FILE__ == $0
    p bubble_sort([5,3,1,2,2,9,6,7,8,2,4])
end