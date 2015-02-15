
MIDIClient.init;

MIDIIn.connectAll;

SerialPort.listDevices;


// FIRST 6 KEYBOARD BUTTONS MAPPED TO DRUMS

(

     ~kingsKickTTY = 2;
	 ~kingsCymbalkick = SerialPort(
		SerialPort.devices[~kingsKickTTY],
		baudrate: 57600,
		crtscts: true);

	~kingsSnareTTY = 3;
	~kingsSnare = SerialPort(§
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
	{~kingsCymbalkick.put(133);}.fork;
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


~kingsKickNote = 48;
~kingsSnareNote = 50;
~kingsSnareCount = 0;
~kingsHihatNote = 59;
~kingsCymbalNote = 57;
~kingsFloorTomNote = 52;
~kingsSmallTomNote = 53;
~kingsLargeTomNote = 55;


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
	if (num == ~kingsHihatNote) {
		"Kings: hyhat".postln;
		~kingsHihatStrikeAB.();
	};
	if (num == ~kingsCymbalNote) {
		"Kings: Cymbal".postln;
		~kingsCymbalkickStrikeB.();


	};
	if (num == ~kingsFloorTomNote) {
		"Kings: Floor".postln;
		~kingsFloortomStrikeAB.();

	};
	if (num == ~kingsSmallTomNote) {
		"Kings: Floor".postln;
		~kingsSmalltomStrikeA.();

	};
	if (num == ~kingsLargeTomNote) {
		"Kings: Floor".postln;
		~kingsLargetomStrikeA.();

	};
});

)
