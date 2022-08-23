def total_numbers(a=9, *numbers, **phonebook):
    print("My fav is number is ", a)

    for  num in numbers:
        print("num is", num)

    for name,phone_number in phonebook.items():
        print(name,phone_number)

total_numbers(9,3,4,5,6,Foti=3333, Sohn=5555, Valdes=88888)
