import sys


def main():
    print("Logs from your program will appear here!", file=sys.stderr)

    with open(sys.argv[1]) as file:
        file_contents = file.read()

    if file_contents:
        raise NotImplementedError("Scanner not implemented")
    else:
        print(
            "EOF  NULL"
        )  # Placeholder, remove this line when implementing the scanner


if __name__ == "__main__":
    main()
