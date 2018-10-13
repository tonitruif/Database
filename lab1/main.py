import pandas as pd
import random


def get():
    global lines, stations, exits

    # data = pd.read_csv('lines1.csv', error_bad_lines=False)
    lines = pd.read_csv('lines.csv')
    stations = pd.read_csv('stations.csv')
    exits = pd.read_csv('exits.csv', sep=';')


if __name__ == "__main__":
    get()
    train_table = pd.DataFrame(columns=('id', 'Line', 'Station', 'Train', 'Passengers'))
    Trains = ['Русич', 'Москвич', 'Поезд', 'Яуза', 'Ока']
    concrete_train = random.choice(Trains)
    concrete_passengers = random.randint(1, 1000)
    concrete_lines = []
    print(lines['Line'])
    #concrete_lines.append(x for x in lines['Line'])
    print(concrete_lines)
    #for i in range(17):
    # train_table.append( {'id:i}, {Line: lines.iloc[i]['Line']})
    print(train_table)

    # numberStations = stations['Number'].count()
# print(numberStations)
# for i in range(5):
#  >> > df.loc[i] = [np.random.randint(-1, 1) for n in range(3)]
