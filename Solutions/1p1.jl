# Read input from file
function read_input(file_path::String)
    return readlines(file_path)
end

# Example usage
input_file = "../Inputs/1.txt" # Adjust the path to your input file
lines = read_input(input_file)

total = 0

for line in lines
    global total

    # Remove non-numeric characters
    line = replace(line, r"[^0-9]" => "")

    # Concatenate the first and last characters as strings
    first_last = string(line[1], line[end])
    # Convert to integer
    num = parse(Int, first_last)
    # Add to total
    total += num

end

println("Solution: ", total)