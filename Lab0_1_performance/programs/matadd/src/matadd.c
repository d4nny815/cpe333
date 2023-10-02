
void main() {
	int M = 10, N = 5;
	int matrix1[M][N], matrix2[M][N];

	//make matrices
	for (int i=0; i<M; i++) {
		for (int j=0; j<N; j++) {
			matrix1[i][j] = i + j;
			matrix2[i][j] = i + j;
		}
	}

	int result_matrix[M][N];
	for (int i=0; i<M; i++) {
		for (int j=0; j<N; j++) {
			result_matrix[i][j] = matrix1[i][j] + matrix2[i][j];
		}
	}
	return;
}
