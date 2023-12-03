using HTTP
using Gumbo
using Cascadia

function get_advent_of_code_challenge(day::Int)
    url = "https://adventofcode.com/2023/day/$day/input" # Change the year accordingly
    headers = Dict("Cookie" => "session=53616c7465645f5f4cfe777bf5ba5d368ffbfb25b4bee2df1cad21f7cfdf695e54b3d05808a81768025719d6604fdef3a66fa6a250dc44ef60e208397077628f")

    # Sending a GET request to the Advent of Code page for the given day
    response = HTTP.get(url, headers=headers)

    # Parsing the HTML content
    parsed_page = parsehtml(String(response.body))

    # Extracting the body content
    body_content = Gumbo.text(parsed_page.root[2])

    return body_content
end

function save_challenge_to_file(day::Int, text::String)
    # Ensure the directory exists
    dir = "Inputs"
    isdir(dir) || mkdir(dir)

    # Writing to a file
    filename = joinpath(dir, "$day.txt")
    open(filename, "w") do file
        write(file, text)
    end
end

# Scrape
day = 1 # Change this to the current day
challenge_text = String(get_advent_of_code_challenge(day))
save_challenge_to_file(day, challenge_text)