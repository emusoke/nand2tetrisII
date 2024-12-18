import sys


if __name__ == "__main__":
    file = sys.argv[1]

    # check if file with .asm extension exists
    if file[-4:] == ".asm":
        print("asm file found")

    else:
        print("assume a folder is given")
