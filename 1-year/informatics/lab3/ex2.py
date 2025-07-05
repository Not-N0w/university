import re

def find_combinations(input):
    first_word = r"\S*[aаиеёоуыэюяaeiou]{2}\S*\s"
    second_word = r"(?:\b(?:(?:[aаиеёоуыэюяaeiou]*[^aаиеёоуыэюяaeiou\s]){1,3}[aаиеёоуыэюяaeiou]*\b)|\b[aаиеёоуыэюяaeiou]+\b)"
    pattern= first_word + second_word
    result = re.findall(pattern, input, flags=re.I)
    return result


input_string = str(input())
combinations = find_combinations(input_string)

result = []
for combination in combinations:
    result.append(combination.split()[0])

if len(result) != 0:
    print("Ответ: ", *result)
else:
    print("Ничего не найдено")









# Кривошеее существо гуляет по парку

# \S*[aаиеёоуыэюяaeiou]{2}}\S*\s(?:(?:([aаиеёоуыэюяaeiou]*[^aаиеёоуыэюяaeiou\s]){3}[aаиеёоуыэюяaeiou]*\b)|(?:[aаиеёоуыэюяaeiou]*[^aаиеёоуыэюяaeiou][aаиеёоуыэюяaeiou]*[^aаиеёоуыэюяaeiou\s][aаиеёоуыэюяaeiou]*\b)|(?:[aаиеёоуыэюяaeiou]*[^aаиеёоуыэюяaeiou\s][aаиеёоуыэюяaeiou]*\b)|(?:[aаиеёоуыэюяaeiou]+\b))

