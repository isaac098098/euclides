#include <stdio.h>

int gcd(int a, int b)
{
    if (a == 0)
        return b;
    return gcd(b % a, a);
}

int phi(int n)
{
    unsigned int result = 1;
    for (int i = 2; i < n; i++)
        if (gcd(i, n) == 1)
            result++;
    return result;
}

int main() {
    FILE* plot=fopen("phi.csv", "w");
    for(int j=1; j <= 1e3; j++)
        fprintf(plot, "%d, %d\n", j, phi(j));
    fclose(plot);
    return 0;
}

