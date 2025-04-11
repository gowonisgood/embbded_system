#include "mbed.h"

//input : button, inturrpt 
InterruptIn button(USER_BUTTON);
//output : led
DigitalOut led1(LED1);
DigitalOut led2(LED2);
DigitalOut led3(LED3);

//timer : interrupt
Timer t;
Ticker ticker;

//variable for control
volatile bool isBlinking = false;
volatile int whatled = 1;

//for printf
Serial pc(USBTX, USBRX);

//led on function
void led_blink(){
    led1 = 0;
    led2 = 0;
    led3 = 0;

    if(whatled==1) led1 = 1;
    else if(whatled==2) led2 = 1;
    else if(whatled==3) led3 = 1;

    whatled += (whatled+1) % 3;

}


//toggle function
void toggle(){
    if(!isBlinking){

        ticker.attach(&led_blink,0.5);
        t.reset();
        t.start();
        isBlinking = true;

    }else{
        
        ticker.detach();
        led1 = 0;
        led2 = 0;
        led3 = 0;

        t.stop();

        pc.printf("Elasped time:%f",t.read());
    }
}


// main() runs in its own thread in the OS
int main()
{

    button.fall(&toggle); //버튼이 눌러졌을때 1 (fall)
    

    // while (true) {
    //     ThisThread::sleep_for(100ms); 
    // }
}

