CSPP51050
Homework 3
Sam Henry

I solved HW 3 using Squeak Smalltalk.

Download one-click image:
	Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My solutions' classes have been filed out to two files:
	CSPP51050-HW3.st
	CSPP51050-HW3-Tests.st

If you filein thes above .st files to your Squeak using the File Browser, you'll see my solution's classes.

I included the assignment's recipe csv's in the Recipes directory and the assignment's reference csv's in the Reference directory. In order to run my code, you'll need to move these files into your Squeak's Resources directory. This directory should be located at /Squeak-4.4-All-in-One.app/Contents/Resources. You can put additional recipes and references directly in this directory for additional testing.

Please browse the source for each class and run the unit tests using Squeak's TestRunner after including the csv's in your Squeak Resources directory.

To test additional recipes for the 3 specified modes (ConstantCurrent, ConstantPressure, Ramp), you may include the new files in your Squeak Resources directory, then modify the corresponding test class to reflect the filename and values for your new recipe.

eg, to test a new Ramp recipe in a file named 'HW3_Ramp_2.csv' with contents Rwidget2,Ramp,40 
	1. move HW3_Ramp_2.csv and HW3_Ramp_2.csv.reference.csv to your Squeak Resources directory
	2. go to CSPP51050-HW3-Tests/RampTests
	3. change this part of the test case to refelct your new filename, recipeName, and partSize:

	From:	"create the ramp recipe"
			testRecipe := RampRecipe fromFile: 'HW3_Ramp.csv' for: testUI machineControl.
			self should: [ testRecipe recipeName = 'Rwidget' ].
			self should: [ testRecipe mode = 'Ramp' ].
			self should: [ testRecipe partSize = 50 ].

	To:		"create the ramp recipe"
			testRecipe := RampRecipe fromFile: 'HW3_Ramp_2.csv' for: testUI machineControl.
			self should: [ testRecipe recipeName = 'Rwidget2' ].
			self should: [ testRecipe mode = 'Ramp' ].
			self should: [ testRecipe partSize = 40 ].

Please let me know if you have any questions or run into any problems.


