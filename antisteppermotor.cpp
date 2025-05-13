//STEPPER-MOTOR ANTI CLOCKWISE ROTATION
#include <LPC17xx.H>
void delay(unsigned int count)
{
unsigned int j=0,i=0;
for(j=0;j<count;j++)
{
for(i=0;i<6000;i++);
}
}
int main (void)
{
unsigned int del=100;
LPC_GPIO1->FIODIR = 0x03C00000;
// stepper motor port P1.22 to P1.25
uint32_t i;
for ( i=0; i<50; i++) //360o rotation 50
{
LPC_GPIO1->FIOPIN =0x00400000;
delay(del);
LPC_GPIO1->FIOPIN =0x00800000;
delay(del);
LPC_GPIO1->FIOPIN =0x01000000;
delay(del);
LPC_GPIO1->FIOPIN =0x02000000;
delay(del);
}
}
