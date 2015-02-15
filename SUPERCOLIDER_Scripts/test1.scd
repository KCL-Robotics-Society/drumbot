Quarks.help("SCPyduino");
Quarks.gui

//basic test:
(
// List devices
SerialPort.listDevices;
//choose appropriate index. You can also cut and paste the path name directly in the port argument
d = SerialPort.devices[2]; // or "/dev/tty.usbserial-A1001NeZ"

f = SCPyduino.new(d);

{
	3.0.wait;
	//wait ~three secs
	f.firmataVersion.postln; // posts the version of Firmata returned from the microcontroller if
	//connection is ok
}.fork;
)

f.close; //close the SerialPort connection.

//Bink LED:
(
// List devices
SerialPort.listDevices;
//choose appropriate index. You can also cut and paste the path name directly in the port argument
d = SerialPort.devices[6]; //select correct index for serial port

p = SCPyduino.new(d);

// - Controlling digital output -
//Activate digital port 1 (PORTB) on the Arduino
p.digitalPorts[1].active_(1)

//Set the mode for digital pin 13 to digital output
p.digital[13].mode_(p.digital_output);

)

//Make the LED blink
(
a = fork{
		loop{
			p.digital[13].write(1);
			1.wait;
			p.digital[13].write(0);
			1.wait;
		}
};
)

(
a.stop; // stop blinking
p.close;
)

//OSC - Open Sound Control
(
OSCdef(\test, {|msg,time,addr,port|
	[\noteOn, 34, 120];
});
)
