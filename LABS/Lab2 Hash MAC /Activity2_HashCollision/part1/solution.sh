
# Run md5sum and store the output in a variable
md5_output=$(md5sum permissions.txt)

# Extract the first part of the MD5 hash using cut
md5_hash=$(echo "$md5_output" | cut -d ' ' -f 1)

# Store the extracted MD5 hash in h1.txt
echo "$md5_hash" > h1.txt


# Function to generate permutations of spaces (and not spaces)
generate_permutations() {
    local text="$1"
    local length="${#text}"

    for (( i = 0; i < length; i++ )); do
        if [[ "${text:i:1}" == " " ]]; then
            local modified_text="${text:0:i}${text:i+1}"

            # Print the modified text
            echo "$modified_text" > evil-permission.txt

            # Run md5sum and store the output in a variable
            md5_output=$(md5sum evil-permissions.txt)

            # Extract the first part of the MD5 hash using cut
            md5_hash=$(echo "$md5_output" | cut -d ' ' -f 1)

            # Store the extracted MD5 hash in h1.txt
            echo "$md5_hash" > h2.txt

            # check if the hashes are same or not
            if cmp -s "h1.txt" "h2.txt"; then
                echo "$modified_text" > matchedHashText.txt

            generate_permutations "$modified_text"
        fi
    done
}

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Read the content of the input file
file_content=$(<"$input_file")

# Generate permutations of spaces (and not spaces) in the content
generate_permutations "$file_content"



# reset the files
# bash reset.sh