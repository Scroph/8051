#Fizz Buzz in 8051 assembly

The code is written in assembly, and is simulated in Proteus ISIS.


## Circuit

Two 7-segment displays are connected to the P0 port, displaying numbers from 0x00 to 0xFF. Two LEDs indicate whether the number is divisible by 3 (Fizz), 5 (Buzz), or both (Fizzbuzz). The "Fizz" and "Buzz" LEDs are connected to the P2.0 and P2.1 pins respectively.

The 7-segment displays display the numbers in hexadecimal notation, so for example, 15 will only turn on the "Fizz" LED and not both, because 0x15 is the equivalent of the decimal number 21 which is only divisible by 3.

![Screen cap](http://i.imgur.com/dS1t0Jg.gif)
