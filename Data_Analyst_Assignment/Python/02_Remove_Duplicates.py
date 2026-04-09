# to remove the duplicate values in the string

def remove_duplicates(text):
    result = ""
    duplicates = ""
    
    for char in text:
        if char not in duplicates:
            result = result + char
            duplicates = duplicates + char
    return result


# Main Program with Input
print("Remove Duplicate Characters")
user_input = input("Enter any string: ")

if user_input.strip() == "":
    print("Error: Please enter some text!")
else:
    result = remove_duplicates(user_input)
    print("Original String :", user_input)
    print("After Removing Duplicates :", result)