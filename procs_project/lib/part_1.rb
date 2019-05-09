def my_map(arr, &prc)
    mapped_array = []
    arr.each do |item|
        mapped_array << prc.call(item)
    end
    mapped_array
end


def my_select(arr, &prc)
    selected_array = []
    arr.each do |item|
        if prc.call(item) == true
            selected_array << item
        end
    end
    selected_array
end

def my_count(arr, &prc)
    count = 0
    arr.each do |item|
        if prc.call(item) == true
            count += 1
        end
    end
    count
end


def my_any?(arr, &prc)
    arr.each do |item|
        if prc.call(item)
            return true
        end
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |item|
        if !prc.call(item)
            return false
        end
    end
    true
end


def my_none?(arr, &prc)
    arr.each do |item|
        if prc.call(item)
            return false 
        end
    end
    true
end