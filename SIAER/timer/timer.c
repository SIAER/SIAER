// *************************************************************************************************
// Include section

// system
#include "includes.h"

// *************************************************************************************************
// Prototypes section
void Timer1_Init(void);
void Timer1_Start(void);
void Timer1_Stop(void);

extern volatile char ed_send_request;

// *************************************************************************************************
// Defines section

// *************************************************************************************************
// Global Variable section

// *************************************************************************************************
// Extern section

// *************************************************************************************************
// @fn          Timer0_Init
// @brief       Set Timer0 to a period of 1 or 2 sec. IRQ TACCR0 is asserted when timer overflows.
// @param       none
// @return      none
// *************************************************************************************************
void Timer1_Init(void)
{
    // Set interrupt frequency to 1Hz
    TA1CCR0 = 32768 - 1;

    // Enable timer interrupt
    TA1CCTL0 |= CCIE;

    // Clear and start timer now
    // Continuous mode: Count to 0xFFFF and restart from 0 again - 1sec timing will be generated by
    // ISR
    TA1CTL |= TASSEL0 + MC1 + TACLR;
    
 __bis_SR_register(GIE); //enable interrupts
}

// *************************************************************************************************
// @fn          Timer0_Start
// @brief       Start Timer0.
// @param       none
// @return      none
// *************************************************************************************************
void Timer1_Start(void)
{
    // Start Timer0 in continuous mode
    TA1CTL |= MC_2;
}

// *************************************************************************************************
// @fn          Timer0_Stop
// @brief       Stop and reset Timer0.
// @param       none
// @return      none
// *************************************************************************************************
void Timer1_Stop(void)
{
    // Stop Timer0
    TA1CTL &= ~MC_2;

    // Set Timer0 count register to 0x0000
    TA1R = 0;
}


// Timer A0 interrupt service routine
#pragma vector=TIMER1_A0_VECTOR
__interrupt void TIMER1_A0_ISR(void)
{
	  // Disable IE
    TA1CCTL0 &= ~CCIE;
    // Reset IRQ flag
    TA1CCTL0 &= ~CCIFG;
    // Add 1 sec to TACCR0 register (IRQ will be asserted at 0x7FFF and 0xFFFF = 1 sec intervals)
    TA1CCR0 += 32768;
    // Enable IE
    TA1CCTL0 |= CCIE;
	
    ed_send_request = 1;
}
