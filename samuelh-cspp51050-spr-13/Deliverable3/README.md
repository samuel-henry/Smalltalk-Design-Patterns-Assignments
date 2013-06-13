Lab deliverable 3

Use Blackboard architectural pattern to drive music recommendation 

To run, open your Squeak workspace and run 'do it' on the following:

	aBlackboard := Blackboard new.
	aBlackboard initialize.
	aController := PhoMREController new.
	aController blackboard: aBlackboard.
	aSimilarArtistsKnowledgeSource := SimilarArtistsKnowledgeSource new.
	aSimilarTrackKnowledgeSource := SimilarTrackKnowledgeSource new.
	aController connect: aSimilarArtistsKnowledgeSource; connect: aSimilarTrackKnowledgeSource.
	aBlackboard assertProblem.

Then, after entering your starting track, run 'do it' on this line to start the controller:

aController loop.