
Composite, Iterator, Visitor, Singleton

CSPP51050
Deliverable 1
Sam Henry

I solved Deliverable 1 using Smalltalk. I wrote in Squeak in order to extend TestCase for unit testing in Squeak's TestRunner. My unit tests also work if you filein to Pharo.

Download one-click images:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip
	Pharo: 	http://www.pharo-project.org/pharo-download 

My solutions' classes have been filed out to two files:
	CSPP51050-Deliverable1.st
	CSPP51050-Deliverable1-Tests.st

If you filein these files to your Squeak or Pharo using the File Browser, you'll see my solution's classes.

My components have an internal iterate message which instructs them to recursively iterate/visit over all the iterators for their components (composites/leaves for portfolios and just leaves for accounts-leaves' internal iterate message is just stubbed out). My PortfolioManager singleton instance sends the iterate message to its root portfolio, which kicks off the recursive visitation which calculates its sum total.

Please browse the source for each class and run the unit tests using Squeak's TestRunner or by action-clicking on CSPP51050-Deliverable1-Tests --> Run Tests in Pharo.
