/*
            Ch A | Ch B | Both
Hi Hat -      129   130   144
Snare -       131   132   160
Cymbal&Kick - 133   134   176
Small Tom -   135   136   192
Large Tom -   137   138   208
Floor Tom -   139   140   224
*/

s = Server.internal;
s = Server.local;

s.boot;
s.quit;

SerialPort.listDevices;


//-----------START-----------
(
var hihat, snare, cymbalkick, smalltom, largetom, floortom, counter, dur;

hihat = SerialPort(
    "/dev/tty.usbmodem141421",
    baudrate: 57600,
	crtscts: true);

snare = SerialPort(
    "/dev/tty.usbmodem141421",
    baudrate: 57600,
	crtscts: true);

cymbalkick = SerialPort(
    "/dev/tty.usbmodem141421",
    baudrate: 57600,
	crtscts: true);

smalltom = SerialPort(
    "/dev/tty.usbmodem141421",
    baudrate: 57600,
	crtscts: true);

largetom = SerialPort(
    "/dev/tty.usbmodem1411",
    baudrate: 57600,
	crtscts: true);
*/
floortom = SerialPort(
    "/dev/tty.usbmodem141431",
    baudrate: 57600,
	crtscts: true);

//Test all boards




counter = 230;
dur = 0.08;

 d=Task.new ({

 {counter > 100}.while ({

		counter = counter -1 ;
		hihat.put(counter);
		snare.put(counter);
		cymbalkick.put(counter);
		smalltom.put(counter);
		largetom.put(counter);
		floortom.put(counter);

		//largetom.put(208);
  counter.postln;

  dur.wait;
 });
});

d.play;

//d.stop;
)
// --------------END---------------




















(
r= Routine({
    inf.do{|i|
        //f.put(i.fold(1, 100).linexp(1, 100, 1, 250).asInteger.postln);
		//g.put(i.fold(1, 100).linexp(1, 100, 100, 250).asInteger.postln);
		i.fold(1, 100).linexp(1, 100, 100, 250).asInteger;
		g.put(i);
		i.postln;

        0.08.wait;
    };
}).play;
)

r.stop;

f.close;
g.close;


(
 var counter;
 var dur;

 counter = 200;
 dur = 0.08;

 d=Task.new ({

 {counter > 100}.while ({

  counter = counter -1 ;
	g.put(counter);
  counter.postln;

  dur.wait;
 });
});

d.play;
)

d.stop;



// common baudrates:
// 9600, 19200
//[9600, 19200, 38400, 57600, 115200 ]

// read a byte from the device

//p.next;            // doesn't block
//fork{p.read.postln};    // may suspend thisThread - should be called within a routine

// write a byte to the device

//fork{p.put(42)};    // may suspend thisThread - should be called within a routine

// write multiple bytes to the device


//p.doneAction = { "my serial port got closed".postln; }

p.close;    // close the port

//SerialPort.closeAll;    // close all ports

(
r= Routine({
    inf.do{|i|
        p1.put(i.fold(1, 100).linexp(1, 100, 1, 250).asInteger.postln);
		//p1.put(i.fold(1, 100).linexp(1, 100, 1, 250).asInteger.postln);
        0.05.wait;
    };
}).play;
)
r.stop;
