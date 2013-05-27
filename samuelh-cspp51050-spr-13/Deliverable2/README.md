Broker

CSPP51050
Deliverable 2
Sam Henry

I solved Deliverable 2 using Squeak Smalltalk.

Download one-click image:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My solutions' classes have been filed out to two files:
	CSPP51050-Deliverable2.st
	CSPP51050-Deliverable2-Tests.st

If you filein these files to your Squeak using the File Browser, you'll see my solution's classes.

My Brokers have a receive: message that takes an input, marshalls/demarshalls it between a CallMessage and a formattted string, and passes it on to its receiver (ClientBroker -> ServerBroker, ServerBroker -> ServerProxy)