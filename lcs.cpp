
#include <LPC17xx.H>

unsigned char data7[] =
{0x88,0xeb,0x4c,0x49,0x2b,0x19,0x18,0xcb,0x8,0x9,0xa,0x38,0x9C,0x68,0x1c,0x1e};

int main (void)
{
 
unsigned int i,j;
unsigned int count=0;
LPC_GPIO2->FIODIR = 0x000000FF;

LPC_GPIO1->FIODIR = 0x3C000000;
 


//Seven seg on PORT2

//Dig control on PORT1 are output
 

while(1)
{

++count;
if (count > 0xFFFF)
count = 0;
 

for (i=0; i < 5000; i++)//change to inc/dec speed of count

{

LPC_GPIO2->FIOPIN = data7[count & 0x000F]; LPC_GPIO1->FIOSET = (1 << 26); for (j=0;j<500;j++);

LPC_GPIO1->FIOCLR = (1 << 26);

LPC_GPIO2->FIOPIN = data7[(count & 0x00F0)>>4]; LPC_GPIO1->FIOSET = (1<<27); for (j=0;j<500;j++);

LPC_GPIO1->FIOCLR = (1 << 27);

LPC_GPIO2->FIOPIN = data7[(count & 0x0F00)>>8]; LPC_GPIO1->FIOSET = (1<<28); for (j=0;j<500;j++);

LPC_GPIO1->FIOCLR = (1<<28);

LPC_GPIO2->FIOPIN = data7[(count & 0xF000)>>12]; LPC_GPIO1->FIOSET = (1<<29); for (j=0;j<500;j++);

LPC_GPIO1->FIOCLR = (1<<29);

}
}

}

