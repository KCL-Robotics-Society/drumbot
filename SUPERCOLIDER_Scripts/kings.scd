/*
            Ch A | Ch B | Both
Hi Hat -      129   130   144
Snare -       131   132   160
Cymbal&Kick - 133   134   176
Small Tom -   135   136   192
Large Tom -   137   138   208
Floor Tom -   139   140   224
*/

//cymbalkick, hihat, floor tom, large tom, small tom, Snare

// Connections should be in this order (for MAC):
/*
/dev/tty.usbmodem14121 - Snare - 3
/dev/tty.usbmodem14131 - Small Tom - 4
/dev/tty.usbmodem141411 - Large Tom - 5
/dev/tty.usbmodem141421 - Floor Tom - 6
/dev/tty.usbmodem141431 - HyHat - 7
/dev/tty.usbmodem141441 - Kick - 8
*/

//-----------START-----------

MIDIClient.init;
(
if (MIDIClient.initialized.not) {
	MIDIClient.init;
};
MIDIIn.connectAll;

SerialPort.listDevices;
//SerialPort.devices[2]; // an example how to choose serial port device



(

~kingsKickTTY = 2; //Starts at 2 because two embedded devices are already listed

if (SerialPort.devices[~kingsKickTTY] == "/dev/tty.usbmodem1411") {
	SerialPort.devices[~kingsKickTTY].postln;
	~kingsCymbalkick = SerialPort(
		SerialPort.devices[~kingsKickTTY],
		baudrate: 57600,
		crtscts: true);
/*
	~kingsSnareTTY = 3;
	~kingsSnare = SerialPort(
		SerialPort.devices[~kingsSnareTTY],
		baudrate: 57600,
		crtscts: true);

	~kingsSmalltomTTY = 4;
	~kingsSmalltom = SerialPort(
		SerialPort.devices[~kingsSmalltomTTY],
		baudrate: 57600,
		crtscts: true);

	~kingsHihatTTY = 5;
	~kingsHihat = SerialPort(
		SerialPort.devices[~kingsHihatTTY],
		baudrate: 57600,
		crtscts: true);

	~kingsFloortomTTY = 6;
	~kingsFloortom = SerialPort(
		SerialPort.devices[~kingsFloortomTTY],
		baudrate: 57600,
		crtscts: true);

	~kingsLargetomTTY = 7;
	~kingsLargetom = SerialPort(
		SerialPort.devices[~kingsLargetomTTY],
		baudrate: 57600,
		crtscts: true);
*/
};
~kingsHihatStrikeA = {
	{~kingsHihat.put(129);}.fork;
};
~kingsHihatStrikeB = {
	{~kingsHihat.put(130);}.fork;
};
~kingsHihatStrikeAB = {
	{~kingsHihat.put(144);}.fork;
};
~kingsSnareStrikeA = {
	{~kingsSnare.put(131);}.fork;
};
~kingsSnareStrikeB = {
	{~kingsSnare.put(132);}.fork;
};
~kingsSnareStrikeAB = {
	{~kingsSnare.put(160);}.fork;
};
~kingsCymbalkickStrikeA = {
	{~kingsCymbalkick.put(110);}.fork;
};
~kingsCymbalkickStrikeB = {
	{~kingsCymbalkick.put(134);}.fork;
};
~kingsCymbalkickStrikeAB = {
	{~kingsCymbalkick.put(175);}.fork;
};
~kingsSmalltomStrikeA = {
	{~kingsSmalltom.put(135);}.fork;
};
~kingsSmalltomStrikeB = {
	{~kingsSmalltom.put(136);}.fork;
};
~kingsSmalltomStrikeAB = {
	{~kingsSmalltom.put(192);}.fork;
};
~kingsLargetomStrikeA = {
	{~kingsLargetom.put(137);}.fork;
};
~kingsLargetomStrikeB = {
	{~kingsLargetom.put(138);}.fork;
};
~kingsLargetomStrikeAB = {
	{~kingsLargetom.put(208);}.fork
};
~kingsFloortomStrikeA = {
	{~kingsFloortom.put(139);}.fork;
};
~kingsFloortomStrikeB = {
	{~kingsFloortom.put(140);}.fork;
};
~kingsFloortomStrikeAB = {
	{~kingsFloortom.put(224);}.fork;
};

/*
~kingsTestAll = {
	var counter, dur, list;
	counter = 0;
	dur = 0.5;
	list = [
		~kingsHihatStrikeA.(),
		~kingsHihatStrikeB.(),
		~kingsHihatStrikeAB.(),
		~kingsSnareStrikeA.(),
		~kingsSnareStrikeB.(),
		~kingsSnareStrikeAB.(),
		~kingsCymbalkickStrikeA.(),
		~kingsCymbalkickStrikeB.(),
		~kingsCymbalkickStrikeAB.(),
		~kingsSmalltomStrikeA.(),
		~kingsSmalltomStrikeB.(),
		~kingsSmalltomStrikeAB.(),
		~kingsLargetomStrikeA.(),
		~kingsLargetomStrikeB.(),
		~kingsLargetomStrikeAB.(),
		~kingsFloortomStrikeA.(),
		~kingsFloortomStrikeB.(),
		~kingsFloortomStrikeAB.()
	];


	Task.new ({

		{counter < list.size}.while ({

			list[counter].();

			counter.postln;

			counter = counter + 1 ;
			dur.wait;
		});
	}).play;
};


~kingsCleanup = {
	if (~kingsCymbalkick.notNil) {
		~kingsCymbalkick.close;
		~kingsHihat.close;
		~kingsFloortom.close;
		~kingsLargetom.close;
		~kingsSmalltom.close;
		~kingsSnare.close;
	};
};
*/

//Define these variables for each MIDI file
~kingsKickNote = 46;
~kingsSnareNote = 38;
~kingsSnareCount = 0;

MIDIdef.noteOn(\kingsNoteOn, {|val, num, chan, src|
	[val, num, chan, src].postln;
	if (num == ~kingsKickNote) {
		"Kings: kick".postln;
		~kingsCymbalkickStrikeA.();
	};
	if (num == ~kingsSnareNote) {
		"Kings: snare".postln;
		if (~kingsSnareCount == 0) {
			~kingsSnareStrikeA.();
		} {
			~kingsSnareStrikeB.();
		};
		~kingsSnareCount = (~kingsSnareCount + 1) % 2;
	};
});
)

/*
~kingsTestAll.();

~kingsHihatStrikeA.();
~kingsHihatStrikeB.();
~kingsHihatStrikeAB.(); //err
~kingsSnareStrikeA.();
~kingsSnareStrikeB.();
~kingsSnareStrikeAB.();
~kingsCymbalkickStrikeA.();
~kingsCymbalkickStrikeB.();
~kingsCymbalkickStrikeAB.(); //err
~kingsSmalltomStrikeA.();
~kingsSmalltomStrikeB.();
~kingsSmalltomStrikeAB.(); //err
~kingsLargetomStrikeA.();
~kingsLargetomStrikeB.();
~kingsLargetomStrikeAB.(); //err
~kingsFloortomStrikeA.();
~kingsFloortomStrikeB.();
~kingsFloortomStrikeAB.(); //err

fork{~kingsPort.put(0)};

~kingsCleanup.();

SerialPort.listDevices;
SerialPort.closeAll;
*/
/*

*/