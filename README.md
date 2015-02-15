# drumbot
Files, scripts and settings for the drummer robot (Drumbot)

## How to use
### Qmidi
You can play the midi files with the qmidi software on mac
although the windows version is also available online.
If you want to play some mp3 music in sync with midi file
you have install Qmidi pro and make sure both files are named
the samed both as files and in Qmidi.
Unfortunately Qmidi is neither opensource or free software so
it will pop up some annoying message every now and then.
### SuperCollider
You also need to install SuperCollider from 
[SuperCollider Website](http://supercollider.sourceforge.net/)
All the scripts that interpret the midi songs to correct output for
Drubot are executed in SuperColleder. You may need to create a different
mapping for each midi file. Take a look at who-my generation.scd and 
KeyBoardtest.scd to get a better idea.
### OS Settings
There are some settings that you need to change depending on
you operating system. but for mac:
- go to "audio midi setup" in Applications >> Utility
click on IAC driver and make sure the "device is online" checkbox
is ticked you may also need to add a new IAC bus where you see a + sign
at the bottom of the window.
- in Qmidi in the menu at the top of the screen, 
go to Qmidi >> Midi Settings ...
check midi port and chose the IAC bus driver you just created

