# time converter

def convert_minutes(minutes):
    hours = minutes // 60
    mins = minutes % 60
    
    if hours == 0:
        return f"{mins} minutes"
    elif mins == 0:
        return f"{hours} hrs"
    else:
        return f"{hours} hrs {mins} minutes"


# Main Program with Input
print("Time Converter")
try:
    total_minutes = int(input("Enter total minutes: "))
    
    if total_minutes < 0:
        print("Please enter a positive number!")
    else:
        result = convert_minutes(total_minutes)
        print("Converted Time:", result)
        
except ValueError:
    print("Error: Please enter a valid number!")