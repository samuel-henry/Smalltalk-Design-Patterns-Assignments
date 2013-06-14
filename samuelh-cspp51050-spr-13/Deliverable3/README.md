Lab deliverable 3

Use Blackboard architectural pattern to drive music recommendation 

To run, open your Squeak workspace and run 'do it' on the following:

	aBlackboard := Blackboard new.
	aBlackboard initialize.
	aController := PhoMREController new.
	aController blackboard: aBlackboard.
	aSimilarArtistsKnowledgeSource := SimilarArtistsKnowledgeSource new.
	aSimilarTrackKnowledgeSource := SimilarTrackKnowledgeSource new.
	aSimilarNumberListenersKnowledgeSource := SimilarNumberListenersKnowledgeSource new.
	aTopTrackByTopFansKnowledgeSource := TopTrackByTopFansKnowledgeSource new.
	aController connect: aSimilarArtistsKnowledgeSource; connect: aSimilarTrackKnowledgeSource; connect: aSimilarNumberListenersKnowledgeSource; connect: aTopTrackByTopFansKnowledgeSource.
	aBlackboard assertProblem.

Then, after entering your starting track, run 'do it' on this line to start the controller:

	aController loop.


1. What are the "puzzle pieces" of your blackboard?
Blackboard, Controller, Knowledge Sources, Assumptions (with Tracks)

2. Is adding a new knowledge source to your program as easy as adding the first one? If not, describe why; then, describe a solution to make it so, and refactor your code accordingly. If so, explain the structure of your code that allows for this.

Yes. My Controller lets all connected Knowledge Sources have their say in the solution. All I have to do is create a new Knowledge Source and connect it to the Controller for it to work.

3. Do you have a Controller for your blackboard? If not, describe a solution to make it so, and refactor your code to include it. If so, explain how your Controller works.

Yes. My Controller works by attaching to the Blackboard, and then connecting with Knowledge Sources. It loops over its connected Knowledge Sources and asks them if they have anything to say. It selects the Knowledge Source that is applicable with the greatest priority and lets it evaluate the Blackboard. This lets it add Assumptions (containing possible solution Tracks) to the Blackboard.

4. Does this knowledge source need an Assumption? An Affirmation? Why, or why not? If it does and you haven't implemented it/them, make it so.

ALl of my knowledge sources create Assumptions, which are a subclass of Affirmation. The Assumptions contain possible solutions to the problem to be presented to the user in the Controller's processNextBlackboardObject message.

5. What are the Dependents in your blackboard? Read about Dependent abstract class in Booch p427 and make sure your code uses them.


6. How do you differentiate between tracks you blackboard thinks might be good recommendations? 

Currently I just pick the next one in the Blackboard (subclass of OrderedCollection). I was trying to make Blackboard a priority queue by extending SortedCollection and providing a sortBlock to let Controller >> processNextBlacboardObject get the Assumption with the highest priority, but for an unknown reason instantiating my Blackboard when extending SortedCollection kept crashing my environment.

7. What is the user? Is the user a knowledge source now? Which portion of the blackboard does the user impact?

The user is technically a Knowledge Source that provides an initial Assumption (the startingTrack) and Assertions (they like an Assumption's track or not), but I didn't implement the user this way. The user influences the Blackboard by setting the startingTrack and rejecting or approving Assumptions (recommended tracks). When the user rejects an Assumption, it is removed from the Blackboard and its track is put in the rejected tracks collection maintained by the Blackboard to prevent the same track being reccomended multiple times by Knowledge Sources.


8. There seems to be a "short-term" and "long-term" portion of the blackboard. The short-term portion of the solution is to find a track to recommend next. The long-term solution is to find a track the user likes.
	a. How are these represented within your blackboard object?
	My Blackboard object represents the short-term portion with the startingTrack and its collection of BlackboardObjects (Assumptions with Tracks). One long-term portion is maintaining the list of rejected tracks so they aren't recommended again. A longer-term portion would be to record the rejected tracks for each user so they are not recommended in future sessions, or to record tracks they like to tune  Knowledge Sources to get recommendations based on these and not just the startingTrack. 

	b. What is the relationship between them?
	The startingTrack influences the recommendations that will be approved or rejected. The rejected tracks grow over time to limit future recommendations to tracks that we know the user won't like.

	c. When does each portion get updated, i.e., what is the "update-cycle" for each section? How do you perform this update?
	The short-term portion gets updated at the beginning and over the course of the session. The long-term portion doesn't gets upated as the user rejects tracks, but the longer-term portion of recording the user's rejected and approved tracks is not updated in the current implementation.

	d. How does each knowledge source influence the blackboard? In your answer, describe which knowledge sources influence which timescales, and how. Some may correspond to just one timescale, while others, both.
	In the current implementation, my SimilarTrackKnowledgeSource influences the very beginning by recommending the first Assumption. If its reccomendation is rejected, it influences the beginning of the long term by contributing to rejected tracks. My SimilarArtistsKnowledgeSource influences the beginning of the long-term by contributing additional Assumptions which may be rejected or approved. My TopTrackByTopListenersKnowledgeSource comes near the end to provide more Assumptions and is aware of the largest set of rejected tracks. My SimilarNumberListenersKnowledgeSource comes at the very end and trims down the remaining recommendations to the one with the greatest similarity in number of listeners to the starting trck.

9. Say you were reading on the internet and found a new knowledge source that was not the last.fm API, but a different one, that contained aural data about the song files themselves, such as the loudest frequencies at each second of a track.
How would you incorporate this knowledge source into your program? What parts of your design pattern you need to modify, and what parts of the code should NOT need to be modified? (Hint: the former group should be as small as possible, and the latter group as big as possible.)

I would add a KnowledgeSource that could find similar tracks based on the aural data and connect it to my Controller and let it create Assumptions (with Tracks). That's it.

Amend your UML diagram showing where the new knowledge source would be added and how it would interact with your current code.

10. Input a track of your choosing to your program, and get recommendations. Say "no" to your program at least 5 times, and eventually say "yes."
Provide the output for the entire recommendation session.

>>What artist would you like to start with? (enter song in next prompt)
Nirvana

>>What song by Nirvana would you like to start with?
All Apologies


For each recommendation, show explicitly why your code made the recommendation it did and justify that it behaved as expected.

For each "no" you respond with, describe how the state of your blackboard changes and justify that it behaved as expected.

Describe the state of your blackboard when/after you made your "yes" response, and describe in detail how the state of the blackboard differed from the state it began in, when you first input the track from which to begin the recommendation process.

For b-d, you may present the answers visually and with phrases instead of complete sentences and paragraphs, if you choose.

11. Does your program work better with more knowledge source? Informally describe the difference in behavior, as perceived by the user, between your program after just the first knowledge source, and your completed program. There are no wrong answers to this question.