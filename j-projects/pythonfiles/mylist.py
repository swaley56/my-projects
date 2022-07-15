from tkinter.ttk import Style


myclothes = {
    "style" : "Hoodies", 
    "color" : 'Beige',
    "size" : "S",
    "Model" : 2020
}

#print(myclothes)

myfoot = dict(brand ="Nike", style = "Hightops")

print(myfoot)

print(len(myclothes))
myclothes["Model"] = 2022
print(myclothes)

#print(myclothes.get("size"))

myclothes.update({"color" : "brown"})
#print(myclothes)


#c = myclothes.keys()

#print(c)

#myclothes.pop("color")
#myclothes.clear()
del myclothes
print(myclothes)