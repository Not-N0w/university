import re

def f(x):
    return str(4*(x**2) - 7)

def encrypt_string(input):
    result = ""
    while(re.search(r"\-?\d+", input)):
        found = re.search(r"\-?\d+", input)
        result += input[:found.start()] + f(int(found[0]))
        input = input[found.end():]

    return result


input_string = str(input())
result = encrypt_string(input_string)
print("Ответ: ", result)













# 1.	12 + 12ans – 124 oqwe = 0120– ответ: 569 + 569ans – 61497 oqwe = 57593
# 2.	dnio124nkdsf4pn5i67ni4o3-0sd32ml[sd234owe – ответ:  dnio61497nkdsf57pn93i17949ni57o29--7sd4089ml[sd219017owe
# 3.	as 2 gf3 2asd 1 3df 4 9 1dda – ответ: as 9 gf29 9asd -3 29df 57 317 -3dda
# 4.	iop12dsaop2e 1=1-2 142  s49mksda – ответ: iop569dsaop9e -3=-39 80649  s9597mksda
# 5.	q1xcv23sdf456eqw7qew89weq0 jo0123 pqw[=32]64 12 – ответ: q-3xcv2109sdf831737eqw189qew31677weq-7 jo60509 pqw[=4089]16377 569

# 12 + 20 = 24