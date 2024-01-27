/*
 * abc.c
 *
 *  Created on: 11 paü 2023
 *      Author: Stud21
 */
#include <stdio.h>
#include <ti/sysbios/BIOS.h>
#include <xdc/cfg/global.h>
#include <fft/DSPF_sp_cfftr2_dit.c>
#include <fft/DSPF_sp_cfftr2_dit.h>
#include <fft/utility.c>
#include <fft/utility.h>
#include <math.h>
#include "codec/codec_v1_0.c"
#include <stdbool.h>

#define N 512
#define Nmaska 1023
//#define PI 3.1415926535897932384626433832795

int probka;
float x[2*N];
float czas[N];
short n, cof;
float w[N];
float w2[2*N];
int i, l, counter;
//float x[N];       //musialam usunac bo byly bledy, konsekwencja tego bylo brak wykresu widma ampl.z oknem prostokatnym
float zespolone[N], zh[N], zhm[N];
float xh[2*N];
float hamming[2*N];
float h[N];
float hm[N];
float zero[4*N];
float zer[4*N];
char sign;
char DTMFSignal(float*);
char signal = 0;
float wynik[N];


//float PI;

int main(void)
{
    //printf("Start programu abc\n");
    Pins_config();
    tw_genr2fft(w, N);
    bit_rev(w, N>>1);
    tw_genr2fft(w2, N<<1);
    bit_rev(w2, N);
    BIOS_start();
    return(0);
}

void przerwanie_rcv()
{
    probka = Read_mcasp1_rcv();
    x[n] = (short)probka;
    czas[n>>1] = ((short)probka);
    x[n+1]=0;
    xh[n] = ((short)probka)*h[n>>1];
    xh[n+1]=0;
    hamming[n] = ((short)probka*hm[n>>1]);
    hamming[n+1]=0;

    zer[n] = ((short)probka);
    zer[n+1] = 0;
    zer[n+1024] = 0;
    zer[n+1024+1] = 0;


    if (n == 1022)
        {
        i = 0;  //breakpoint nowy
//        j = x[2*N];
//        k = w[N];
        DSPF_sp_cfftr2_dit(x, w, N);
        bit_rev(x,N);
        DSPF_sp_cfftr2_dit(xh, w, N);
        bit_rev(xh,N);
        DSPF_sp_cfftr2_dit(hamming, w, N);
        bit_rev(hamming,N);
        DSPF_sp_cfftr2_dit(zer, w2, 2*N);
        bit_rev(zer,2*N);


        for (i = 0; i < 512; i++)
        {
            zespolone[i] = sqrtf(x[2*i]*x[2*i] + x[2*i+1]*x[2*i+1]);
            zh[i] = sqrtf(xh[2*i]*xh[2*i] + xh[2*i+1]*xh[2*i+1]);
            zhm[i] = sqrtf(hamming[2*i]*hamming[2*i] + hamming[2*i+1]*hamming[2*i+1]);
        }
        counter = 0;
        i = 1;

        for(i = 0; i < 1024; i++)
        {
        zero[i] = sqrt(zer[2*i]*zer[2*i]+ zer[2*i+1]*zer[2*i+1]);
        counter++;
        }
       counter = 0;
       sign = DTMFSignal(zero);
        i = 1;          //breakpoint stare
        //DTMFSignal = signal(wynik);
        }
    n=n+2;
    n &= Nmaska ; // n = n%nmaska, zerowanie n
    if ((n==6) & (cof==1))
    {
            n=0;
            cof=0;
    }

    Write_mcasp1_xmt(probka);
    Restart_mcasp1_if_error();
}


void pierwszy_task(UArg arg0, UArg arg1)
{
    //printf("Start pierwszego zadania\n");
    Config_i2c_and_codec();

    for(i = 0; i < N; i++)
    {
    h[i] = 0.5*(1-cos(2*PI*i/(N))); // hanning
    }

    for(i = 0; i < N; i++)
        {
    hm[i] = 0.53836-0.46164*(cos((2*PI*i)/(N))); // hamming
        }

    n=0;
    cof=1;
    Config_and_start_mcasp1();
    Hwi_enableInterrupt(13);
    while(1)
    {

    }
}

char DTMFSignal(float* table){

    if (table[15]>120000 && table[26]<107000 && table[17]<130300 && table[18]<137000 &&    table[20]<120000 && table[29]<154100 && !table[32]<114800 && !table[35]<102100)
        {
        return 'A';
        //a sie pokazuje
        }
    if (table[17]<120000 && table[26]>107000 && table[15]<130300 && table[18]<137000 &&    table[20]<107000 && table[29]<163400 && !table[32]<962200 && !table[35]<154100)
        {
        return 'B';
        //a sie pokazuje, 154100
        }
    if (table[18]<120000 && table[26]<107000 && table[15]>130300 && table[17]<137000 &&    table[20]<130300 && table[29]<219300 && !table[32]<121800 && !table[35]<137000)
        {
        return 'C';
        // sie pokazuje, 137000
        }
    if (table[20]<120000 && table[26]<107000 && table[17]<130300 && table[18]>137000 &&     table[15]<137000  &&  table[29]<206800 && !table[32]<163400 && !table[35]<145300)
        {
        return 'D';
        // sie pokazuje, 145300
        }

        //------------------------------------------------------------------------------
    if (table[15]>154100 && table[29]<163400 && table[17]<219300 && table[18]<206800 && table[20]<120000  &&  table[26]>154100 && !table[32]<114800 && !table[35]<102100)
            {
            return '1';
            }
    if (table[17]<154100 && table[29]>163400 && table[15]<219300 && table[18]<206800 &&     table[20]<107000  &&  table[26]>163400 && !table[32]<962200 && !table[35]<154100)
            {
            return '7';
            // sie pokazuje
            }
      if (table[18]<154100 && table[29]<163400 && table[15]>219300 && table[17]<206800 &&     table[20]<130300  &&  table[26]>219300 && !table[32]<121800 && !table[35]<137000)
            {
            return '*';
            }
      if (table[20]<154100 && table[35]<163400 && table[15]<219300 && table[17]>206800 &&     table[20]<137000  &&  table[26]>206800 && !table[32]<163400 && !table[35]<145300)
            {
            return '4';
            }

    //------------------------------------------------------------------------------
      if (table[15]>114800  &&  table[32]<962200 && table[17]<121800 && table[18]<163400 &&     table[20]<120000  && table[26]<154100 && !table[29]>114800 && !table[35]<102100)
                {
                return '2';     //git
                }
      if (table[17]<114800  && table[32]>962200 && table[15]<121800 && table[18]<163400 &&     table[20]<107000  && table[26]<163400 && !table[29]>962200 && !table[35]<154100)
                {
                return '5';
                }
      if (table[18]<114800  &&  table[32]<962200 && table[15]>121800 && table[17]<163400 &&     table[20]<130300  && table[26]<219300 && !table[29]>121800 && !table[35]<137000)
                {
                return '8';
                }
       if (table[20]<114800  &&  table[32]<962200 && table[15]<121800 && table[17]>163400 &&     table[18]<137000  && table[26]<206800 && !table[29]>163400 && !table[35]<145300)
                {
                return '0';
                }

    //------------------------------------------------------------------------------

       if (table[15]>102100  &&  table[35]<154100 && table[17]<137000 && table[18]<145300 &&    table[20]<120000  &&  table[26]<154100 && table[29]<114800 && !table[32]>102100)
                     {
                     return '3';
                     }
       if (table[17]<102100  &&  table[35]>154100 && table[15]<137000 && table[18]<145300 &&     table[20]<107000  &&  table[26]<163400 && table[29]<962200 && !table[32]>154100)
                     {
                     return '#';
                     }
       if (table[18]<102100  &&  table[35]<154100 && table[15]>137000 && table[17]<145300 &&     table[20]<130300  &&  table[26]<219300 && table[29]<121800 && !table[32]>137000)
                     {
                     return '9';
                     }
        if (table[20]<102100  &&  table[35]<154100 && table[15]<137000 && table[17]>145300 &&     table[18]<137000  &&  table[26]<206800 && table[29]<163400 && !table[32]>145300)
                     {
                     return '6';
                     }
      return '0';


    }

   /* 1 = 120000
    * 4 = 107000
    * 7 = 130300
    * * = 137000
    * 2 = 154100
    * 5 = 163400
    * 8 = 219300
    * 0 = 206800
    * 3 = 114800
    * 6 = 962200
    * 9 = 121800
    * # = 163400
    * A = 102100
    * B = 154100
    * C = 137000
    * D = 145300
    */
//maid with..- koncowka utworu ma zlepek a i b, wiele przyciskow juz nie chce dzialac
//


