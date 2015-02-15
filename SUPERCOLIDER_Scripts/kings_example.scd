SerialPort.listDevices;
// ttyUSB*, ttyACM*
(
p = SerialPort(
    "/dev/tty.usbmodem1411",
    baudrate: 57600,
	crtscts: true);
)

MIDIClient.init;
(
if (MIDIClient.initialized.not) {
	MIDIClient.init;
};
MIDIIn.connectAll;
~drum1 = 60; //<-- change this to your MIDI number for this drum
~drum2 = 60; //<-- change this to your MIDI number for this drum
~drum3 = 60; //<-- change this to your MIDI number for this drum
MIDIdef.noteOn(\noteOn, {|val, num, chan, src|
	[val, num, chan, src].postln;
	if (num == ~drum1) {
		//your code here to trigger drum1
	};
	if (num == ~drum2) {
		//your code here to trigger drum1
	};
	if (num == ~drum3) {
		//your code here to trigger drum1
	};
});
)