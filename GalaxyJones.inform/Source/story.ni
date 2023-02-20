"Galaxy Jones" by Philip Riley

Include Basic Screen Effects by Emily Short.

Include Galaxy Banner by Philip Riley.
Include Third Person Narration by Philip Riley.
Include Pseudocontainers by Philip Riley.

Volume 1 - Technical Stuff

To start header style:
	(- VM_Style(HEADER_VMSTY); -)
	
Before printing the banner text:
	if the screen width is less than 625:
		start header style;
		say "Galaxy Jones[line break]";
	print the galaxy banner;
	
Include (-
[ Banner;
   BeginActivity(PRINTING_BANNER_TEXT_ACT);
   if (ForActivity(PRINTING_BANNER_TEXT_ACT) == false) {
	   	!VM_Style(HEADER_VMSTY);
		!TEXT_TY_Say(Story);
		VM_Style(NORMAL_VMSTY);
		!new_line;
		TEXT_TY_Say(Headline);
		#ifdef Story_Author;
		print " by "; TEXT_TY_Say(Story_Author);
		#endif; ! Story_Author
		new_line;
		VM_Describe_Release();
		print " / Inform 7 build ", (PrintI6Text) NI_BUILD_COUNT, " ";
		print "(I6/v"; inversion;
		print " lib ", (PrintI6Text) LibRelease, ") ";
		#Ifdef STRICT_MODE;
		print "S";
		#Endif; ! STRICT_MODE
		#Ifdef DEBUG;
		print "D";
		#Endif; ! DEBUG
		new_line;
    }
    EndActivity(PRINTING_BANNER_TEXT_ACT);
];
-) instead of "Banner" in "Printing.i6t".

To say location-title-case:
	let L be the substituted form of "[location]" for comparison purposes;
	say "[L in title case]";

When play begins:
	now the left hand status line is "[location-title-case]";
	now the right hand status line is "[score] points";

Use scoring.
Use the serial comma.

Section 1 - Special text substitution code

Include (-
[ SubstituteForComparison to txt ;
    @push say__comp;
    say__comp = 1;
    TEXT_TY_SubstitutedForm(to, txt);
    @pull say__comp;
    return to;
];
-).
To decide what text is the substituted form of (T - text) for comparison purposes:
    (- SubstituteForComparison({-new:text}, {-by-reference:T}) -).

Section 2 - Some responses

the can't take what's fixed in place rule response (A) is "That can't be taken.".

Volume 2 - Actions

Shooting it with is an action applying to two things. Understand "shoot at/-- [something] with [something preferably held]", "fire at [something] with [something preferably held]" as shooting it with. Understand "shoot at/-- [something]", "fire at [something]" as shooting it with. Understand "shoot [something preferably held] at [something]", "fire [something preferably held] at [something]" as shooting it with (with nouns reversed).

Rule for supplying a missing second noun while shooting:
	now the second noun is the disruptor pistol;
	say "(with the disruptor pistol)[command clarification break]";
	
Check shooting something with something that is not the disruptor pistol:
	say "You can't fire [the second noun]!" instead;
	
Volume 3 - Plot

Lobby Shootout is a scene. Lobby Shootout begins when the player is in the lobby for three turns.
Lobby Shootout ends when the location of the red guard robot is not the lobby.

A guard robot is a kind of thing. The description is "Definitely not a friendly humanoid. More of a spiny killer with a disruptor turret mounted on its head.".
There is a guard robot called the red guard robot. It is undescribed.
There is a guard robot called the green guard robot. It is undescribed.

Check going during lobby shootout:
	say "Trying to reach an exit would surely get [us] shot." instead;
	
When Lobby Shootout begins:
	Move the red guard robot to the lobby;
	Move the green guard robot to the lobby;
	
Instead of looking during Lobby Shootout:
	say "Red and green guard robots criss-cross the lobby, stalking [us].[run paragraph on] ";
	
Every turn during lobby shootout:
	let roll be a random number between 1 and 10;
	if roll is 1:
		say "One of the robots fires directly above [our] head.";
	if roll is 2:
		say "The robots intone 'Destroy Jones' in droning repetition.";	
	if roll is 3:
		say "The [one of]green[or]red[purely at random] robot tries to flank [us], but a shot from [our] disruptor sends it scurrying back.";	
	if roll is 4:
		say "Zip! Disruptor fire scorches a nearby couch.";
	if roll is 5:
		say "The [one of]green[or]red[purely at random] robot fires a blistering shot into the front desk.";
	if roll is 6:
		say "The two robots coordinate fire over the desk, narrowly missing [us].";
	if roll >= 7:
		say paragraph break;

Volume 4 - Geography

Book 1 - Ground Floor

the speeder dock is a room. 

the entry doorway is north of Speeder Dock. The preposition is "at".

the entry door is a door. It is north of entry doorway and south of the lobby. It is scenery.

the elevator banks are north of the lobby.

A ground floor is a kind of room. It is privately-named. The printed name is "the ground floor". The preposition is "on".

ground-floor-1 is west of Lobby. It is a ground floor.

ground-floor-2 is north of ground-floor-1. It is a ground floor.

the elevator room is east of ground-floor-2.   It is a ground floor.

ground-floor-3 is north of ground-floor-2. It is a ground floor.

ground-floor-4 is east of ground-floor-3 and north of the elevator banks. It is a ground floor.

ground-floor-5 is east of ground-floor-4. It is a ground floor.

ground-floor-6 is south of ground-floor-5. It is a ground floor.

the maintenance closet is west of ground-floor-6.

ground-floor-7 is south of ground-floor-6 and east of the lobby. It is a ground floor.

the ground floor stairwell is east of the elevator banks.

Book 2 - Lower Elevator Shaft

the ground floor elevator shaft is west of the elevator banks.

the second floor elevator shaft is above the ground floor elevator shaft.

the third floor elevator shaft is above the second floor elevator shaft.

the fourth floor elevator shaft is above the third floor elevator shaft.

the fifth floor elevator shaft is above the fourth floor elevator shaft.

the sixth floor elevator shaft is above the fifth floor elevator shaft.

the seventh floor elevator shaft is above the sixth floor elevator shaft.

the eighth floor elevator shaft is above the seventh floor elevator shaft.

the ninth floor elevator shaft is above the eighth floor elevator shaft.

Book 3 - The Ninth Floor

The elevator door is a door. It is east of the ninth floor elevator shaft and west of the ninth floor elevator banks.

The ninth floor north hallway is north of the ninth floor elevator banks.

The ninth floor south hallway is south of the ninth floor elevator banks.

the Cybernetica office is east of ninth floor north hallway.

the Martian Chronicle office is east of ninth floor south hallway.

the north end of the Microthings office is west of ninth floor north hallway. the preposition is "at".

the south end of the Microthings office is west of ninth floor south hallway and south of the north end of the Microthings office. the preposition is "at".

Book 4 - The Tenth Floor

the tenth floor is a room. The preposition is "on".

To say sirius office name of (D - a direction):
	if D is north or D is south or D is east or D is west:
		say "the [dir] side of the Sirius Cybernetics office";
	otherwise:
		say "the [dir] corner of the Sirius Cybernetics office";

A sirius-room is a kind of room. It is privately-named. The printed name is "[sirius office name of dir]". A sirius-room has a direction called dir.
 
sirius-1 is a sirius-room. It is south of the tenth floor. The dir is south. The preposition is "on".
 
sirius-2 is a sirius-room. It is west of sirius-1. The dir is southwest. The preposition is "at".
 
sirius-3 is a sirius-room. It is north of sirius-2. The dir is west.The preposition is "on".
 
sirius-4 is a sirius-room. It is north of sirius-3. The dir is northwest. The preposition is "at".
 
sirius-5 is a sirius-room. It is east of sirius-4. The dir is north.The preposition is "on".
 
sirius-6 is a sirius-room. It is east of sirius-5. The dir is northeast. The preposition is "at".
 
sirius-7 is a sirius-room. It is south of sirius-6. The dir is east.The preposition is "on".
 
sirius-8 is a sirius-room. It is south of sirius-7 and east of sirius-1. The dir is southeast. The preposition is "at".

Book 5 - The Elevator

Book 6 - The 100th Floor

Book 7 - The Roof

Volume 5 - The Player Character
	
[Galaxy Jones is a woman in Prison.]
Player's surname is "Jones".
Player's titled name is "Galaxy Jones".
Understand "Galaxy/Jones" as yourself.

The player carries the disruptor pistol.

When play begins:
	now the player is not male;
	now the player is female;
	now the story viewpoint is third person singular;
	now the third singular pronoun of the player is she-pronoun;
	
Volume 6 - Room Implementations

Book 1 - Ground Floor

Chapter 1 -  Speeder Dock

The description of the speeder dock is "A safe harbor from the periodic dust storms of Utopia Planitia, the dock features several dozen speeder bays. Only a few are filled right now. The building entryway is to the north, under a red stone façade carved into the likeness of a fearsome Viking.".

The speeder-vehicle is a fixed in place thing in the speeder dock. It is privately-named. The printed name is "speeder". Understand "speeder/vehicle/car/landspeeder/galaxy/one" as speeder-vehicle. "[Our] speeder, Galaxy One, sits in one of the parking bays."
The description is "Galaxy One is a Dust Runner, a top-of-the-line model from Olympus Speedworks. It's deep crimson with tinted windows. Powerful turbines adorn vestigial wings that sweep back in severe rearward arcs.".

Check taking the speeder-vehicle:
	say "Stop being silly." instead;

Some windows are part of the speeder-vehicle. The description is "The tint is too dark to see through.".

Some turbines are part of the speeder-vehicle. The description is "The engines cause [us] to recoil from the waves of heat rolling off of them." Understand "engines/thrusters/turbine/engine/thruster" as turbines.
 
Some wings are part of the speeder-vehicle. The description is "Not technically necessary as the speeder works via anti-gravity, the blade-like wings nonetheless give the vehicle a certain flair unobtainable by any other means.".

Some parking bays are scenery in the speeder dock. "Most of the parking bays are unfilled."

Instead of entering the speeder-vehicle:
	say "You have a job to do here.";

The building entryway is a backdrop. It is in the speeder dock, entry doorway, and lobby. "[If the location is the lobby]The entryway (exit actually) leads out to the speeder dock.[otherwise]The entryway is dominated by the towering façade of a Viking king, namesake of the building itself.". Understand "entry/doorway/entrance/entranceway" as building entryway. Understand "exit" as building entryway when the location is the lobby.
	
Chapter 2 - Building Entryway

The description of the entry door is "A glass revolving door emblazoned with the symbol of a Viking kind astride the planet Mars."

Chapter 3 - Lobby

The description of the lobby is "The ground floor of the Viking Building is breathtaking. Low-G architecture means more glass and thinner supports, and the building takes advantage of that. Four walls of glass surround a central pillar in which are set the utility rooms and elevators. In between is an expanse of plants, water installations, and stylish seating. Near the entryway is a front desk. Above it floats suspended a giant crystal sculpture.".

The front desk is scenery in the lobby. It is a pseudocontainer. The contents description is "There's not much on the desk other than a note that says '82436'.". "There is nothing of interest on the front desk." 
The note is in the front desk. The description is "The note says '82436'.".

Instead of doing something when the location is the lobby for the first time:
	say "[italic type]Before [we] [get] a chance to do anything, two robot guards emerge from niches in the back wall! [We] [dive] behind the front desk and [draw] [our] disruptor pistol.[roman type][paragraph break]";
	
The giant sculpture is scenery in the lobby. Understand "art/artwork/Rambutan/glass/crystal/monstrosity" as the giant sculpture. "It's a huge crystal abstraction, provocative in its arrogance but evocative of nothing. A typical public installation by the artist Rambutan."
	
Report shooting a guard robot with the disruptor pistol:
	say "[one of]Oops, [we] [miss][or][We] [stick] [our] head out from behind the desk and squeeze off a shot at [the noun]. In [our] haste it goes wide of the target[or]A barrage of fire from the robots prevents [us] from firing[or]Oof. Big miss[at random]. [run paragraph on]";
	
Check shooting something with the disruptor pistol:
	if the noun is not a guard robot and the noun is not the giant sculpture:
		say "Shooting that would accomplish nothing.";
	
The tangled ruin is a fixed in place pseudocontainer. "Spread across the floor in a tangled ruin are the remains of a giant crystal sculpture and two guard robots." Understand "remains/sculpture/glass/guard/robots/robot/red/green" as the tangled ruin. 
The description is "You search some more, but nothing further turns up."
The contents description is "You dig through the ruins and find a thingy, which you take."
The tangled ruin is auto-take.
The thingy is in the tangled ruin.
	
Carry out shooting the giant sculpture with the disruptor pistol:
	say "[italic type][We] [fire] the disruptor into the sculpture's main support cable, snapping it. The huge crystal blob starts to sag, straining the other cables. In quick succession they break as well, and the whole installation plummets to the ground, right on top of the hapless guard robots.[roman type][paragraph break]";
	remove the red guard robot from play;
	remove the green guard robot from play;
	remove the giant sculpture from play;
	move the tangled ruin to the lobby;
	increase the score by 1;
	
[taking is acting recklessly.

Instead of acting recklessly during Lobby Shootout:
	say "As soon as [we] [start] to act, an energy beam zips past [our] head, forcing [us] back down behind the desk.";]

Volume 7 - Language

Book 1 - Verbs

to approach is a verb. to enter is a verb. to dive is a verb. to miss is a verb. to start is a verb. to fire is a verb. To draw is a verb. to stick is a verb.

Volume 8 - Prettiness

Book 1 - Moving Between Rooms 
 
Table of Transitions
source room (a room)	target room (a room)	transition text (a text)
speeder dock	entry doorway	"[We] [approach] the Viking Building entryway, the dramatic façade towering over [us]."
entry doorway	lobby	"[We] [enter] the lobby warily, alert to any defenses."

To decide which text is the transition for (source - a room) to (target - a room):
	repeat through the Table of Transitions:
		if (source room entry is source) and (target room entry is target):
			decide on transition text entry;
	decide on "none";

After going from a room (called R1) to a room (called R2): 
	let transition text be the transition for R1 to R2;
	if transition text is not "none":
		say "[transition text][paragraph break]";
	continue the action;
	
Book 2 - Points Banner

This is the new notify score changes rule:
	if the score is not the last notified score:
		print the galaxy banner;
		issue score notification message;
		now the last notified score is the score;
	
The new notify score changes rule is listed instead of the notify score changes rule in the turn sequence rules.

