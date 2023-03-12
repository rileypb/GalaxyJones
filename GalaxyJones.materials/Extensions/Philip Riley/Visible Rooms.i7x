Visible Rooms by Philip Riley begins here.

Use authorial modesty.

[[Room-examining is an action applying to one thing. ] Understand "examine [room]" as examining.

After deciding the scope of the player:
	place the location in scope;
	
Check examining a room when the noun is not the location:
	say text of the parser error internal rule response (E) instead;

Check examining a room when the noun is the location:
	try looking instead;
	
Rule for deciding whether all includes rooms: it does not.]

room-examining is an action applying to nothing. Understand "examine room" and "x room" and "search room" as room-examining.
Check room-examining:
	try looking instead;

A location-scenery is a kind of privately-named scenery thing. The printed name is "[location]".

Check examining a location-scenery:
	try looking instead;
	
Instead of doing something other than examining or implicit-quizzing when the noun is a location-scenery (this is the can only examine a location-scenery rule):
	say "That doesn't make sense." (A);
	
Instead of doing something when the second noun is a location-scenery (this is the block indirect object location-scenery rule):
	say "That doesn't make sense." (A);

Visible Rooms ends here.
