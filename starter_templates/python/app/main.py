import sys


def main():
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    # But make sure to write the output to stderr.
    print("Logs from your program will appear here!", file=sys.stderr)

    with open(sys.argv[2]) as file:
        file_contents = file.read()

    # Uncomment this block to pass the first stage
    # if file_contents:
    #     raise NotImplementedError("Scanner not implemented")
    # else:
    #     print(
    #         "EOF  NULL"
    #     )  # Placeholder, remove this line when implementing the scanner


if __name__ == "__main__":
    main()
