# Read input from file
function read_input(file_path::String)
    return readlines(file_path)
end

# Example usage
input_file = "../Inputs/1.txt" # Adjust the path to your input file
lines = read_input(input_file)

# Mapping spelled-out digits to numeric digits
digit_map = Dict(
    "one" => "o1e",
    "two" => "t2o",
    "three" => "t3e",
    "four" => "f4r",
    "five" => "f5e",
    "six" => "s6x",
    "seven" => "s7n",
    "eight" => "e8t",
    "nine" => "n9e"
)

# Function to replace spelled-out digits with numeric digits
function replace_spelled_digits(line)
    for (word, digit) in digit_map
        line = replace(line, word => digit)
    end
    return line
end

total = 0

for line in lines
    global total

    # Replace spelled-out digits
    line = replace_spelled_digits(line)

    # Remove non-numeric characters
    line = replace(line, r"[^0-9]" => "")

    # Concatenate the first and last characters as strings
    first_last = string(line[1], line[end])

    # Convert to integer
    num = parse(Int, first_last)
    println(num)

    # Add to total
    total += num
end

println("Solution: ", total)