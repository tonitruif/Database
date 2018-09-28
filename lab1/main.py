
import pandas


def get():
    #data = pandas.read_csv('lines1.csv', error_bad_lines=False)
    Lines = pandas.read_csv('lines.csv')

    print(Lines)

if __name__ == "__main__":
    get()

