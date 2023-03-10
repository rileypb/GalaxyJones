Visible Rooms by Philip Riley begins here.

Use authorial modesty.

Room-examining is an action applying to one thing. Understand "examine [room]", or "x [room]" as room-examining.

After deciding the scope of the player:
	place the location in scope;
	
Check room-examining a room when the noun is not the location:
	say text of the parser error internal rule response (E) instead;

Carry out room-examining a room when the noun is the location:
	try looking;
	
Instead of doing something other than room-examining or implicit-quizzing when the noun is a room (this is the can only examine a room rule):
	say "That doesn't make sense." (A);
	
Instead of doing something other than quizzing when the second noun is a room (this is the second can only examine a room rule):
	say "That doesn't make sense." (A);
	
Rule for deciding whether all includes rooms: it does not.

Visible Rooms ends here.
