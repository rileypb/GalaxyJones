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

To decide what text is the distance text of (n - a number):
	if n is 1:
		decide on "Nearby to";
	if n is 2:
		decide on "A couple of steps to";
	if n is 3:
		decide on "Far off tp";
		
To decide what text is the lcase distance text of (n - a number):
	if n is 1:
		decide on "nearby to";
	if n is 2:
		decide on "a couple of steps to";
	if n is 3:
		decide on "far off tp";

Movement text for a person (called P) (this is the standard movement text rule):
	let ol be original location of P;
	let nl be new location of P;
	let odist be the number of moves from the location to ol;
	let ndist be the number of moves from the location to nl;
	let dir be the noun part of the notable action of P;
	if ol is the location:
		if ol is open space and nl is not open space:
			rule succeeds with result "[The P] [head] [dir] into [the building of nl].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[The P] [head] [dir] out of [the building of ol].";
		otherwise if ol is not open space and nl is not open space and building of ol is not building of nl:
			rule succeeds with result "[The P] [head] [dir] into [the building of nl].";
		rule succeeds with result "[The P] [head] [dir].";
	otherwise if nl is the location:
		if ol is open space and nl is not open space:
			rule succeeds with result "[The P] [enter] [the building of nl] from the [best route from location to ol].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[The P] [emerge] from [the building of ol] to the [best route from location to ol].";
		otherwise if ol is not open space and nl is not open space and building of ol is not building of nl:
			rule succeeds with result "[The P] [enter] [the building of nl] from [the building of ol] to the [best route from location to ol].";
		rule succeeds with result "[The P] [approach] from the [opposite of dir].";
	otherwise if location farsees ol and location farsees nl:
		rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir].";
	otherwise if location farsees ol and location does not farsee nl:
		if building of ol is not building of nl and ol is not open space and nl is not open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] into [the building of nl].";
		otherwise if ol is open space and nl is open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] and out of sight.";
		otherwise if ol is open space and nl is not open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] into [the building of nl].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] out of [the building of ol].";
		otherwise if ol is not open space and nl is open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] and out of sight.";
		otherwise if ol is not open space and nl is not open space:
			rule succeeds with result "[distance text of odist] the [best route from location to ol], [the P] [head] [dir] and out of sight.";
	otherwise if location does not farsee ol and location farsees nl:
		if ol is not open space and nl is open space:
			rule succeeds with result "[distance text of ndist] the [best route from location to nl], [the P] [emerge] from [the building of ol].";
		otherwise if ol is open space and nl is open space:
			rule succeeds with result "[The P] [appear] [lcase distance text of ndist] the [best route from location to nl], coming from the [opposite of best route from ol to nl].";
		otherwise if ol is open space and nl is not open space:
			rule succeeds with result "[distance text of ndist] the [Best Route From Location To Nl], [the P] [enter] [the building of nl] from the [best route from nl to ol].";
		otherwise if building of ol is not building of nl and ol is not open space and nl is not open space:
			rule succeeds with result "[distance text of ndist] the [Best route from location to nl], [the P] [enter] [the building of nl] from [the building of ol] to the [best route from nl to ol].";
		otherwise if nl is not open space and nl is not open space:
			rule succeeds with result "[The P] [appear] [distance text of ndist] the [best route from location to nl], coming from the [opposite of best route from ol to nl].";

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
		repeat through the Table of Direction Segments:
			now the peeps entry is {};
		Repeat with AR running through the list of rooms which are farseen by the location:
			let X be the list of people who are in AR;
			add X to remote people;
			repeat with XX running through X:
				now XX is seen;
				now XX is familiar;
			remove not lazy from X;
			if X is not empty:
				let D be best route from the location to AR;
				let S be the number of moves from the location to AR;
				repeat through the Table of Direction Segments:
					if dir entry is D:
						if S is 1 and distance entry is 1:
							add X to peeps entry;
						if S is 2 and distance entry is 2:
							add X to peeps entry;
						if S > 2 and distance entry is 3:
							add X to peeps entry;
		Repeat through Table of Direction Segments:
			if peeps entry is not empty:
				let Y be a list of texts;
				Repeat with P running through peeps entry:
					add "[the P]" to Y;
				if distance entry is 1:
					add "[Y] nearby to the [dir entry]" to remote segments;
				if distance entry is 2:
					add "[Y] a couple of steps to the [dir entry]" to remote segments;
				if distance entry is 3:
					add "[Y] far off to the [dir entry]" to remote segments;
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
	if the action name part of the current action is the jumping on action and the location is the top of the elevator car and the mauve guard robot is in the elevator car-room:
		continue the action;
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
dir (a direction)	distance	peeps (a list of people)
north	1	--
north	2	--
north	3	--
northeast	1	--
northeast	2	--
northeast	3	--
east	1	--
east	2	--
east	3	--
southeast	1	--
southeast	2	--
southeast	3	--
south	1	--
south	2	--
south	3	--
southwest	1	--
southwest	2	--
southwest	3	--
west	1	--
west	2	--
west	3	--
northwest	1	--
northwest	2	--
northwest	3	--

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
