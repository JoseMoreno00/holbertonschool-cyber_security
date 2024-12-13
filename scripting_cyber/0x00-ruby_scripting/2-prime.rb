def prime(number)
    for num in 2..number
        if number % num == 0
            if num == number
                return true
            else
                return false
            end
        end
    end
end
