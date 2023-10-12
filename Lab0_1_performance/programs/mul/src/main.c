int func(int a, int b) {
	int product = 0;
	if (a < b) {
		for (int i=0; i<a; i++) {
			product += b;
		}
	}
	else {
		for (int i=0; i<b; i++) {
			product += a;
		}
	}
	return product;
}

void main()
{
	int result = func(10, 2);
	return;
}