Open Spaces by Philip Riley begins here.

Use authorial modesty.

include Essentials by Philip Riley.

A room can be open space.

farseeing relates rooms to each other. The verb to farsee (he farsees, they farsee, he farsaw, it is farseen) implies the farseeing relation.

A structure is a kind of thing. 

Comprisal relates one structure (called the building) to various rooms. The verb to comprise (he comprises, they comprise, he comprised, it is comprised) implies the comprisal relation.

Doing nothing is an action applying to nothing.

A person has an action called notable action. The notable action of a person is usually doing nothing.
A person has a room called original location.
A person has a room called new location.
A person can be active or not-active. A person is usually not-active.

to appear is a verb. to exit is a verb. to head is a verb. to enter is a verb. to emerge is a verb. to approach is a verb.

After an actor doing something when the actor is not the player:
	now the notable action of the actor is the current action;
	continue the action;
	
After an actor going from a room (called R) to a room (called AR):
	now the original location of actor is R;
	now new location of actor is AR;
	continue the action;
	
[Moved Once is a truth state that varies.
After printing the locale description of a room when Moved Once is false:
	follow the show us the people rule;
	
[force printing the description before the first turn.]
After the player doing something when Moved Once is false:
	Now Moved Once is true.]
		
Report an actor going a direction (called dir) when the actor is not the player:
	say the text produced by the movement text rules for actor;
	say line break;
	stop; 
	

Movement text is an object-based rulebook producing texts.

Movement text for a person (called P) (this is the standard movement text rule):
	let ol be original location of P;
	let nl be new location of P;
	if ol is the location:
		if ol is open space and nl is not open space:
			rule succeeds with result "[The P] [head] [noun part of the notable action of P] into [the building of nl].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[The P] [head] [noun part of the notable action of P] out of [the building of ol].";
		otherwise if ol is not open space and nl is not open space and building of ol is not building of nl:
			rule succeeds with result "[The P] [head] [noun part of the notable action of P] into [the building of nl].";
		rule succeeds with result "[The P] [head] [noun part of the notable action of P].";
	otherwise if nl is the location:
		if ol is open space and nl is not open space:
			rule succeeds with result "[The P] [enter] [the building of nl] from the [best route from location to ol].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[The P] [emerge] from [the building of ol] to the [best route from location to ol].";
		otherwise if ol is not open space and nl is not open space and building of ol is not building of nl:
			rule succeeds with result "[The P] [enter] [the building of nl] from [the building of ol] to the [best route from location to ol].";
		rule succeeds with result "[The P] [approach] from the [opposite of noun part of the notable action of P].";
	otherwise if location farsees ol and location farsees nl:
		rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P].";
	otherwise if location farsees ol and location does not farsee nl:
		if building of ol is not building of nl and ol is not open space and nl is not open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] into [the building of nl].";
		otherwise if ol is open space and nl is open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] and out of sight.";
		otherwise if ol is open space and nl is not open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] into [the building of nl].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] out of [the building of ol].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] and out of sight.";
		otherwise if ol is not open space and nl is not open space:
			rule succeeds with result "To the [best route from location to ol], [the P] [head] [noun part of the notable action of P] and out of sight.";
	otherwise if location does not farsee ol and location farsees nl:
		if ol is not open space and nl is open space:
			rule succeeds with result "To the [best route from location to nl], [the P] [emerge] from [the building of ol].";
		otherwise if ol is open space and nl is open space:
			rule succeeds with result "[The P] [appear] to the [best route from location to nl], coming from the [opposite of best route from ol to nl].";
		otherwise if ol is open space and nl is not open space:
			rule succeeds with result "To the [Best Route From Location To Nl], [the P] [enter] [the building of nl] from the [best route from nl to ol].";
		otherwise if building of ol is not building of nl and ol is not open space and nl is not open space:
			rule succeeds with result "To the [Best route from location to nl], [the P] [enter] [the building of nl] from [the building of ol] to the [best route from nl to ol].";
		otherwise if nl is not open space and nl is not open space:
			rule succeeds with result "[The P] [appear] to the [best route from location to nl], coming from the [opposite of best route from ol to nl].";

Remote People is a list of objects that varies.

Definition: a person is lazy if his notable action is doing nothing.
Definition: a thing is here if it is in the location. 

This is the show us the people rule:
	now remote people is { };
	let Not lazy be a list of people;
	Let segments be a list of texts;
	let movement segments be a list of texts;
	Let lazy people be a list of people;
	Repeat with P running through active people who are not the player:
		If the notable action of P is doing nothing:
			add P to lazy people;
		otherwise if the action name part of the notable action of P is going action:
			let MT be the text produced by the movement text rules for P;
			add MT to movement segments;
			add P to not lazy;
		otherwise if P is not in the location:
			add P to lazy people;
	let LPH be filter to available of lazy people;
	now LPH is filter to here of LPH;
	let LPNH be filter to not available of lazy people;
	if LPH is not empty:	
		now LPH is filter to marked to be listed last of LPH;
		if LPH is not empty:			
			let Y be a list of texts;
			Repeat with P running through LPH:
				add "[the P]" to Y;
			add "[We] [see] [Y] here." to segments;
	if LPNH is not empty:
		Let remote segments be a list of texts;
		now the peeps corresponding to a dir of north in Table of Direction Segments is { };
		now the peeps corresponding to a dir of northeast in Table of Direction Segments is { };
		now the peeps corresponding to a dir of east in Table of Direction Segments is { };
		now the peeps corresponding to a dir of southeast in Table of Direction Segments is { };
		now the peeps corresponding to a dir of south in Table of Direction Segments is { };
		now the peeps corresponding to a dir of southwest in Table of Direction Segments is { };
		now the peeps corresponding to a dir of west in Table of Direction Segments is { };
		now the peeps corresponding to a dir of northwest in Table of Direction Segments is { };
		Repeat with AR running through the list of rooms which are farseen by the location:
			let X be the list of people who are in AR;
			add X to remote people;
			repeat with XX running through X:
				now XX is seen;
				now XX is familiar;
			remove not lazy from X;
			if X is not empty:
				let D be best route from the location to AR;
				choose the row with dir of D in Table of Direction Segments;
				add X to peeps entry;
		Repeat through Table of Direction Segments:
			if peeps entry is not empty:
				let Y be a list of texts;
				Repeat with P running through peeps entry:
					add "[the P]" to Y;
				add "[Y] to the [dir entry]" to remote segments;
		If remote segments is not empty:
			add "[We] [see] [the remote segments]." to segments;
	if segments is not empty:
		repeat with seg running through segments:
			say "[the seg] [run paragraph on]";
		say "[paragraph break]";
	[if movement segments is not empty:
		let count be 0;
		Repeat with seg running through movement segments:
			if seg is not empty:
				increment count;
				say "[seg] [run paragraph on]";
		if count > 0, say "[paragraph break]";]
	repeat with P running through people:
		now the notable action of P is doing nothing;

After deciding the scope of the player:
	repeat with R running through rooms farseen by the location:
		place R in scope;
		
After actor doing something when the actor is not in location:
	if the action name part of the current action is not going action:
		stop;
	continue the action;
	
Before doing something to the mauve guard robot (this is the check object is interactible rule):
	if the action requires a touchable noun and the noun is the mauve guard robot:
		say "[We] can't reach [the noun].";
		stop the action;
	if the action requires a touchable second noun and the second noun is the mauve guard robot:
		say "[We] can't reach [the second noun].";
		stop the action;
[	if the action requires light and the noun is listed in remote people:
		say "[The noun] is too far away to do that.";
		stop the action;
	if the action requires light and the second noun is listed in remote people:
		say "[The second noun] is too far away to do that.";
		stop the action;	]	
		
The show us the people rule is listed last in the turn sequence rules.

Table of Direction Segments
dir (a direction)	peeps (a list of people)
north	--
northeast	--
east	--
southeast	--
south	--
southwest	--
west	--
northwest	--

A person can be marked to be listed last.

Before printing the locale description:
	Repeat with P running through the available people who are not the player:
		Now P is marked to be listed last;
		
[The declare people marked to be listed last rule is listed first in the printing room description details rules.]

For printing a locale paragraph about a thing (called the item):
	if the item is a person:
		set the locale priority of the item to 0;
	continue the activity.

After printing the name of a person (called P):
	now P is not marked to be listed last;

[After writing a paragraph about a person (called P) (this is the don't list people twice rule):
	say "foo";
	Now P is not marked to be listed last;
	continue the activity;]


Open Spaces ends here.
