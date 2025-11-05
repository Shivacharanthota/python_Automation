import os

directory = r'C:\Users\hp\OneDrive\Desktop\workspace\temp_folder' ## r = raw string

for filename in os.listdir(directory): ## checks in this specifi directory
    if filename.endswith('.txt'): ## checks for file extension
        new_name = filename.replace('old','new') 
        os.rename(os.path.join(directory, filename), os.path.join(directory, new_name)) ## replaces the word old with new in the filename

