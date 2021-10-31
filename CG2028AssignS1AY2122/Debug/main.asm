   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC3:
  21 0000 61736D3A 		.ascii	"asm: class = %d \012\000"
  21      20636C61 
  21      7373203D 
  21      20256420 
  21      0A00
  22 0012 0000     		.align	2
  23              	.LC4:
  24 0014 4320203A 		.ascii	"C  : class = %d \012\000"
  24      20636C61 
  24      7373203D 
  24      20256420 
  24      0A00
  25 0026 0000     		.align	2
  26              	.LC0:
  27 0028 23000000 		.word	35
  28 002c 00000000 		.word	0
  29 0030 0A000000 		.word	10
  30 0034 00000000 		.word	0
  31 0038 0C000000 		.word	12
  32 003c 0F000000 		.word	15
  33 0040 14000000 		.word	20
  34 0044 14000000 		.word	20
  35 0048 28000000 		.word	40
  36 004c 00000000 		.word	0
  37 0050 F6FFFFFF 		.word	-10
  38 0054 14000000 		.word	20
  39 0058 FBFFFFFF 		.word	-5
  40 005c FBFFFFFF 		.word	-5
  41 0060 00000000 		.word	0
  42 0064 00000000 		.word	0
  43              		.align	2
  44              	.LC1:
  45 0068 01000000 		.word	1
  46 006c 02000000 		.word	2
  47 0070 03000000 		.word	3
  48 0074 04000000 		.word	4
  49 0078 05000000 		.word	5
  50 007c 06000000 		.word	6
  51 0080 07000000 		.word	7
  52 0084 08000000 		.word	8
  53              		.align	2
  54              	.LC2:
  55 0088 0F000000 		.word	15
  56 008c 14000000 		.word	20
  57              		.section	.text.main,"ax",%progbits
  58              		.align	2
  59              		.global	main
  60              		.thumb
  61              		.thumb_func
  63              	main:
  64              	.LFB0:
  65              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define k 1
   3:../src/main.c **** 
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment, Sem 1, AY 2021/22
   6:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   7:../src/main.c **** 
   8:../src/main.c **** extern int classification(int N, int* points, int* label, int* sample); // asm implementation
   9:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample); // reference C implementation
  10:../src/main.c **** 
  11:../src/main.c **** int main(void)
  12:../src/main.c **** {
  66              		.loc 1 12 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 112
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 B0B5     		push	{r4, r5, r7, lr}
  71              	.LCFI0:
  72              		.cfi_def_cfa_offset 16
  73              		.cfi_offset 14, -4
  74              		.cfi_offset 7, -8
  75              		.cfi_offset 5, -12
  76              		.cfi_offset 4, -16
  77 0002 9CB0     		sub	sp, sp, #112
  78              	.LCFI1:
  79              		.cfi_def_cfa_offset 128
  80 0004 00AF     		add	r7, sp, #0
  81              	.LCFI2:
  82              		.cfi_def_cfa_register 7
  13:../src/main.c **** 	//variables
  14:../src/main.c **** 	int N = 8;
  83              		.loc 1 14 0
  84 0006 4FF00803 		mov	r3, #8
  85 000a FB66     		str	r3, [r7, #108]
  15:../src/main.c **** 	// think of the values below as numbers of the form x.y
  16:../src/main.c **** 	// (decimal fixed point with 1 fractional decimal digits precision)
  17:../src/main.c **** 	// which are scaled up to allow them to be used integers
  18:../src/main.c **** 
  19:../src/main.c **** 	int points[16] = {35, 0, 10, 0, 12, 15, 20, 20, 40, 0, -10, 20, -5, -5, 0, 0};
  86              		.loc 1 19 0
  87 000c 40F20003 		movw	r3, #:lower16:.LC0
  88 0010 C0F20003 		movt	r3, #:upper16:.LC0
  89 0014 07F12C04 		add	r4, r7, #44
  90 0018 1D46     		mov	r5, r3
  91 001a 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  92 001c 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  93 001e 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  94 0020 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  95 0022 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  96 0024 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  97 0026 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
  98 002a 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  20:../src/main.c **** 	int label[8] = {1, 2, 3, 4, 5, 6, 7, 8};
  99              		.loc 1 20 0
 100 002e 40F20003 		movw	r3, #:lower16:.LC1
 101 0032 C0F20003 		movt	r3, #:upper16:.LC1
 102 0036 07F10C04 		add	r4, r7, #12
 103 003a 1D46     		mov	r5, r3
 104 003c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 105 003e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 106 0040 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
 107 0044 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  21:../src/main.c **** 	int sample[2] = {15, 20};
 108              		.loc 1 21 0
 109 0048 40F20003 		movw	r3, #:lower16:.LC2
 110 004c C0F20003 		movt	r3, #:upper16:.LC2
 111 0050 07F10402 		add	r2, r7, #4
 112 0054 93E80300 		ldmia	r3, {r0, r1}
 113 0058 82E80300 		stmia	r2, {r0, r1}
  22:../src/main.c **** 
  23:../src/main.c **** 	// Call assembly language function to perform classification
  24:../src/main.c **** 	printf( "asm: class = %d \n", classification(N, points, label, sample) ) ;
 114              		.loc 1 24 0
 115 005c 40F20004 		movw	r4, #:lower16:.LC3
 116 0060 C0F20004 		movt	r4, #:upper16:.LC3
 117 0064 07F12C01 		add	r1, r7, #44
 118 0068 07F10C02 		add	r2, r7, #12
 119 006c 07F10403 		add	r3, r7, #4
 120 0070 F86E     		ldr	r0, [r7, #108]
 121 0072 FFF7FEFF 		bl	classification
 122 0076 0346     		mov	r3, r0
 123 0078 2046     		mov	r0, r4
 124 007a 1946     		mov	r1, r3
 125 007c FFF7FEFF 		bl	printf
  25:../src/main.c **** 	printf( "C  : class = %d \n", classification_c(N, points, label, sample) ) ;
 126              		.loc 1 25 0
 127 0080 40F20004 		movw	r4, #:lower16:.LC4
 128 0084 C0F20004 		movt	r4, #:upper16:.LC4
 129 0088 07F12C01 		add	r1, r7, #44
 130 008c 07F10C02 		add	r2, r7, #12
 131 0090 07F10403 		add	r3, r7, #4
 132 0094 F86E     		ldr	r0, [r7, #108]
 133 0096 FFF7FEFF 		bl	classification_c
 134 009a 0346     		mov	r3, r0
 135 009c 2046     		mov	r0, r4
 136 009e 1946     		mov	r1, r3
 137 00a0 FFF7FEFF 		bl	printf
 138              	.L2:
  26:../src/main.c **** 
  27:../src/main.c **** 	while (1); //halt
 139              		.loc 1 27 0 discriminator 1
 140 00a4 FEE7     		b	.L2
 141              		.cfi_endproc
 142              	.LFE0:
 144 00a6 00BF     		.section	.rodata
 145              		.align	2
 146              	.LC5:
 147 0090 64256420 		.ascii	"d%d = %d, class = %d \012\000"
 147      3D202564 
 147      2C20636C 
 147      61737320 
 147      3D202564 
 148 00a7 00       		.section	.text.classification_c,"ax",%progbits
 149              		.align	2
 150              		.global	classification_c
 151              		.thumb
 152              		.thumb_func
 154              	classification_c:
 155              	.LFB1:
  28:../src/main.c **** }
  29:../src/main.c **** 
  30:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample)
  31:../src/main.c **** { 	// The implementation below is meant only for verifying your results.
 156              		.loc 1 31 0
 157              		.cfi_startproc
 158              		@ args = 0, pretend = 0, frame = 48
 159              		@ frame_needed = 1, uses_anonymous_args = 0
 160 0000 2DE9F043 		push	{r4, r5, r6, r7, r8, r9, lr}
 161              	.LCFI3:
 162              		.cfi_def_cfa_offset 28
 163              		.cfi_offset 14, -4
 164              		.cfi_offset 9, -8
 165              		.cfi_offset 8, -12
 166              		.cfi_offset 7, -16
 167              		.cfi_offset 6, -20
 168              		.cfi_offset 5, -24
 169              		.cfi_offset 4, -28
 170 0004 8DB0     		sub	sp, sp, #52
 171              	.LCFI4:
 172              		.cfi_def_cfa_offset 80
 173 0006 00AF     		add	r7, sp, #0
 174              	.LCFI5:
 175              		.cfi_def_cfa_register 7
 176 0008 F860     		str	r0, [r7, #12]
 177 000a B960     		str	r1, [r7, #8]
 178 000c 7A60     		str	r2, [r7, #4]
 179 000e 3B60     		str	r3, [r7, #0]
 180              		.loc 1 31 0
 181 0010 6B46     		mov	r3, sp
 182 0012 1E46     		mov	r6, r3
  32:../src/main.c **** 	
  33:../src/main.c **** 	int i,j,n;
  34:../src/main.c **** 	int class;// returned labels of k=1 nearest neighbors
  35:../src/main.c **** 	int d[N]; // squared Euclidean distance
 183              		.loc 1 35 0
 184 0014 F868     		ldr	r0, [r7, #12]
 185 0016 00F1FF33 		add	r3, r0, #-1
 186 001a FB61     		str	r3, [r7, #28]
 187 001c 0146     		mov	r1, r0
 188 001e 0A46     		mov	r2, r1
 189 0020 4FF00003 		mov	r3, #0
 190 0024 4FEAD261 		lsr	r1, r2, #27
 191 0028 4FEA4319 		lsl	r9, r3, #5
 192 002c 41EA0909 		orr	r9, r1, r9
 193 0030 4FEA4218 		lsl	r8, r2, #5
 194 0034 0146     		mov	r1, r0
 195 0036 0A46     		mov	r2, r1
 196 0038 4FF00003 		mov	r3, #0
 197 003c 4FEAD261 		lsr	r1, r2, #27
 198 0040 4FEA4315 		lsl	r5, r3, #5
 199 0044 0D43     		orrs	r5, r5, r1
 200 0046 4FEA4214 		lsl	r4, r2, #5
 201 004a 0346     		mov	r3, r0
 202 004c 4FEA8303 		lsl	r3, r3, #2
 203 0050 03F10703 		add	r3, r3, #7
 204 0054 03F10703 		add	r3, r3, #7
 205 0058 4FEAD303 		lsr	r3, r3, #3
 206 005c 4FEAC303 		lsl	r3, r3, #3
 207 0060 ADEB030D 		sub	sp, sp, r3
 208 0064 6B46     		mov	r3, sp
 209 0066 03F10703 		add	r3, r3, #7
 210 006a 4FEAD303 		lsr	r3, r3, #3
 211 006e 4FEAC303 		lsl	r3, r3, #3
 212 0072 BB61     		str	r3, [r7, #24]
  36:../src/main.c **** 	int d1, d2;
  37:../src/main.c **** 
  38:../src/main.c **** 	
  39:../src/main.c **** 	// calculate the squared distance between test sample and each training data points
  40:../src/main.c **** 	for (i=0; i<N; i++){
 213              		.loc 1 40 0
 214 0074 4FF00003 		mov	r3, #0
 215 0078 FB62     		str	r3, [r7, #44]
 216 007a 38E0     		b	.L4
 217              	.L5:
  41:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 218              		.loc 1 41 0 discriminator 2
 219 007c FB6A     		ldr	r3, [r7, #44]
 220 007e 4FEAC303 		lsl	r3, r3, #3
 221 0082 BA68     		ldr	r2, [r7, #8]
 222 0084 D318     		adds	r3, r2, r3
 223 0086 1A68     		ldr	r2, [r3, #0]
 224 0088 3B68     		ldr	r3, [r7, #0]
 225 008a 1B68     		ldr	r3, [r3, #0]
 226 008c D31A     		subs	r3, r2, r3
 227 008e FA6A     		ldr	r2, [r7, #44]
 228 0090 4FEAC202 		lsl	r2, r2, #3
 229 0094 B968     		ldr	r1, [r7, #8]
 230 0096 8A18     		adds	r2, r1, r2
 231 0098 1168     		ldr	r1, [r2, #0]
 232 009a 3A68     		ldr	r2, [r7, #0]
 233 009c 1268     		ldr	r2, [r2, #0]
 234 009e 8A1A     		subs	r2, r1, r2
 235 00a0 02FB03F2 		mul	r2, r2, r3
  42:../src/main.c **** 		+ (points[2*i+1]-sample[1])*(points[2*i+1]-sample[1]);
 236              		.loc 1 42 0 discriminator 2
 237 00a4 FB6A     		ldr	r3, [r7, #44]
 238 00a6 4FEAC303 		lsl	r3, r3, #3
 239 00aa 03F10403 		add	r3, r3, #4
 240 00ae B968     		ldr	r1, [r7, #8]
 241 00b0 CB18     		adds	r3, r1, r3
 242 00b2 1968     		ldr	r1, [r3, #0]
 243 00b4 3B68     		ldr	r3, [r7, #0]
 244 00b6 03F10403 		add	r3, r3, #4
 245 00ba 1B68     		ldr	r3, [r3, #0]
 246 00bc CB1A     		subs	r3, r1, r3
 247 00be F96A     		ldr	r1, [r7, #44]
 248 00c0 4FEAC101 		lsl	r1, r1, #3
 249 00c4 01F10401 		add	r1, r1, #4
 250 00c8 B868     		ldr	r0, [r7, #8]
 251 00ca 4118     		adds	r1, r0, r1
 252 00cc 0868     		ldr	r0, [r1, #0]
 253 00ce 3968     		ldr	r1, [r7, #0]
 254 00d0 01F10401 		add	r1, r1, #4
 255 00d4 0968     		ldr	r1, [r1, #0]
 256 00d6 411A     		subs	r1, r0, r1
 257 00d8 01FB03F3 		mul	r3, r1, r3
 258 00dc D118     		adds	r1, r2, r3
  41:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 259              		.loc 1 41 0 discriminator 2
 260 00de BB69     		ldr	r3, [r7, #24]
 261 00e0 FA6A     		ldr	r2, [r7, #44]
 262 00e2 43F82210 		str	r1, [r3, r2, lsl #2]
  40:../src/main.c **** 	for (i=0; i<N; i++){
 263              		.loc 1 40 0 discriminator 2
 264 00e6 FB6A     		ldr	r3, [r7, #44]
 265 00e8 03F10103 		add	r3, r3, #1
 266 00ec FB62     		str	r3, [r7, #44]
 267              	.L4:
  40:../src/main.c **** 	for (i=0; i<N; i++){
 268              		.loc 1 40 0 is_stmt 0 discriminator 1
 269 00ee FA6A     		ldr	r2, [r7, #44]
 270 00f0 FB68     		ldr	r3, [r7, #12]
 271 00f2 9A42     		cmp	r2, r3
 272 00f4 C2DB     		blt	.L5
  43:../src/main.c **** 	}
  44:../src/main.c **** 
  45:../src/main.c **** 	// print all distances
  46:../src/main.c **** 	for (i=0; i<N; i++){
 273              		.loc 1 46 0 is_stmt 1
 274 00f6 4FF00003 		mov	r3, #0
 275 00fa FB62     		str	r3, [r7, #44]
 276 00fc 18E0     		b	.L6
 277              	.L7:
  47:../src/main.c **** 		printf( "d%d = %d, class = %d \n",i+1, d[i],label[i]) ;
 278              		.loc 1 47 0 discriminator 2
 279 00fe 40F20003 		movw	r3, #:lower16:.LC5
 280 0102 C0F20003 		movt	r3, #:upper16:.LC5
 281 0106 FA6A     		ldr	r2, [r7, #44]
 282 0108 02F10101 		add	r1, r2, #1
 283 010c BA69     		ldr	r2, [r7, #24]
 284 010e F86A     		ldr	r0, [r7, #44]
 285 0110 52F82020 		ldr	r2, [r2, r0, lsl #2]
 286 0114 F86A     		ldr	r0, [r7, #44]
 287 0116 4FEA8000 		lsl	r0, r0, #2
 288 011a 7C68     		ldr	r4, [r7, #4]
 289 011c 2018     		adds	r0, r4, r0
 290 011e 0468     		ldr	r4, [r0, #0]
 291 0120 1846     		mov	r0, r3
 292 0122 2346     		mov	r3, r4
 293 0124 FFF7FEFF 		bl	printf
  46:../src/main.c **** 	for (i=0; i<N; i++){
 294              		.loc 1 46 0 discriminator 2
 295 0128 FB6A     		ldr	r3, [r7, #44]
 296 012a 03F10103 		add	r3, r3, #1
 297 012e FB62     		str	r3, [r7, #44]
 298              	.L6:
  46:../src/main.c **** 	for (i=0; i<N; i++){
 299              		.loc 1 46 0 is_stmt 0 discriminator 1
 300 0130 FA6A     		ldr	r2, [r7, #44]
 301 0132 FB68     		ldr	r3, [r7, #12]
 302 0134 9A42     		cmp	r2, r3
 303 0136 E2DB     		blt	.L7
  48:../src/main.c **** 	}
  49:../src/main.c **** 
  50:../src/main.c **** 	// find the k=1 nearest neighbors
  51:../src/main.c **** 
  52:../src/main.c **** 	for (j=0; j<N; j++){
 304              		.loc 1 52 0 is_stmt 1
 305 0138 4FF00003 		mov	r3, #0
 306 013c BB62     		str	r3, [r7, #40]
 307 013e 38E0     		b	.L8
 308              	.L13:
  53:../src/main.c **** 		d1 = d[j];
 309              		.loc 1 53 0
 310 0140 BB69     		ldr	r3, [r7, #24]
 311 0142 BA6A     		ldr	r2, [r7, #40]
 312 0144 53F82230 		ldr	r3, [r3, r2, lsl #2]
 313 0148 7B61     		str	r3, [r7, #20]
  54:../src/main.c **** 		for (n=0; n<N; n++){
 314              		.loc 1 54 0
 315 014a 4FF00003 		mov	r3, #0
 316 014e 7B62     		str	r3, [r7, #36]
 317 0150 27E0     		b	.L9
 318              	.L12:
  55:../src/main.c **** 			d2 = d[n];
 319              		.loc 1 55 0
 320 0152 BB69     		ldr	r3, [r7, #24]
 321 0154 7A6A     		ldr	r2, [r7, #36]
 322 0156 53F82230 		ldr	r3, [r3, r2, lsl #2]
 323 015a 3B61     		str	r3, [r7, #16]
  56:../src/main.c **** 			if (d1<d2 && d1>=0 && d2>=0){
 324              		.loc 1 56 0
 325 015c 7A69     		ldr	r2, [r7, #20]
 326 015e 3B69     		ldr	r3, [r7, #16]
 327 0160 9A42     		cmp	r2, r3
 328 0162 0DDA     		bge	.L10
 329              		.loc 1 56 0 is_stmt 0 discriminator 1
 330 0164 7B69     		ldr	r3, [r7, #20]
 331 0166 002B     		cmp	r3, #0
 332 0168 0ADB     		blt	.L10
 333 016a 3B69     		ldr	r3, [r7, #16]
 334 016c 002B     		cmp	r3, #0
 335 016e 07DB     		blt	.L10
  57:../src/main.c **** 				class = label[j];
 336              		.loc 1 57 0 is_stmt 1
 337 0170 BB6A     		ldr	r3, [r7, #40]
 338 0172 4FEA8303 		lsl	r3, r3, #2
 339 0176 7A68     		ldr	r2, [r7, #4]
 340 0178 D318     		adds	r3, r2, r3
 341 017a 1B68     		ldr	r3, [r3, #0]
 342 017c 3B62     		str	r3, [r7, #32]
 343 017e 0CE0     		b	.L11
 344              	.L10:
  58:../src/main.c **** 			}
  59:../src/main.c **** 			else if (d1>=0 && d2>=0){
 345              		.loc 1 59 0
 346 0180 7B69     		ldr	r3, [r7, #20]
 347 0182 002B     		cmp	r3, #0
 348 0184 09DB     		blt	.L11
 349              		.loc 1 59 0 is_stmt 0 discriminator 1
 350 0186 3B69     		ldr	r3, [r7, #16]
 351 0188 002B     		cmp	r3, #0
 352 018a 06DB     		blt	.L11
  60:../src/main.c **** 				class = label[n];
 353              		.loc 1 60 0 is_stmt 1
 354 018c 7B6A     		ldr	r3, [r7, #36]
 355 018e 4FEA8303 		lsl	r3, r3, #2
 356 0192 7A68     		ldr	r2, [r7, #4]
 357 0194 D318     		adds	r3, r2, r3
 358 0196 1B68     		ldr	r3, [r3, #0]
 359 0198 3B62     		str	r3, [r7, #32]
 360              	.L11:
  54:../src/main.c **** 		for (n=0; n<N; n++){
 361              		.loc 1 54 0
 362 019a 7B6A     		ldr	r3, [r7, #36]
 363 019c 03F10103 		add	r3, r3, #1
 364 01a0 7B62     		str	r3, [r7, #36]
 365              	.L9:
  54:../src/main.c **** 		for (n=0; n<N; n++){
 366              		.loc 1 54 0 is_stmt 0 discriminator 1
 367 01a2 7A6A     		ldr	r2, [r7, #36]
 368 01a4 FB68     		ldr	r3, [r7, #12]
 369 01a6 9A42     		cmp	r2, r3
 370 01a8 D3DB     		blt	.L12
  52:../src/main.c **** 	for (j=0; j<N; j++){
 371              		.loc 1 52 0 is_stmt 1
 372 01aa BB6A     		ldr	r3, [r7, #40]
 373 01ac 03F10103 		add	r3, r3, #1
 374 01b0 BB62     		str	r3, [r7, #40]
 375              	.L8:
  52:../src/main.c **** 	for (j=0; j<N; j++){
 376              		.loc 1 52 0 is_stmt 0 discriminator 1
 377 01b2 BA6A     		ldr	r2, [r7, #40]
 378 01b4 FB68     		ldr	r3, [r7, #12]
 379 01b6 9A42     		cmp	r2, r3
 380 01b8 C2DB     		blt	.L13
  61:../src/main.c **** 			}
  62:../src/main.c **** 		}
  63:../src/main.c **** 	}
  64:../src/main.c **** 	
  65:../src/main.c **** 	return class;
 381              		.loc 1 65 0 is_stmt 1
 382 01ba 3B6A     		ldr	r3, [r7, #32]
 383 01bc B546     		mov	sp, r6
  66:../src/main.c **** }
 384              		.loc 1 66 0
 385 01be 1846     		mov	r0, r3
 386 01c0 07F13407 		add	r7, r7, #52
 387 01c4 BD46     		mov	sp, r7
 388 01c6 BDE8F083 		pop	{r4, r5, r6, r7, r8, r9, pc}
 389              		.cfi_endproc
 390              	.LFE1:
 392 01ca 00BF     		.text
 393              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:19     .rodata:00000000 $d
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:20     .rodata:00000000 .LC3
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:23     .rodata:00000014 .LC4
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:26     .rodata:00000028 .LC0
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:44     .rodata:00000068 .LC1
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:54     .rodata:00000088 .LC2
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:58     .text.main:00000000 $t
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:63     .text.main:00000000 main
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:154    .text.classification_c:00000000 classification_c
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:146    .rodata:00000090 .LC5
C:\Users\reali\AppData\Local\Temp\ccDzZ2Ff.s:149    .text.classification_c:00000000 $t
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
classification
printf
