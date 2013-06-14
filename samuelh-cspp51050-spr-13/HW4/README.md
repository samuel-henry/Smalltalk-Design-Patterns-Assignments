CSPP51050
Homework 4
Sam Henry

I solved HW 4 using Squeak Smalltalk.

Download one-click image:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My solutions' classes have been filed out to two files:
	CSPP51050-HW4.st
	CSPP51050-HW4-Tests.st

If you filein thes above .st files to your Squeak using the File Browser, you'll see my solution's classes.

I ran into some issues with the Transcript's thread safety, so you don't always see both lights update through all three state transitions. Switching the order in which myPedestrianLights and myTrafficLights are added to myController lights in the testLights test case will show you that either is capable of going through its full set of changes, but there's a lock on Transcript that I haven't been able to fully get around using a mutual exclusion semaphore in my Controller.
