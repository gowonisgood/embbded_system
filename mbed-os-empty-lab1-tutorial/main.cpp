#include "mbed.h"
extern "C" int my_asm(int vaule);
//Serial pc(SERIAL_TX, SERIAL_RX);

DigitalOut led1(LED1);

// main() runs in its own thread in the OS
int main()
{
  int value = 0;

  while(1){
      my_asm(value);
      value = (value==0) ? 1 : 0;
      thread_sleep_for(1000);
  }
}
