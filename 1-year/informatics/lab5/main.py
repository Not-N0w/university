import pandas as pd
import matplotlib.pyplot as plt

file_path = "ext2.csv"
df = pd.read_excel(file_path, sheet_name=0) 

columns = ["Открытие 17.09.2018", "Макс 17.09.2018", "Мин 17.09.2018", "Закрытие 17.09.2018",
           "Открытие 15.10.2018", "Макс 15.10.2018", "Мин 15.10.2018", "Закрытие 15.10.2018",
           "Открытие 15.11.2018", "Макс 15.11.2018", "Мин 15.11.2018", "Закрытие 15.11.2018",
           "Открытие 17.12.2018", "Макс 17.12.2018", "Мин 17.12.2018", "Закрытие 17.12.2018"]

plt.figure(figsize=(12,7))

df[columns].boxplot()
plt.title("Ящик с усами")
plt.legend(columns, loc='upper right')
plt.xticks(rotation=90)
plt.grid()

plt.savefig("boxplot.png")
plt.show()