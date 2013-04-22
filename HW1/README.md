CSPP51050
Homework 1
Sam Henry

I solved HW 1 using Smalltalk. I wrote in Squeak in order to extend TestCase for unit testing in Squeak's TestRunner. My unit tests also work if you filein to Pharo.

Download one-click images:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip
	Pharo: 	http://www.pharo-project.org/pharo-download 

My solutions' classes have been filed out to two files:
	CSPP51050-HW1.st
	CSPP51050-HW1-Tests.st

If you filein these files to your Squeak or Pharo using the File Browser, you'll see the following classes:

	Problem 1:
		Registrar
		Course
		RegistrarTests
		CourseTests

	Problem 2:
		Account
		CheckingAccount
		SavingsAccount

I've implemented the functionality for Problem 1 in Registrar and Course, and included unit tests in RegistrarTests and CourseTests. The functionality for Problem 2 is in Account, CheckingAccount, and SavingsAccount, with unit tests in AccountTests, CheckingAccountTests, and SavingsAccountTests. 

Please browse the source for each class and run the unit tests using Squeak's TestRunner or by action-clicking on CSPP51050-HW1-Tests --> Run Tests in Pharo.

Additional testing for problem 2 can be completed in the Workspace. Paste the following into your Workspace and then follow the below steps:

	pastDate := Date today subtractDays: 365.
	pastDate := Date today subtractDays: 3650.

	"checking account just created"
	checkingAccount := CheckingAccount new initializeWithBalance: 500.
	checkingAccount getAccountSummary.

	"checking account past"
	checkingAccount lastUpdatedDate: pastDate.
	checkingAccount getAccountSummary.

	"savings account just created"
	savingsAccount := SavingsAccount new initializeWithBalance: 500.
	savingsAccount getAccountSummary.

	"savings account past"
	savingsAccount lastUpdatedDate: pastDate.
	savingsAccount getAccountSummary.

Workspace Testing:

For the below steps, you'll see the effects of the different implementations of Account. For CheckingAccount the balance will not increase over time. For SavingsAccount the balance will compound at the default interest rate (0.10) compounded annually.

Step 1: select and run 'print it' on the section commented "checking account just created"
Step 2: select and run 'do it' on the first pastDate line, then run 'print it' on the section commented "checking account past"
Step 3: select and run 'do it' on the second pastDate line, then run 'print it' again on the section commented "checking account past"
Step 4: select and run 'print it' on the section commented "savings account just created"
Step 5: select and run 'do it' on the first pastDate line, then run 'print it' on the section commented "savings account past"
Step 6: select and run 'do it' on the second pastDate line, then run 'print it' again on the section commented "savings account past"
