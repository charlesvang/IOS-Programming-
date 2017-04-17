


#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>



void nonPrimeTakeout(int *prime, int size, int thread_count) {
    
    int i, j;
    #pragma omp parallel for num_threads(thread_count) \
    private(j)
    
    for(i = 2; i < size; i++) {
        /* take out the primes*/
        if(prime[i] == 0) {
            for(j = i+i; j < size; j += i) {
                prime[j] = 1;
            }
        }
    }
}

void disPlayAnswer(int *prime, int size) {
    
    FILE *f = fopen("N.txt", "w");
    if (f == NULL){
        printf("Error opening file\n");
    }
    
    printf("Prime numbers are  %d:\n", size-1);
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
    float tstart = 0.0;
    float ttaken = 0.0;

    int thread_count = 0;
    
    if(argc != 3) {
        printf("Incorrect Arguments, Enter Again!");
        exit(-1);
    }
    
    size = 1 + atol(argv[1]);
    thread_count = atoi(argv[2]);
    
    primeArr = (int *) calloc(size, sizeof(int));
    
    /*Timer Start*/
    tstart = omp_get_wtime();
    nonPrimeTakeout(primeArr, size, thread_count);
    ttaken = omp_get_wtime() - tstart;
    /* Timer Ends*/
    
    printf("Time taken for the main part: %f\n", ttaken);
    
    disPlayAnswer(primeArr, size);
    free(primeArr);
    
    return 0;
}
