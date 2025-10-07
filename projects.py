print("PROJECT : FUNDAMENTAL BOOSTER")
print("Welcome to the Interactive Personal Data Collector!")
print("Please provide the following information:")

# input user details
name = input("Enter your name: ")
age = input("Enter your age: ")
height = input("Enter your height: ")
contact = input("Enter your contact: ")

print("Thank you! I've collected your information.")

print("name:", name)
print("age:", age)
print("height:", height)
print("contact:", contact)

# print("--- Processing your data ---")
name = "payal pipaliya"
age = 21
height = 165.5
contact = 9998887777

# Calculate birth year from age.
current_year = 2025
age = int(input("Enter your age: "))
birth_year = current_year - age
print(f"Your birth year is: {birth_year}")

#type casting converting types from int to float and float to int.

age_float = float(age)
print("age:",age)
print(type(age))

height= int(height)
print("height:",height)
print(type(height))

# Print memory locations

print("name:",id(age))
print("age:",id(age))
print("height:",id(height))
print("contact:",id(contact))


print("Thanks for using personal data collector.Goodbye!")


