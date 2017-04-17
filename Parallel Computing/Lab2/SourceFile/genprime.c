#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

void nonPrimeTakeout(int size, int thread_count, int *prime) {
    int i,k;
    
    #pragma omp parallel for num_threads(thread_count)\
    private(k)
    for(i = 2; i < (size+1)/2; i++) {
        /*mark the non-primes with 1*/
        if(prime[i] == 0) {
            for(k = i+i; k < size; k += i) {
                prime[k] = 1;
            }
        }
    }
}

void disPlayAnswer(int *prime, int size) {
    
    FILE *f = fopen("N.txt", "w");
    
    if (f == NULL){
        printf("Error opening file\n");
    }
    
    int curindex = 1;
    int prevPrime = 2;
    
    int i;
    for(i = 2; i < size; i++) {
        if(prime[i] == 0){
            fprintf(f,"%d, %d, %d\n", curindex, i, i - prevPrime);
            curindex ++;
            prevPrime = i;
        }
    }
    
    fclose(f);
    
}


int main(int argc, char *argv[]) {
    
    int *primeArr;
    int size;
    double tstart = 0.0;
    double tend = 0.0;
    double ttaken = 0.0;
    
    int thread_count = 0;
    
    if(argc != 3) {
        printf("Incorrect Arguments, Enter Again!");
        exit(-1);
    }
    
    size = 1 + atol(argv[1]);
    thread_count = atoi(argv[2]);
    
    /*Initializing to 0s using index to determine Primes and NonPrimes*/
    primeArr = (int *) malloc(size*sizeof(int));
    int i;
    for (i = 0; i < size; i++){
        primeArr[i] = 0;
    }
    
    /*Timer Start*/
    tstart = omp_get_wtime();
    nonPrimeTakeout(size, thread_count,primeArr);
    tend = omp_get_wtime();
    /* Timer Ends*/
    
    ttaken = tend - tstart;
    
    printf("Time taken for the main part: %lf\n", ttaken);
    
    disPlayAnswer(primeArr, size);
    free(primeArr);
    
    return 0;
}
