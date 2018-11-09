import pandas
import random

trains = ['Русич', 'Москва', 'Ока', 'Ласточка']
arrtrain = []
arrtrain.append(random.choice(trains))
LineID = [x for x in range(1,18)]
print(LineID)
BuildDate = []
BuildDate.append(random.randint(1960,2010))
MaxPassengers = []
MaxPassengers.append(random.randint(1000,1200))
MaxVagons = []
MaxVagons.append(random.randint(10,12))
for i in range(16):
    arrtrain.append(random.choice(trains))
    BuildDate.append(random.randint(1960, 2010))
    MaxPassengers.append(random.randint(1000, 1200))
    MaxVagons.append(random.randint(10, 12))
print(len(LineID), len(arrtrain))
raw_data = {'LineID':LineID, 'Train': arrtrain, 'BuildDate': BuildDate,
            'MaxPassengers': MaxPassengers, 'MaxVagon': MaxVagons}
df = pandas.DataFrame(data=raw_data)
df.to_csv('Train.csv', sep = ';', index = False)