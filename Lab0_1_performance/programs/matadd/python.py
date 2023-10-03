import random

# Define the dimensions of the matrix
# M = int(input("Enter the number of rows (M): "))
# N = int(input("Enter the number of columns (N): "))
M = 50
N = 50

# Generate a random MxN matrix
matrix = [[random.randint(1, 100) for _ in range(N)] for _ in range(M)]

# Print the matrix in C program input format
print("Matrix in C program input format:")
print("{")
for i in range(M):
    print("    {", end='')
    for j in range(N):
        print(f"{matrix[i][j]}", end='')
        if j < N - 1:
            print(", ", end='')
    print("}", end='')
    if i < M - 1:
        print(",")
    else:
        print()
print("};")
