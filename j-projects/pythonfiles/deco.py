


def m_decorator(function):
    def wrapper():
        myfunct = function()
        convert_uppercase = myfunct.upper()
        return convert_uppercase
    return wrapper
@m_decorator
def say_hello() :
    return "whatsup dawg"
#decorate = m_decorator(say_hello)

print(say_hello())