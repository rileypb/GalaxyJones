"Galaxy Jones" by Phil Riley

Include Basic Screen Effects by Emily Short.
Include Deluxe Doors by Emily Short.

Include Exit Lister by Eric Eve.

Include Galaxy Banner by Philip Riley.
Include Third Person Narration by Philip Riley.
Include Pseudocontainers by Philip Riley.

Volume 1 - Technical Stuff

DEBUG is a truth state that varies. DEBUG is initially false.

To continue:
	if DEBUG is false:
		say "[bracket]continue[close bracket]";
		say paragraph break;
		wait for any key;

Table of New Exit Status
left	central (text)	right
"[location-title-case]"	""	"[score] points"
""	"[exit list]"	""

when play begins:
	now status exit table is Table of New Exit Status;

To start header style:
	(- VM_Style(HEADER_VMSTY); -)
	
Before printing the banner text:
	if the screen width is less than 0:
		start header style; 
		say "Galaxy Jones[line break]";
	otherwise:
		print the galaxy banner;	
		say line break;
		
After printing the banner text:
	say "[line break]A sleek dark red speeder roars into the dock of the Viking Building. A tall, strong woman in a battle-ready jumpsuit climbs out of it.";

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

[When play begins:
	now the left hand status line is "[location-title-case]";
	now the right hand status line is "[score] points";]

Use scoring.
Use the serial comma.

The room of stuff is a room.

Instead of going nowhere:
	     say "You can't go that way. [list the exits]";

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

the futile to throw things at inanimate objects rule response (A) is "[We] thinks twice and decides not to throw it after all.".

Volume 2 - Actions

Shooting it with is an action applying to two things. Understand "shoot at/-- [something] with [something preferably held]", "fire at [something] with [something preferably held]" as shooting it with. Understand "shoot at/-- [something]", "fire at [something]" as shooting it with. Understand "shoot [something preferably held] at [something]", "fire [something preferably held] at [something]" as shooting it with (with nouns reversed).

Rule for supplying a missing second noun while shooting:
	if the disruptor pistol is touchable:
		now the second noun is the disruptor pistol;
		say "(with the disruptor pistol)[command clarification break]";
	
Check shooting something with something that is not the disruptor pistol:
	say "[the second noun] isn't a firearm." instead;
	
Typing it on is an action applying to one number and one thing. Understand "type [number] on [something]", "enter [number] on [something]" as typing it on.

Check typing a number on something:
	say "[The second noun] can't be typed on.";
	
Volume 3 - Plot

Intro is a truth state that varies. Intro is initially true.

Rule for constructing the status line while Intro is true:
	do nothing;

When play begins:
	say "The phone rings. Galaxy Jones, the solar system's greatest hero, rolls over in bed and presses the talk button.[paragraph break]";
	say "'Yes?' she says in a voice thick with sleep.[paragraph break]";
	say "'Hello, is this Galaxy Jones?' comes the voice from the speaker.[paragraph break]";
	say "'Yes, this is she. To whom am I speaking?'[paragraph break]";
	say "'Oh, hi, Ms Jones. This is Patty, I work for Admiral P. X. Thallium, CEO of Diversified Entanglements, LLC. He asked me to forward a message to you.'[paragraph break]";
	say "'He did, did he? Now what would the Admiral want to say to me?'[paragraph break]";
	say "'Oh, it's not from the Admiral himself. It's from one Miss Europa Callisto. I must say, the Admiral was quite surprised when I said I didn't know who she is. Apparently she's famous.'[paragraph break]";
	say "'Yes, quite famous, but why would she send a message to me, and why on Mars would she send it through Thallium? But never mind, what's the message?'[paragraph break]";
	say "Patty can be heard rustling paper. 'Let's see... it's here somewhere. Oh yes, here it is. The message is ['][bold type]Help.[roman type][']'[paragraph break]";
	continue;
	say "Ten minutes later, Galaxy Jones, in her speeder Galaxy One, races across the desolate expanse of Utopia Planitia, Mars. Her nemesis, the thoroughly execrable Admiral Thallium, has taken the exquisite Europa Callisto, singer and actress renowned throughout a dozen solar systems, hostage. As Patty has quite helpfully explained, Miss Callisto is imprisoned at the top of the Viking Building in downtown New Reykjavik, guarded by an impressive number of killer robots and other diabolical instruments of Jones's no-doubt impending demise. The Admiral has invited Ms Jones most cordially to break into his building and attempt a rescue.[paragraph break]";
	say "'Oh I will,' Galaxy mutters to herself. This time, she vows silently, Thallium won't escape.[paragraph break]";
	say "Plus she'll get to meet Europa Callisto. That'll be totally sweet.[paragraph break]";
	now Intro is false;
	continue;

Lobby Shootout is a scene. Lobby Shootout begins when the player is in the lobby for three turns.
Lobby Shootout ends when the location of the red guard robot is not the lobby.

Check going during lobby shootout:
	say "Trying to reach an exit would surely get [us] shot." instead;
	
When Lobby Shootout begins:
	Move the red guard robot to the lobby;
	Move the green guard robot to the lobby;
	
After looking during Lobby Shootout:
	say "[one of]Red and green guard robots criss-cross the lobby, stalking [us][or]Two guard robots, one red, one green, prowl the lobby, trying to outflank [us][or]The guard robots, red and green, have their head cannons trained on the front desk[at random].";
	
Every turn during lobby shootout:
	let roll be a random number between 1 and 10;
	if roll is 1:
		say "One of the robots fires directly above [our] head.";
	if roll is 2:
		say "The robots intone 'Destroy Jones' in an eerie drone.";	
	if roll is 3:
		say "The [one of]green[or]red[purely at random] robot tries to flank [us], but a shot from [our] disruptor sends it scurrying back.";	
	if roll is 4:
		say "Zip! Disruptor fire scorches a nearby couch.";
	if roll is 5:
		say "The [one of]green[or]red[purely at random] robot fires a blistering shot into the front desk.";
	if roll is 6:
		say "The two robots coordinate fire over the desk, narrowly missing [us].";

Volume 4 - Things

The disruptor pistol is a thing. The description is "A compact instrument of death, with only one setting: kill.".

Does the player mean shooting something carried by the player with something:
	it is very unlikely;
	
The Atmo-Suit is a wearable thing. "There is an Atmo-Suit hanging from a hook here."
The description is "The Atmo-Suit is a pressure suit ideal for outside work in thin atmospheres like that of Mars."
Understand "atmo/suit/vacuum/atmosphere/pressure" as the Atmo-Suit.

The doorcode is a number that varies.

When play begins:
	now the doorcode is a random number between 10000 and 99999;
	if DEBUG is true:
		now the doorcode is 0;
		
A room can be atmo-thin.

After going from an atmo-thin room (called R1) to a room (called R2) when R2 is not atmo-thin:
	if the player is wearing the atmo-suit:
		silently try taking off the atmo-suit;
		[if the player is not wearing the atmo-suit:
			say "[We] doffs [the atmo-suit].";]
	continue the action;		
	
After looking when the location was atmo-thin and the location is not atmo-thin:
	if the player is not wearing the atmo-suit:
		say "[We] doffs [the atmo-suit].";

Before going from a room (called R1) to an atmo-thin room (called R2) when R1 is not atmo-thin:
	if the player is not wearing the atmo-suit:
		say "(first donning [the atmo-suit])[command clarification break]";
		if the atmo-suit is not touchable:
			say "The";
			stop the action;
		silently try wearing the atmo-suit;
		if the player is not wearing the atmo-suit:
			say "[We] can't go outside without an atmo-suit.";
			stop the action;
		
Check wearing the Atmo-Suit when the location is not atmo-thin:
	if the room gone to is nothing or the room gone to is not atmo-thin:
		say "[We] needs to be able to move around quickly. Better not wear the [Atmo-Suit]." instead;
		stop the action;
	
The drop key is a thing. "Leaning against the wall here is [a drop key]." The description is "A drop key is a special device used to open an elevator door from the outside." 

A thing can be an enemy.

A guard robot is a kind of enemy thing. The description is "Definitely not a friendly android. More of a spiny killer with a disruptor barrel mounted on its head.". Understand "guard" as a guard robot.
There is a guard robot called the red guard robot. It is undescribed.
There is a guard robot called the green guard robot. It is undescribed.

Check taking a guard robot:
	say "An interesting idea." instead;

Instead of attacking an enemy thing:
	say "You'll need to specify how [we] should attack [the noun]. For instance, you might say 'shoot [the noun] with [the disruptor pistol]'." 
	
A couch is a kind of enterable supporter. It is usually scenery.

Volume 5 - Geography

Book 1 - Ground Floor

the speeder dock is a room. The player is in the speeder dock.

the entry doorway is north of Speeder Dock. The preposition is "at".

the entry door is scenery in entry doorway.

the lobby is north of the entry doorway.

the ground floor elevator hall is north of the lobby.

the ground floor elevator door is a door. It is west of the ground floor elevator hall. The printed name is "elevator door". Through the ground floor elevator door is the ground floor elevator shaft. 

the ground floor elevator door-inside is a door. It is east of the ground floor elevator shaft. The printed name is "elevator door". Through the ground floor elevator door-inside is the ground floor elevator hall. The ground floor elevator door-inside is a half-door of the ground floor elevator door.

To say ground name of (D - a direction):
	if D is north or D is south or D is east or D is west:
		say "the [dir] side of the ground floor";
	otherwise:
		say "the [dir] corner of the ground floor";

A ground-floor is a kind of room. It is privately-named. The printed name is "[ground name of dir]". A ground-floor has a direction called dir.

ground-floor-1 is west of Lobby. It is a ground-floor. The dir is southwest.  The preposition is "at".

ground-floor-2 is north of ground-floor-1. It is a ground-floor. The dir is west. The preposition is "on".

the elevator-room-door is a door. It is privately-named. It is scenery. The printed name is "utility door". Understand "elevator/room/door/utility" as elevator-room-door. It is east of ground-floor-2. Through the elevator-room-door is the elevator room.
the elevator-room-door is closed, locked, lockable and openable. It has matching key the brass key.
The description is "It's a white metal door, completely typical. It has a keyed lock right above the handle.".

the elevator-room-door-inside is a door. It is privately-named. It is scenery. The printed name is "elevator room door". Understand "elevator/room/door" as elevator-room-door-inside. It is west of the elevator room. The elevator-room-door-inside is a half-door of the elevator-room-door. Through the elevator-room-door-inside is ground-floor-2.
The description is "It's a white metal door, completely typical. It has a keyed lock right above the handle.".

ground-floor-3 is north of ground-floor-2. It is a ground-floor. The dir is northwest. The preposition is "at".

ground-floor-4 is east of ground-floor-3 and north of the elevator hall. It is a ground-floor. The dir is north. The preposition is "on".

ground-floor-5 is east of ground-floor-4. It is a ground-floor. The dir is northeast. The preposition is "at".

ground-floor-6 is south of ground-floor-5. It is a ground-floor. The dir is east. The preposition is "on".

the closet door is a door. it is west of ground-floor-6. Through the closet door is the maintenance closet. 

the closet-door-inside is a door. It is privately-named. The printed name is "closet door". Understand "closet/door" as the closet-door-inside. It is east of the maintenance closet. Through the closet-door-inside is ground-floor-6. The closet-door-inside is a half-door of the closet door.

ground-floor-7 is south of ground-floor-6 and east of the lobby. It is a ground-floor. The dir is southeast. The preposition is "at".

the ground floor stairwell is east of the elevator hall.

Book 2 - Lower Elevator Shaft

the second floor elevator shaft is above the ground floor elevator shaft.

the third floor elevator shaft is above the second floor elevator shaft.

the fourth floor elevator shaft is above the third floor elevator shaft.

the fifth floor elevator shaft is above the fourth floor elevator shaft.

the sixth floor elevator shaft is above the fifth floor elevator shaft.

the seventh floor elevator shaft is above the sixth floor elevator shaft.

the eighth floor elevator shaft is above the seventh floor elevator shaft.

the ninth floor elevator shaft is above the eighth floor elevator shaft.

Book 3 - The Ninth Floor

The ninth floor elevator door is a door. It is east of the ninth floor elevator shaft and west of the ninth floor elevator hall.

The ninth floor north hallway is north of the ninth floor elevator hall.

The ninth floor south hallway is south of the ninth floor elevator hall.

the Cybernetica office is east of ninth floor north hallway.

the Martian Chronicle office is east of ninth floor south hallway.

the north end of the Microthings office is west of ninth floor north hallway. the preposition is "at".

the south end of the Microthings office is west of ninth floor south hallway and south of the north end of the Microthings office. the preposition is "at".

a ledge is east of the Cybernetica office. The preposition is "on". It is always-indefinite. a ledge is atmo-thin.

a window washing scaffold is a room. The preposition is "on". It is always-indefinite. a window washing scaffold is atmo-thin.

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
 
sirius-3 is a sirius-room. It is north of sirius-2. The dir is west. The preposition is "on".
 
sirius-4 is a sirius-room. It is north of sirius-3. The dir is northwest. The preposition is "at".
 
sirius-5 is a sirius-room. It is east of sirius-4. The dir is north.The preposition is "on".
 
sirius-6 is a sirius-room. It is east of sirius-5. The dir is northeast. The preposition is "at".
 
sirius-7 is a sirius-room. It is south of sirius-6. The dir is east.The preposition is "on".
 
sirius-8 is a sirius-room. It is south of sirius-7 and east of sirius-1. The dir is southeast. The preposition is "at".

Book 5 - The Elevator

Book 6 - The 100th Floor 

Book 7 - The Roof

Volume 6 - The Player Character
	
[Galaxy Jones is a woman in Prison.]
Player's surname is "Jones". 
Player's titled name is "Galaxy Jones".
Understand "Galaxy/Jones" as yourself.

The player-actual is a thing in the room of stuff. It is privately-named. It is proper-named. The printed name is "you, the player". Understand "me/myself" as the player-actual. The description is "You? I don't know who you are and I don't really care. If you need to know what you look like, just look at yourself, for heaven's sake."

After deciding the scope of the player:
	place the player-actual in scope; 
	 
After doing something to yourself:
	set pronouns from yourself;

The description of the player is "Galaxy Jones stands at the ready.".

The player carries the disruptor pistol.
 
When play begins:
	now yourself is not male;
	now yourself is not nomale;
	now yourself is female;
	now the story viewpoint is third person singular;
	now the third singular pronoun of yourself is she-pronoun; 	
	
After printing the name of yourself:
	set pronouns from yourself;
	
Instead of doing something other than examining to player-actual:
	say "Jones, or the narrator (that's the one who's talking right now), are unable to interact with you in any way, other than via keyboard and text, that is.";
	
Rule for reaching inside the room of stuff:
	allow access;
	
Instead of shooting yourself with something:
	say "Suicide is not an option.";
	
Volume 7 - Room Implementations

Book 1 - City Backdrops

First floor view of New Reykjavik is a backdrop. It is privately-named. It is in speeder dock, lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
	
The printed name is "outside".

The description is "Outside the building are the red-dusted streets of New Reykjavik."

Understand "city/planet/mars/outside/out" as first floor view of New Reykjavik.

Ninth floor view of New Reykjavik is a backdrop. It is privately-named. It is in south end of the Microthings office, north end of the Microthings office, ninth floor south hallway, ninth floor north hallway, Martian Chronicle office, Cybernetica office.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking Building stands near the periphery, overlooking the vast red plain of Utopia Planitia."
	
Understand "city/planet/mars/outside/out" as ninth floor view of New Reykjavik.

Perilous view of New Reykjavik is a backdrop. It is privately-named. It is in ledge, window washing scaffold.

The printed name is "the city".

The description is "From this perilous location, outside the comforting electrostatic field trapping the atmosphere of the building, one can see with striking clarity the lights of the city. The surrounding plains go on forever."

Understand "city/planet/mars/down" as perilous view of New Reykjavik.

Tenth floor view of New Reykjavik is a backdrop. It is privately-named. It is in sirius-1, sirius-2, sirius-3, sirius-4, sirius-5, sirius-6, sirius-7, sirius-8.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking building stands near the periphery, overlooking the vast red plain of Utopia Planitia."

Understand "city/planet/mars/outside/out" as tenth floor view of New Reykjavik.

Book 2 - Ground Floor

Chapter 1 -  Speeder Dock

The description of the speeder dock is "A safe harbor from the periodic dust storms of Utopia Planitia, the dock features several dozen speeder bays. Only a few are filled right now. The building entryway is to the north, under a red stone façade carved into the likeness of a fearsome Viking.".

The speeder-vehicle is a fixed in place thing in the speeder dock. It is privately-named. The printed name is "speeder". Understand "speeder/vehicle/car/landspeeder/galaxy/one" as speeder-vehicle. "[Our] speeder, Galaxy One, sits in one of the parking bays.".
The description is "Galaxy One is a Dust Runner, a top-of-the-line model from Olympus Speedworks. It's deep crimson with tinted windows. Powerful turbines adorn vestigial wings that sweep back in severe rearward arcs.".

Check taking the speeder-vehicle:
	say "Stop being silly." instead;

Some windows are part of the speeder-vehicle. The description is "The tint is too dark to see through.".

Some turbines are part of the speeder-vehicle. The description is "The engines cause [us] to recoil from the waves of heat rolling off of them." Understand "engines/thrusters/turbine/engine/thruster" as turbines.
 
Some wings are part of the speeder-vehicle. The description is "Not technically necessary as the speeder works via anti-gravity, the blade-like wings nonetheless give the vehicle a certain flair unobtainable by other means.". Understand "arcs" as wings.

Some parking bays are scenery in the speeder dock. Understand "bay/spots/spot/places/place" as parking bays. "Most of the parking bays are unfilled."

Instead of entering the speeder-vehicle:
	say "[We] has a job to do here.";

The building entryway is a backdrop. It is in the speeder dock, entry doorway, and lobby. "[If the location is the lobby]The entryway (exit actually) leads out to the speeder dock.[otherwise]The entryway is dominated by the towering façade of a Viking king, namesake of the building itself.". Understand "entry/doorway/entrance/entranceway/facade/façade/red/stone/viking" as building entryway. Understand "exit" as building entryway when the location is the lobby.
	
Chapter 2 - Building Entryway

The description of the entry doorway is "A glass revolving door leads into a large open space north of here. The speeder dock is to the south.".

The description of the entry door is "A glass revolving door emblazoned with the symbol of a Viking kind astride the planet Mars."

Chapter 3 - Lobby

The description of the lobby is "The ground floor of the Viking Building is breathtaking. Low-G architecture means more glass and thinner supports, and the building takes advantage of that. Four walls of glass surround a central pillar in which are set the utility rooms and elevators. In between is an expanse of plants, water installations, and stylish seating. Near the entryway is a front desk[if the giant sculpture is in the lobby]. Above it floats, suspended on almost invisible cables, a giant crystal sculpture[end if]. You may go east and west from here, north to the elevators, or south out of the building.".

The front desk is scenery in the lobby. It is a pseudocontainer. The contents description is "There's not much on the desk other than a note that says '[doorcode]'.". "There is nothing of interest on the front desk." 
The note is in the front desk. The description is "The note says '[doorcode]'.".

Instead of doing something when the location is the lobby for the first time:
	say "Before [we] [get] a chance to do anything, two robot guards emerge from niches in the back wall! [We] [dive] behind the front desk and [draw] [our] disruptor pistol.[paragraph break]";
	
The giant sculpture is scenery in the lobby. Understand "art/artwork/Rambutan/glass/crystal/abstraction/cables/installation" as the giant sculpture. "It's a huge crystal abstraction, provocative in its arrogance but evocative of nothing. A typical public installation by the artist Rambutan. It's held up by metal cables."
	
Report shooting a guard robot with the disruptor pistol during Lobby Shootout:
	say "[one of]Oops! [we] [miss][or][We] [stick] [our] head out from behind the desk and squeezes off a shot at [the noun]. In [our] haste it goes wide of the target[or]A barrage of fire from the robots prevents [us] from firing[or]Oof. Big miss[or][Our] shot hits [the noun] dead on, but nothing happens, almost as if the robot had absorbed the energy[or]A perfect shot! Yet, somehow, the robot is unscathed[at random].";
	
Check shooting something with the disruptor pistol:
	if the noun is not a guard robot and the noun is not the giant sculpture:
		say "Shooting that would accomplish nothing.";
	 
The tangled ruin is a fixed in place pseudocontainer. "Spread across the floor in a tangled ruin are the remains of a giant crystal sculpture and two guard robots." Understand "remains/sculpture/art/glass/guard/robots/robot/red/green/ruins" as the tangled ruin. 
The description is "[We] searches some more, but nothing further turns up."
The contents description is "[We] digs through the ruins and finds a thingy, which [we] takes."
The tangled ruin is auto-take.
The thingy is in the tangled ruin.
	
Carry out shooting the giant sculpture with the disruptor pistol:
	say "[We] [fire] the disruptor into the sculpture's main support cable, snapping it. The huge crystal blob starts to sag, straining the other cables. In quick succession they break as well, and the whole installation plummets to the ground, right on top of the hapless guard robots.[paragraph break]";
	remove the red guard robot from play;
	remove the green guard robot from play;
	remove the giant sculpture from play;
	move the tangled ruin to the lobby;
	increase the score by 1;
	
entering is acting recklessly.
taking is acting recklessly.
jumping is acting recklessly.

Instead of acting recklessly during Lobby Shootout:
	say "As soon as [we] [start] to act, an energy beam zips past [our] head, forcing [us] back down behind the desk.";
	
The tasteful couch is a couch in the lobby. "Quite tasteful for a homicidal madman, really."
	
Chapter 4 - Ground Floor

Section 1 - ground-floor-1

The description of ground-floor-1 is "A lush waterfall here contrasts with the dusty red desolation of Mars beyond the window. The ground floor extends north and east."

The waterfall is a scenery pseudocontainer in ground-floor-1. "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again." The contents description is "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again. A single coin sits on the bottom of the basin." 

The coin is in the waterfall. The description is "A One Areo coin, with Ares on the front and the Viking 2 lander on the back.".

Section 2 - ground-floor-2

The description of ground-floor-2 is "Semicircular couches open on either side of a central carpeted path leading north and south. Set in the central pillar of the building to the east is a utility door."

The east semicircular couch is a couch in ground-floor-2. The description is "An inoffensive beige couch, shaped in a half-circle, opening towards the west.".
The west semicircular couch is a couch in ground-floor-2. The description is "An inoffensive beige couch, shaped in a half-circle, opening towards the east.".

The central carpeted path is scenery in ground-floor-2. The description is "A strip of grey carpet running north to south, in the midst of the marble floor. (Incidentally, the massive expense of moving real marble from Earth to the Mars is just further proof of Thallium's madness, seriously.)";

The ground floor central pillar is a backdrop. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description is "The central area where the elevators and utility rooms are."

Section 3 - ground-floor-3

The description of ground-floor-3 is "A large relief map of mars is mounted on the north wall here. One can leave here to the south or east.".

The large relief map of mars is scenery in ground-floor-3. "The map is crafted of bronze and sports a star at the site of New Reykjavik.";

Section 4 - ground-floor-4

The description of ground-floor-4 is "The area is dominated by a towering statue of Admiral Thallium. The ground floor extends west and east from here. The elevator is to the south."

The statue of admiral thallium is scenery in ground-floor-4. The description is "His nauseating visage seems to leer at [us], and [we] suppresses a shiver of disgust.".

Section 5 - ground-floor-5

The description of ground-floor-5 is "The area is dedicated to celebrating the military career of Admiral Thallium. Uniforms, medals, ribbons, and other miscellanea are mounted on the wall or in showcases. All this despite the fact that no one has turned up any evidence that Thallium served in any navy of any country on any planet.".

Some military-detritus are scenery pseudocontainer in ground-floor-5. They are privately-named. The printed name is "medals, ribbons, and all". Understand "uniforms/uniform/medals/medal/ribbons/ribbon/miscellanea/showcases" as military-detritus.
The contents description is "[We] yawns looking over the assortment of faux honors. They're all behind glass, but one of the display cases is partly open, leaving the rather garish medal inside unprotected.".
"There's a remarkable array of faux honors here, all behind glass. One of the display cases is partly open and empty of the medal it once held."

The garish medal is in the military-detritus.


Section  6- ground-floor-6

The description of ground-floor-6 is "Apparently some kind of function was happening here before Admiral Thallium commandeered the building, for there is an array of canapes on a catering table here. The floor stretches north and south, and there's a closet door to the west."

The catering table is a scenery pseudocontainer in ground-floor-6. "The table is covered with a wide array of treats from the ridiculously expensive, such as shrimp tea sandwiches (where do you get shrimp on Mars?), to the just plain ridiculous, like poached ostrich eggs in jelly. A good number of forks are laid out to one side.". 
The catering table contains a fork. The catering table contains a shrimp tea sandwich. The catering table contains poached ostrich eggs in jelly.
Understand "silverware/forks" as the fork.
Understand "canape" as the shrimp tea sandwich.
The shrimp tea sandwich is edible.

Check eating the shrimp tea sandwich:
	say "You're not hungry." instead;

Check taking the poached ostrich eggs: 
	say "Don't even." instead; 
	

Section 7 - ground-floor-7

The description of ground-floor-7 is "".

Chapter 5 - Maintenance Closet

The closet door is closed, lockable, openable, and locked.
A keypad is a part of the closet door.

Check opening the closet door when the closet door is locked:
	say "[We] will have to enter the correct code on the keypad first." instead;
	
Instead of typing doorcode on the keypad:
	say "An indicator light glows green.";
	now the closet door is unlocked;
	
Instead of typing a number on the keypad:
	say "An indicator light blinks red.";	
	
Does the player mean typing a number on the keypad:
	it is very likely.
	
Check unlocking keylessly the closet door:
	say "[We] will have to enter the correct code on the keypad." instead;
	
Check unlocking the closet door with something:
	say "[We] will have to enter the correct code on the keypad instead." instead;

The brass key is on the shelf.
The shelf is scenery in the maintenance closet.

The Atmo-Suit is in the maintenance closet.

Chapter 6 - Ground Floor Elevator Hall

Chapter 7 - Elevator Room

The drop key is in the elevator room. 

Chapter 8 - Ground Floor Stairwell

Book 3 - Elevator Shaft

Book 4 - Ninth Floor

Book 5 - Tenth Floor

Volume 8 - Language

Book 1 - Verbs

to approach is a verb. to enter is a verb. to dive is a verb. to miss is a verb. to start is a verb. to fire is a verb. To draw is a verb. to stick is a verb.

Volume 9 - Prettiness

Book 1 - Moving Between Rooms 
 
Table of Transitions
source room (a room)	target room (a room)	transition text (a text)	shown (a number)
speeder dock	entry doorway	"[We] [approach] the Viking Building entryway, the dramatic façade towering over [us]."	--
entry doorway	lobby	"[We] passes through the revolving door and into the lobby, alert to any defenses."
the Cybernetica office	ledge	"[We] climbs out the window."

To decide which text is the transition for (source - a room) to (target - a room):
	repeat through the Table of Transitions:
		if (source room entry is source) and (target room entry is target) and there is no shown entry:
			decide on transition text entry;
	decide on "none";
	
To mark transition text for (source - a room) to (target - a room) as used:
	repeat through the Table of Transitions:
		if (source room entry is source) and (target room entry is target) and there is no shown entry:
			now shown entry is 1;

After going from a room (called R1) to a room (called R2): 
	let transition text be the transition for R1 to R2;
	if transition text is not "none":
		say "[transition text][paragraph break]";
		mark transition text for R1 to R2 as used;
	continue the action;
	
Book 2 - Points Banner

This is the new notify score changes rule:
	if the score is not the last notified score:
		print the galaxy banner;
		issue score notification message;
		now the last notified score is the score;
	
The new notify score changes rule is listed instead of the notify score changes rule in the turn sequence rules.

Volume 10 - Not for release

DEBUG is true.
