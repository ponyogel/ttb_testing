# Question 
# Check duplicate items from list A and list B and append to a new list. Using your preferred programming language.
# List A : [1,2,3,5,6,8,9]
# List B : [3,2,1,5,6,0]

def check_duplicate(list_a, list_b):
    new_list = []
    for i in list_a:
        if i in list_b:
            new_list.append(i)
    return new_list

list_a = [1,2,3,5,6,8,9]
list_b = [3,2,1,5,6,0]

print(check_duplicate(list_a, list_b))

# Answer

