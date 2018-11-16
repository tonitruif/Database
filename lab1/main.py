import pandas
import random


def get():
    global lines, stations, exits

    # data = pd.read_csv('lines1.csv', error_bad_lines=False)
    lines = pandas.read_csv('lines.csv')
    stations = pandas.read_csv('stations.csv')



if __name__ == "__main__":
    '''
    get()
    df = pandas.read_csv('lines.csv', sep=';')
    array_trains = []
    array_vagons = []
    array_passangers = []
    array_stations = []
    array_lines = []
    for i in range(len(df['Line'])):
        array_lines.append(random.randint(1, 18))
        array_vagons.append(random.randint(1, 10))
        array_passangers.append(random.randint(1, 1000))
        array_stations.append(random.randint(1, ))


   #d = {'Trains': array_trains}
    #df1 = pandas.DataFrame(data=d, index=d_index)

    d2 = {'LineID': d_index, 'Vagons': array_vagons, 'Passangers': array_passangers}
    df2 = pandas.DataFrame(data=d2)
    print(df2)
    #df = pandas.merge(df1, df2, left_index=True, right_index=True)
    #df['Date'] = df['Date'].apply(lambda x: int(str(x)[-4:]))
    df2.to_csv('Linker.csv', sep=';', index= False)
    '''
    df = pandas.read_csv('stations.csv', sep = ';')
    for i in range(len(df['Station'])):
        for j in range(len(df['Station'])):
            if df['Station'][i] == df['Station'][j]:
                df.drop([j], axis=0, inplace=True)
    df.to_csv('out.csv', sep =';', index = False)

