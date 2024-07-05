import sys


def main():
    with open(sys.argv[2]) as file:
        file_contents = file.read()

    if file_contents:
        raise NotImplementedError("Scanner not implemented")
    else:
        # Placeholder, remove this line when implementing the scanner
        print("EOF  null")


if __name__ == "__main__":
    main()
