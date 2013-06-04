CSPP51050
Final Project
Sam Henry

Factory Method, Reflection, Observer, Visitor, Singleton, Pipes and Filters, Message Queue

I implemented my final project using Squeak Smalltalk.

Download one-click image:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My classes have been filed out to two files:
	CSPP51050-FinalProject.st
	CSPP51050-FinalProject-Tests.st

If you filein these files to your Squeak using the File Browser, you'll see my project's classes.

Generated output files may be found at /Squeak-4.4-All-in-One.app/Contents/Resources. You'll find files for each input order, notifying the customer whether it was placed or not. There's also a file named 'SAM-Orders' that maintains a record of each placed order.

---

For my final project I simulated order processing for a company that sells physical goods. This company accepts orders from customers, places orders if goods are in stock and delivery preference can be honored, logs transactions, emails order confirmations to customers, maintains inventory, picks goods from its warehouse(s), and ships the picked goods. I implemented everything up to warehousing/picking/shipping the goods (and emailing customers is simulatd by creating files with the email bodies). My design allows for many order input methods (e.g. web, email, fax, EDI, postal, in-store, API, etc) to flow into this order processing system. My design also allows the company to begin selling electronic goods by adding a new concrete order type and visitation implementation in its placeability and creator components.

For architectural patterns, I use pipes and filters and a priority message queue. I use pipes and filters to push orders through each stage of the process, encapsulating tasks into discrete stages that can pipe an order to each other. I use a priority message queue to buffer picking messages so that available pickers can select work based on priority without the rest of the system needing to worry if the goods will be picked and shipped.

For design patterns, I use Factory Method, Observer, Visitor, and Singleton (as well as the basic internal Iterator in Collections) to move orders through the system. Concrete orders are created from raw input data by calling a factory method on the abstract Order class, which reflects its subclasses and lets them decide who should be instantiated.  My filters observe the pipe(s) that precede them in the system. When an order is put in an observed pipe, the observing filter will be notified of the state change and then pull the order from the pipe. An order is visited in an Order Placability Filter. This visitation determines order placability in terms of the concrete order type, the customer's distance from the warehouse/days in transit, and the inventory status for each line item. The Inventory Manager is a Singleton (we only want one possible view of the company's inventory). It restocks items after an order is unplacable due to a line item being out of stock (not the greatest strategy, could attach a stocking strategy to each SKU...). After checking placability, an unplacable order is piped directly to the Customer Notifier Filter with a message to the customer. A placable order is piped to an Order Creator Filter. The Order Creator Filter (a) initiates a visitation on the order to attach priority and timestamp and adds it to a prioritized Picking Queue, (b) pipes the order with a placed order message to the Customer Notifier Filter, and (c) pipes the order to the Logger Filter, which records the transaction in the company's records. 
