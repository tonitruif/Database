import pandas
import random


def get():
    global lines, stations, exits

    # data = pd.read_csv('lines1.csv', error_bad_lines=False)
    lines = pandas.read_csv('lines.csv')
    stations = pandas.read_csv('stations.csv')
    exits = pandas.read_csv('exits.csv', sep=';')


if __name__ == "__main__":
    get()
    df = pandas.read_csv('lines.csv', sep=';')
    trains = ['Русич', 'Москва', 'Ока']

    array_trains = []
    array_vagons = []
    array_passangers = []
    d_index = []
    for i in range(len(df['Line'])):
        array_trains.append(random.choice(trains))
        d_index.append(i+1)
        array_vagons.append(random.randint(1, 10))
        array_passangers.append(random.randint(1, 1000))
    d = {'Trains': array_trains}
    df1 = pandas.DataFrame(data=d, index=d_index)

    d2 = {'LineID': d_index, 'Line': df['Line'], 'Vagons': array_vagons, 'Passangers': array_passangers}
    df2 = pandas.DataFrame(data=d2)
    print(df2)
    #df = pandas.merge(df1, df2, left_index=True, right_index=True)
    #df['Date'] = df['Date'].apply(lambda x: int(str(x)[-4:]))
    df2.to_csv('out.csv', sep=';', index= False)