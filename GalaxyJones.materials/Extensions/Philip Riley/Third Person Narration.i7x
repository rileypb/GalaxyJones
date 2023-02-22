Third Person Narration by Philip Riley begins here.

Include Gender Options by Nathanael Nerode.

Volume 1 - Player Refs


Player's surname is a text that varies.
Player's titled name is a text that varies.

Rule for printing the name of the player:		
	say player's surname;

Understand "player" as yourself.

The examine undescribed things rule response (A) is "There seems to be nothing special about [regarding the noun][them].".

The parser error internal rule response (E) is "There's nothing like that nearby.".

An object can be always-indefinite. An object is usually not always-indefinite.

Carry out looking (this is the new room description heading rule): 
	say "[Player's titled name] is ";
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity:
			say "in the dark" (A);
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		say "[roman type][the preposition of the location][bold type] [if the visibility ceiling is always-indefinite][a visibility ceiling][otherwise][the visibility ceiling][end if]";
	otherwise:
		say "in [the visibility ceiling]";
	say roman type;
	say ". [run paragraph on]";
	let intermediate level be the visibility-holder of the actor;
	if visibility level count > 1:
		say "[We] [are]";
		repeat with intermediate level count running from 2 to the visibility level count:
			if the intermediate level is a supporter or the intermediate level is an animal:
				say " on [the intermediate level]" (B);
			otherwise:
				say " in [the intermediate level]" (C);
			let the intermediate level be the visibility-holder of the intermediate level;
		say ". [run paragraph on]";
	if the description of the location is "":
		say paragraph break;
	[say run paragraph on with special look spacing.]
	
The new room description heading rule is listed instead of the room description heading rule in the carry out looking rules.

For printing the locale description (this is the new you-can-also-see rule):
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity with the domain:
				if the domain is the location:
					say "Also here " (A);
				otherwise if the domain is a supporter or the domain is an animal:
					say "On [the domain] " (B);
				otherwise:
					say "In [the domain] " (C);
[				if the locale paragraph count is greater than 0:
					say "[regarding the player][can] also see " (D);
				otherwise:
					say "[regarding the player][can] see " (E);]
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing,
					list the contents of the common holder, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only, prefacing with is/are;
				otherwise say "[a list of marked for listing things including contents]";
				[if the domain is the location, say " here" (F);]
				say ".[line break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.
	
The new you-can-also-see rule is listed instead of the you-can-also-see rule in the for printing the locale description rules.

To stand is a verb.

The standard report waiting rule response (A) is "[We] [stand] around and [wait].".

The parser clarification internal rule response (D) is "Whom should [the noun] [parser command so far]?" 

The parser clarification internal rule response (E) is "What should [the noun] [parser command so far]?" 

Volume 2 - More about locations

A room has a text called the preposition. The preposition of a room is usually "in".

Third Person Narration ends here.
