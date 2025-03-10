import os
import re

# Define the root directory and output file
src_folder = 'src'
output_file = 'asm_files.txt'

# Open the output file in write mode
with open(output_file, 'w') as f:
    iterate_count = 1  # Start counting from 1

    # Recursively loop over files in the src folder
    for root, dirs, files in os.walk(src_folder):
        for file in files:
            if file.endswith('.asm'):
                # Get the full file path
                file_path = os.path.join(root, file)
                
                # Open the .asm file to read its content
                with open(file_path, 'r') as asm_file:
                    # Search for a line containing "To be inserted at" followed by an address
                    for line in asm_file:
                        match = re.search(r'#To be inserted at (\w+)', line)
                        if match:
                            # Extract the address from the match group
                            address = match.group(1)
                            break  # Stop searching once the first match is found

                # Write the formatted line with the extracted or default address
                f.write(f'compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "{file_path}" && python "compiler/gecko.py" a.out {address} tmp/{iterate_count}.txt1\n')
                iterate_count += 1  # Increment the count

print(f"All .asm file paths have been written to {output_file}")