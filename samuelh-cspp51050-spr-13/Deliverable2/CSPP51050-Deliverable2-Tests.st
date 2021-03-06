TestCase subclass: #BrokerTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!BrokerTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/27/2013 17:26'!testMarshall	| testMessageName testParams testTarget testCallMessage |	testMessageName := 'addTo'.	testParams := Dictionary new.	testParams at: 'int1' put: 5; at: 'int2' put: 6.	testTarget := Server lab2server.	testCallMessage := CallMessage messageName:testMessageName params: testParams target: testTarget.		self should: [ (Broker new marshall: testCallMessage) =  (testTarget, ',', testMessageName, ',', testParams asCommaString) ].! !TestCase subclass: #CallMessageTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!CallMessageTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 11:05'!testInitializeWith	| testCallMessage testMessageName testParams testTarget |		testMessageName := 'addTo'.	testParams := Dictionary new.	testParams at: 'int1' put: 5; at: 'int2' put: 6.	testTarget := Server new.	testCallMessage := CallMessage messageName:testMessageName params: testParams target: testTarget.		self should: [ testCallMessage messageName =  testMessageName ].	self should: [ testCallMessage params = testParams ].	self should: [ testCallMessage target = testTarget ].! !TestCase subclass: #ClientProxyTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!ClientProxyTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/27/2013 17:26'!testAddTo	| testProxy |		testProxy := ClientProxy new initialize.	self should: [ (testProxy add: 5 to: 6) = 11 ]. ! !!ClientProxyTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 11:07'!testGetLength	| testProxy |		testProxy := ClientProxy new.	self should: [ (testProxy getLength: 'test') = 4 ]. ! !TestCase subclass: #ClientTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!ClientTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 10:57'!testAddTo	| testClient |	testClient := Client new.	testClient proxy: ClientProxy new.	self should: [ (testClient proxy add: 5 to: 6) = 11 ]. ! !!ClientTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 10:58'!testGetLength	| testClient |	testClient := Client new.	testClient proxy: ClientProxy new.	self should: [ (testClient proxy getLength: 'test') = 4 ]. ! !TestCase subclass: #ProxyTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!ProxyTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/27/2013 18:23'!testDelegateVarAccessors	| testProxy testDelegate |		testProxy := Proxy new.	testDelegate := Server new.	testProxy delegate: testDelegate.		self should: [ testProxy delegate = testDelegate ].! !TestCase subclass: #ServerProxyTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!ServerProxyTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/27/2013 18:26'!testInitialize	self shouldnt: [ ServerProxy new initialize delegate isNil ]! !!ServerProxyTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/27/2013 18:36'!testReceive	| testServerProxy testCallMessage testMessageName testParams |		"create a call message without specifiying the correct server broker"		testMessageName := 'addTo'.	testParams := Dictionary new.	testParams at: 'int1' put: 5; at: 'int2' put: 6.	testCallMessage := CallMessage messageName: testMessageName params: testParams target: (Server new).		self should: [ testCallMessage messageName =  testMessageName ].	self should: [ testCallMessage params = testParams ].		"instantiate a ServerProxy"	testServerProxy := ServerProxy new.		"confirm that not setting the proper broker returns the error message"	self should: [ (testServerProxy receive: testCallMessage) returnValue = 'That server is currently off-line' ].		testCallMessage target: 'Lab 2 Server Broker'.		self should: [ (testServerProxy receive: testCallMessage) returnValue = 11 ].! !TestCase subclass: #ServerTests	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'CSPP51050-Deliverable2-Tests'!!ServerTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 11:09'!testAddTo	| testServer |		testServer := Server new.	self should: [ (testServer add: 5 to: 6) = 11 ].! !!ServerTests methodsFor: 'as yet unclassified' stamp: 'sjh 5/24/2013 11:09'!testGetLength	| testServer |		testServer := Server new.	self should: [ (testServer getLength: 'test') = 4 ].! !