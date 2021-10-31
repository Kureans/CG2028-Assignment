#include "stdio.h"
#define k 1


// CG2028 Assignment, Sem 1, AY 2021/22
// (c) CG2028 Teaching Team, ECE NUS, 2021

extern int classification(int N, int* points, int* label, int* sample); // asm implementation
int classification_c(int N, int* points, int* label, int* sample); // reference C implementation

int main(void)
{
	//variables
	int N = 8;
	// think of the values below as numbers of the form x.y
	// (decimal fixed point with 1 fractional decimal digits precision)
	// which are scaled up to allow them to be used integers

	int points[16] = {35, 0, 10, 0, 12, 15, 20, 20, 40, 0, -10, 20, -5, -5, 0, 0};
	int label[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	int sample[2] = {15, 20};

	// Call assembly language function to perform classification
	printf( "asm: class = %d \n", classification(N, points, label, sample) ) ;
	printf( "C  : class = %d \n", classification_c(N, points, label, sample) ) ;

	while (1); //halt
}

int classification_c(int N, int* points, int* label, int* sample)
{ 	// The implementation below is meant only for verifying your results.
	
	int i,j,n;
	int class;// returned labels of k=1 nearest neighbors
	int d[N]; // squared Euclidean distance
	int d1, d2;

	
	// calculate the squared distance between test sample and each training data points
	for (i=0; i<N; i++){
		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
		+ (points[2*i+1]-sample[1])*(points[2*i+1]-sample[1]);
	}

	// print all distances
	for (i=0; i<N; i++){
		printf( "d%d = %d, class = %d \n",i+1, d[i],label[i]) ;
	}

	// find the k=1 nearest neighbors

	for (j=0; j<N; j++){
		d1 = d[j];
		for (n=0; n<N; n++){
			d2 = d[n];
			if (d1<d2 && d1>=0 && d2>=0){
				class = label[j];
			}
			else if (d1>=0 && d2>=0){
				class = label[n];
			}
		}
	}
	
	return class;
}

