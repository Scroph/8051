#Interfacing a 8051 microcontroller with a keypad and a 7-segment display.

The code is written in assembly, and is simulated in Proteus ISIS.


## 7-segment display

I chose to connect the 7 segment module to the P0 port. I also took the liberty of placing a few 100 ohm resistors in between :

![7 segment display](http://3.bp.blogspot.com/-4XUDNM1h7CI/VMZieMBw9WI/AAAAAAAAAIc/SUxVmHawXYc/s1600/7segment.PNG)

## Keypad

The keypad on the other hand is connected to the P1 port :

![Keypad](http://1.bp.blogspot.com/-TCWy5L_gLlo/VMZgAapNE6I/AAAAAAAAAIQ/1bcJF3HiEI4/s1600/keypad.PNG)

The keypad-related portion of the code was inspired by the algorithm that was gracefully explained by Amol Shah in the [dnatechindia](http://www.dnatechindia.com/Tutorial/8051-Tutorial/Interfacing-Matrix-Keypad-to-8051.html) website.

## You're welcome to drop by in my blog :^p

A more thorough write-up can be found in [this blog post]().

Be warned though, it's written in french.
