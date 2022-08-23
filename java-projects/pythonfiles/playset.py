brands = {"Nike","Adidas","Reebok","Puma"}
cars = {"BMW","Buick", "Cadillac","Range"}

brands.add("Fila")
print(brands)
cars.update(["Apple","Tesla"])

print(cars)

brands.remove("Puma")
print(brands)

#cars.clear("Buick","Range")
print(cars)

cars.clear()
print(cars)

#del brands
print(brands)