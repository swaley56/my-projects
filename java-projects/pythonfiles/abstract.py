from abc import ABC, abstractclassmethod


class Shape(ABC):
    @abstractclassmethod
    def area(self) :
        pass
    @abstractclassmethod
    def perimeter(self) :
        pass


class Square (Shape):
        def __init__(self,side):
            self.__side = side

        def area(self):
            return self.__side * self.__side

        def perimeter(self):
            return 4 * self.__side

mysquare = Square(8)

print(mysquare.area())


print(mysquare.perimeter())