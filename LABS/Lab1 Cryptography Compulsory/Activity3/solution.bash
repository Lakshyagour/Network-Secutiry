
#!/bin/bash

folder_path="privateKeys/"  # Replace with your folder's path
VerifiedFile=""
for file in "$folder_path"/*; do
    if [ -f "$file" ]; then
        # Replace this with your desired processing logic
        echo "Processing file: $file"
        status = $(echo "Verified" | openssl pkeyutl -encrypt -pubin -inkey public.key | openssl pkeyutl -decrypt -inkey $file)
        if [ "$status" == "Verified" ]; then
            VerifiedFile=$file
        fi
        echo ""
    fi
done

echo "Processed file: $folder_path/$VerifiedFile"
echo "Verified"

python3 rsa-utility.py $folder_path/private3.key