CSPP51050
Final Project
Sam Henry

I implemented my final project using Squeak Smalltalk.

Download one-click image:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My classes have been filed out to two files:
	CSPP51050-FinalProject.st
	CSPP51050-FinalProject-Tests.st

If you filein these files to your Squeak using the File Browser, you'll see my project's classes.

---

For my final project I simulated order processing for a company that sells physical goods. This company accepts orders from customers, places orders if goods are in stock, logs transactions, emails order confirmations to customers, maintains inventory, picks goods from its warehouse(s), and ships the picked goods. I implemented everything up to warehousing/picking/shipping the goods. My design allows for many order input methods (e.g. web, email, fax, EDI, postal, in-store, etc) to flow into this order processing system. My design also allows the company to begin selling electronic goods by adding a new concrete order type and visitation implementation in its placeability and creator components.