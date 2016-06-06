def bubble_sort(input)
    output = []

    while input.length > 0
        input.each_with_index do |item, index|
            if index == input.length - 1
                break
            end
            
            item_1 = item
            item_2 = input[index + 1]

            if (item_1 <=> item_2) == 1
                input[index + 1] = item
                input[index] = item_2
            end
        end

        output.unshift(input.pop)
    end

    output
end

def bubble_sort_by(input)
    output = []

    while input.length > 0
        input.each_with_index do |item, index|
            if index == input.length - 1
                break
            end

            item_1 = item
            item_2 = input[index + 1]

            result = yield(item_1, item_2)

            if result > 0
                input[index + 1] = item
                input[index] = item_2
            end
        end

        output.unshift(input.pop)
    end

    output
end