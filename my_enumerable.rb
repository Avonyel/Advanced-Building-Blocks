module Enumerable
    def my_each
        for element in self
            yield(element)
        end
    end

    def my_each_with_index
        index = 0
        for element in self
            yield(element, index)
            index +=1
        end
    end

    def my_select
        output = []
        for element in self
            if yield(element) == true
                output << element
            end
        end

        output
    end

    def my_all?
        output = true

        for element in self
            if yield(element) == false
                output = false
                break
            end
        end

        output
    end

    def my_any?
        output = false

        for element in self
            if yield(element) == true
                output = true
                break
            end
        end

        output
    end

    def my_none?
        output = true

        for element in self
            if yield(element) == true
                output = false
                break
            end
        end

        output
    end

    def my_count(input=nil)
        count = 0

        if block_given?
            for element in self
                if yield(element) == true
                    count += 1
                end
            end
        elsif input
            for element in self
                if element == input
                    count += 1
                end
            end
        else
            count = self.length
        end

        count
    end

    def my_map(proc=nil)
        output = []

        for element in self
            if proc
                output << proc.call(element)
            elsif block_given?
                output << yield(element)
            end
        end

        output
    end

    def my_inject(initial=nil)
        if initial
            output = initial
        else
            output = self[0]
            skip_a_loop = true
        end

        for element in self
            if skip_a_loop
                skip_a_loop = false
                next
            end

            output = yield(output, element)
        end

        output
    end
end

def multiply_els(input)
    output = input.my_inject {|product, number| product *= number}
end