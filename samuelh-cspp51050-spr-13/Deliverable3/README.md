CSPP51050 Deliverable 3 Sam Henry
==Implement the a music recommendation engine using the Blackboard architectural pattern

I solved Deliverable 3 using Squeak Smalltalk.

Download one-click image: Squeak: http://ftp.squeak.org/4.4/Squeak-4.4-All-in-One.zip

My solutions' classes have been filed out to CSPP51050-Deliverable3.st 

If you filein thes above .st file to your Squeak using the File Browser, you'll see my solution's classes.

To run, open your Squeak workspace and run 'do it' on the following:

	aBlackboard := Blackboard new.
	aBlackboard initialize.
	aController := PhoMREController new.
	aController blackboard: aBlackboard.
	aController connect: (SimilarArtistsKnowledgeSource new); connect:(SimilarTrackKnowledgeSource new); connect: (SimilarNumberListenersKnowledgeSource new); connect: (TopTrackByTopFansKnowledgeSource new).
	aBlackboard assertProblem.

Then, after entering your starting track, run 'do it' on this line to start the controller:

	aController loop.

Note that SimilarArtistsKnowledgeSource and TopTrackByTopFansKnowledgeSource take a while to evaluate the Blackboard because of their back and forth network traffic.


1. What are the "puzzle pieces" of your blackboard?
The main puzzle pieces are Blackboard, Controller, Knowledge Sources, Assumptions (with Tracks)

2. Is adding a new knowledge source to your program as easy as adding the first one? If not, describe why; then, describe a solution to make it so, and refactor your code accordingly. If so, explain the structure of your code that allows for this.

Yes. My Controller lets all connected Knowledge Sources have their say in the solution. All I have to do is create a new Knowledge Source and connect it to the Controller for it to work.

3. Do you have a Controller for your blackboard? If not, describe a solution to make it so, and refactor your code to include it. If so, explain how your Controller works.

Yes. My Controller works by attaching to the Blackboard, and then connecting with Knowledge Sources. It loops over its connected Knowledge Sources and asks them if they have anything to say. It selects the Knowledge Source that is applicable with the greatest priority and lets it evaluate the Blackboard. This lets it add Assumptions (containing possible solution Tracks) to the Blackboard.

4. Does this knowledge source need an Assumption? An Affirmation? Why, or why not? If it does and you haven't implemented it/them, make it so.

ALl of my knowledge sources create Assumptions, which are a subclass of Affirmation. The Assumptions contain possible solutions to the problem to be presented to the user in the Controller's processNextBlackboardObject message.

5. What are the Dependents in your blackboard? Read about Dependent abstract class in Booch p427 and make sure your code uses them.

KnowledgeSources are Dependents of Assumptions. I make use of Smalltalk's built in Dependents/Observer functionality to establish dependency and notify Knowledge Sources (who add the rejected Assumption to their rejected assumptions collection) when an Assumption is rejected.

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

I would add a KnowledgeSource that could find similar tracks based on the aural data and connect it to my Controller and let it create Assumptions (with Tracks). I'd also need to figure out a better way to store rejected tracks. Instead of establish a deep object equality functionality, I currently just use the LastFM url. Other than those minor steps, that's it.

10. Input a track of your choosing to your program, and get recommendations. Say "no" to your program at least 5 times, and eventually say "yes."
Provide the output for the entire recommendation session.

>>What artist would you like to start with? (enter song in next prompt)
Nirvana

>>What song by Nirvana would you like to start with?
All Apologies

>>Do you like Pennyroyal Tea by Nirvana ? Check itout at: http://www.last.fm/music/Nirvana/_/Pennyroyal+Tea
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by SimilarTrackKnowledgeSource, which was activated as the initial KnowledgeSource as specified by instructions - becomes applicable per embedded rules. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks ]

>>Do you like Celebrity Skin by Hole ? Check itout at: http://www.last.fm/music/Hole/_/Celebrity+Skin
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by SimilarArtistsKnowledgeSource, second KnowledgeSource as specified by instructions - becomes applicable per embedded rules. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks ]

>>Do you like God Save the Queen by Sex Pistols ? Check itout at: http://www.last.fm/music/Sex+Pistols/_/God+Save+the+Queen
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by TopTrackByTopFansKnowledgeSource, becomes applicable per embedded rules. Its Assumptions are placed before remaining SimilarArtistsKnowledgeSource's remaining Assumptions. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks ]

>>Do you like Would? by Alice in Chains ? Check itout at: http://www.last.fm/music/Alice+in+Chains/_/Would%3F
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by TopTrackByTopFansKnowledgeSource, becomes applicable per embeded rules. Its Assumptions are placed before remaining SimilarArtistsKnowledgeSource's remaining Assumptions. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks ]

>>Do you like Undertow by Warpaint ? Check itout at: http://www.last.fm/music/Warpaint/_/Undertow
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by TopTrackByTopFansKnowledgeSource, same as above. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks]

>>Do you like Voodoo by Godsmack ? Check itout at: http://www.last.fm/music/Godsmack/_/Voodoo
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by TopTrackByTopFansKnowledgeSource, same as above. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks]

>>Do you like Out of This World [*] by A$AP Rocky ? Check it out at: http://www.last.fm/music/A$AP+Rocky/_/Out+of+This+World+%5B*%5D
No
>>Okay. I'll find another recommendation. This may take a minute... Working...
[ suggested by TopTrackByTopFansKnowledgeSource, same as above. Blackboard loses one Assumption BlackboardObject, track is put in rejected tracks]

>>Do you like Crazy Little Thing Called Love by Queen ? Check it out at: http://www.last.fm/music/Queen/_/Crazy+Little+Thing+Called+Love
Yes
>>Great!
[ suggested by TopTrackByTopFansKnowledgeSource, same as above. Blackboard is now solved. It has an unretractable Assertion with the liked track. Blackboard has 7 rejected tracks ]


11. Does your program work better with more knowledge source? Informally describe the difference in behavior, as perceived by the user, between your program after just the first knowledge source, and your completed program. There are no wrong answers to this question.

I think it works better with more knowledge sources. Using just the similar tracks knowledge source, we mainly get more songs by the same artist. Using similar artists, top tracks by the top fans of the starting track, and then paring it down to the track with the most similar number of listeners before giving up, we get a nice variety of songs. 