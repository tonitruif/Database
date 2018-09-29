
import pandas as pd


def get():
    #data = pd.read_csv('lines1.csv', error_bad_lines=False)
    Lines = pd.read_csv('lines.csv')
    Stations = pd.read_csv('stations.csv')
    Exits = pd.read_csv('exits.csv', sep = ';')
    print(Exits)
    print(Stations)
    print(Lines)

if __name__ == "__main__":
    get()

