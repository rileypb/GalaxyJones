"Galaxy Jones" by Phil Riley

Include Basic Screen Effects by Emily Short.
Include Deluxe Doors by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Skeleton Keys by Emily Short.

Include Epistemology by Eric Eve. 
[Include Exit Lister by Eric Eve.]
Include Conversation Framework by Eric Eve.

Include Galaxy Banner by Philip Riley.
Include Third Person Narration by Philip Riley.
Include Pseudocontainers by Philip Riley.
[Include Look That Way by Philip Riley.]
Include Use by Philip Riley.   
Include Open Spaces by Philip Riley.
Include Visible Rooms by Philip Riley.

Release along with cover art.
Release along with a "Quixe" interpreter.
 
Volume 1 - Technical Stuff


DEBUG is a truth state that varies. DEBUG is initially false.
 
To continue: 
	if DEBUG is false:
		say "[bracket]continue[close bracket]"; 
		say paragraph break; 
		wait for any key;

[Table of New Exit Status
left	central (text)	right
"[location-title-case]"	""	"[score] points"
""	"[exit list]"	""]

[when play begins: 
	now status exit table is Table of New Exit Status;]

To start header style: 
	(- VM_Style(HEADER_VMSTY); -)
	
To say header style:
	start header style;
	
Before printing the banner text:
	if the screen width is less than 0:
		start header style; 
		say "Galaxy Jones[line break]";
	otherwise:
		print the galaxy banner;	
		say line break;
		
Before looking for the first time:
	say "[line break]A sleek dark red speeder roars into the dock of the Viking Building. A tall, strong woman in a battle-ready jumpsuit climbs out of it: [header style]Galaxy Jones.[roman type][line break]";

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

Use scoring.
Use the serial comma.

The room of stuff is a room. "this is a secret message.".

[Instead of going nowhere:
	     say "[We] can't go that way. [list the exits]";]
	
To score (n - number):
	print the galaxy banner;
	increase score by n;
	follow the notify score changes rule;

The parser nothing error internal rule response (B) is "I'm not sure what you're referring to.".

To lb:
	say line break;

Book 1 - Special text substitution code

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

Book 2 - Some responses
 
the can't take what's fixed in place rule response (A) is "That can't be taken.".

the futile to throw things at inanimate objects rule response (A) is "[We] thinks twice and decides not to throw it after all.".

Book 3 - Glulx Styles

Table of User Styles (continued)
style name	color	italic	indentation
special-style-1	"#0000FF"	false	19
special-style-2	"#0000FF"	true	19

Book 4 - Post-look text queueing

Post-look is a list of texts that varies.

To queue (T - a text):
	add T to Post-Look;
	
After looking:
	repeat with T running through Post-look:
		say T;
		say paragraph break;
	remove Post-look from Post-look;
	continue the action;

Volume 2 - Actions

Shooting it with is an action applying to one visible thing and one carried thing. Understand "shoot at/-- [something] with [something]", "fire at [something] with [something]" as shooting it with. Understand "shoot at/-- [something]", "fire at [something]" as shooting it with. Understand "shoot [something] at [something]", "fire [something] at [something]" as shooting it with (with nouns reversed).

Rule for supplying a missing second noun while shooting:
	if the disruptor pistol is touchable:
		now the second noun is the disruptor pistol;
	
Check shooting something with something that is not the disruptor pistol:
	say "[the second noun] isn't a firearm." instead;
	
Typing it on is an action applying to one number and one thing. Understand "type [number] on [something]", "enter [number] on [something]" as typing it on.

Check typing a number on something:
	say "[The second noun] can't be typed on.";

Looking behind is an action applying to one thing. Understand "look behind [something]" as looking behind.

Check looking behind:
	say "[We] finds nothing of note." instead;
	
Understand the command "unscrew" as something new.
Unscrewing it with is an action applying to one thing and one carried thing. Understand "unscrew [something]" or "unscrew [something] with [something]" as unscrewing it with.

Rule for supplying a missing second noun:
	if the screwdriver is touchable:
		now the second noun is the screwdriver;
		
Check unscrewing something with something when the second noun is not the screwdriver:
	say "That doesn't work." instead;
	
Check unscrewing something with something when the second noun is the screwdriver:
	say "That can't be unscrewed." instead;
	
Jumping on is an action applying to one thing. Understand "jump on/-- [something]" as jumping on.

Check jumping on something which is not a guard robot:
	say "Sounds like fun. Maybe later after [we] has saved Europa.";
	
Pouring is an action applying to one carried thing. Understand "pour [something]" as pouring.

Check pouring a non-pourable thing:
	say "That can't be poured.";
	
Check pouring a pourable thing:
	say "That would just make a mess.";
	
Pouring it on is an action applying to one carried thing and one thing. Understand "pour [something] on/in/into [something]" as pouring it on.

A thing can be pourable or non-pourable. A thing is usually non-pourable.

Check pouring a non-pourable thing on something:
	say "That can't be poured.";

Check pouring a pourable thing on something:
	say "That would just make a mess."
	
Unwrapping is an action applying to one thing. Understand "unwrap [something]" as unwrapping.

Check unwrapping something:
	say "That can't be unwrapped.";
	
Understand the command "buy" as something new.
Buying it with is an action applying to one thing and one carried thing. Understand "buy [something] with [something]" as buying it with.

Volume 3 - The Player Character
	
Player's surname is "Jones". 
Player's titled name is "Galaxy Jones".
Understand "Galaxy/Jones/woman" as yourself.

[The player-actual is a thing in the room of stuff. It is privately-named. It is proper-named. The printed name is "you, the player". Understand "me/myself" as the player-actual. The description is "You, the player, issue the commands to make Galaxy Jones go."]

[After deciding the scope of the player:
	place the player-actual in scope; ]
	 
After doing something to yourself:
	set pronouns from yourself;
	continue the action;

The description of the player is "Galaxy Jones stands at the ready.".

The player carries the disruptor pistol. 

Check throwing the disruptor pistol at something:
	say "That would be counter-productive." instead; 

When play begins:
	now yourself is not male;
	now yourself is not nomale;
	now yourself is female;
	now the story viewpoint is third person singular;
	now the third singular pronoun of yourself is she-pronoun; 	
	
After printing the name of yourself:
	set pronouns from yourself;
	
[Instead of doing something other than examining to player-actual:
	say "Jones, or the narrator (that's the one who's talking right now), are unable to interact with you in any way, other than via keyboard and text, that is.";]
	
Rule for reaching inside the room of stuff:
	allow access;
	
Instead of shooting yourself with something:
	say "Suicide is not an option.";
	
Volume 4 - NPCs

Book 1 - Beck

Beck is a man in the room of stuff. The description is "Beck isn't exactly handsome, but he exudes a confidence that makes him memorable."

Europa Callisto is a woman. The description is "Europa Callisto is a stunningly beautiful woman with long ice-blue hair and piercing blue eyes. Right now she's looking pretty ragged, though."

Admiral-Thallium is a man. He is privately-named. The printed name is "Admiral Thallium". Understand "Admiral/Thallium" as Admiral-Thallium. He is familiar. He is seen. The description is "The 'Admiral' is a disctinctly ridiculous figure. He dresses in a mockery of a Martian admiral's uniform, plastered with medals. His hair is slicked back and his mustache is painstakingly waxed."

Book 2 - Conversation

An object has a text called the conversation.
An object can be used or unused. An object is usually unused.

To converse (T - a text):
	say "[special-style-1][T][roman type][line break]";

To converse as thallium (T - a text):
	say "[special-style-1][T][roman type][line break]";

report looking:
	if the conversation of the location is not empty and the location is unused:
		converse the conversation of the location;
		now the location is used;
		
report examining something:
	if the conversation of the noun is not empty and the noun is unused:
		converse the conversation of the noun;
		now the noun is used;
		
A clip is a kind of thing. A clip is privately-named. A clip can be conversational or descriptive or taunting. A clip is usually conversational. The description is "no need for a description".

To say print (C - a clip):
	print C;

To print (C - a clip):
	if C is unused:
		[say line break;]
		if C is conversational:
			converse the conversation of C;
		otherwise if C is descriptive:			
			say the conversation of C;
			say line break;
		otherwise:
			converse as thallium the conversation of C;
			say line break;
		if not expanding text for comparison purposes, now C is used;
	
Volume 5 - Plot

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
	say "Ten minutes later, Galaxy Jones, in her speeder Galaxy One, races across the desolate expanse of Utopia Planitia, Mars. Her nemesis, the thoroughly execrable Admiral Thallium, has taken hostage the exquisite Europa Callisto, singer and actress renowned throughout a dozen solar systems. As Patty has quite helpfully explained, Miss Callisto is imprisoned at the top of the Viking Building in New Reykjavik, guarded by an impressive number of killer robots and other diabolical instruments of Jones's inevitable demise. The Admiral has most cordially invited Ms Jones to break into his building and attempt a rescue.[paragraph break]";
	say "'Oh I will,' Galaxy mutters to herself. This time, she vows silently, Thallium won't escape.[paragraph break]";
	say "Plus she'll get to meet Europa Callisto. That'll be totally sweet.[paragraph break]";
	now Intro is false;
	continue;

Book 1 - Lobby Shootout

Lobby Shootout is a scene. Lobby Shootout begins when the player is in the lobby for two turns.
Lobby Shootout ends when the location of the guard-robots is not the lobby.

pinned down is a clip with conversation "[line break]Jones: 'I[']m pinned down here!'".
Check going during lobby shootout:
	say "Trying to reach an exit would surely get [us] shot.";
	print pinned down instead;
	
When Lobby Shootout begins:
	Move the guard-robots to the lobby;
	now guard-robots are seen;
	now guard-robots are familiar;
	say "Suddenly two robot guards, green and red, emerge from niches in the back wall! [We] [dive] behind the front desk and [draw] [our] disruptor pistol.[paragraph break]";
	converse "Jones shouts, 'I'm under fire from two ugly robot things!'
	
	Beck responds, 'Monitoring your suit radar.'";	
	
After looking during Lobby Shootout:
	say "[one of]Two guard robots, red and green, criss-cross the lobby, stalking [us][or]Two guard robots prowl the lobby, trying to outflank [us][or]The guard robots have their head cannons trained on the front desk[at random].";
	
Flanking warning is a clip with conversation "Beck: 'Robot on your right!'".
Fight clip 6 is a clip with conversation "Jones: 'I could use some ideas here!'".
Fight clip 7 is a clip with conversation "Beck: 'How's it going in there?'

'Jones: 'You know -- like all art, it's hit or miss.'".

Every turn during lobby shootout:
	let roll be a random number between 1 and 10;
	if roll is 1:
		say "One of the robots fires directly above [our] head.";
	if roll is 2:
		say "The robots intone 'Destroy Jones' in an eerie drone.";	
	if roll is 3:
		print flanking warning;
		say line break;
		say "One robot tries to flank [us], but a shot from [our] disruptor sends it scurrying back.";	
	if roll is 4:
		say "Zip! Disruptor fire scorches a nearby couch.";
	if roll is 5:
		say "A robot fires a blistering shot into the front desk.";
	if roll is 6:
		say "The two robots coordinate fire over the desk, narrowly missing [us]."; 
	let roll2 be a random number between 1 and 7;
	if roll2 is 6:				
		print fight clip 6;
	if roll2 is 7:
		print fight clip 7;
	 
After quizzing Beck about sculpture during Lobby Shootout:
	say line break;
	converse "Beck: 'It's huge. Imagine if it fell on you.'";
	
After pleading when comment on energy absorption is unused during Lobby Shootout:
	say line break; 
	converse "Beck: 'I dunno, maybe shoot the robots?'";
	
After pleading when comment on energy absorption is used during Lobby Shootout:
	say line break;	
	if plead Lobby Shootout is:
		-- 1: converse "Beck: 'Well, if your energy weapon won't hurt them, maybe direct physical force will?'";
		-- 2: converse "Beck: 'It would have to be something large. Throwing your shoe at them isn't going to cut it.'";
		-- 3: converse "Beck: 'That sculpture up there seems pretty big.'";
	

Book 2 - Cybernetica Battle		

Cybernetica Battle is a scene. Cybernetica Battle begins when the player is in the Cybernetica office.

When Cybernetica Battle begins:
	move the purple guard robot to the Cybernetica office;
	say "As soon as [we] steps into the office, a shot zaps just past [our] nose. [We] dives to the ground, protected by the maze of desks and chairs. Peeking through the mesh back of one of the chairs, [we] takes notice of both the purple guard robot training its disruptor on the room, and the chair's fine construction and lumbar support.";
	converse "[line break]Jones (whispering): 'We've got another one! I'm out of sight for now, but it's going to be hard to get a shot off at this [']bot.' 
	 
	Beck: 'What's the situation?'
	
	Jones: 'I[']m on the floor with desks and chairs all around. The target is a few yards off, coming this way. I might get a shot in, but it might just absorb it anyway.'
	
	Beck: 'Well, see if you can sneak up on it. Maybe close up you can find a way past its defenses.'";	

Sneaking up on is an action applying to one thing. Understand "sneak up on [something]", "crawl toward [something]", "move toward [something]", "creep up on [something]", "creep toward [something]", "follow [something]" as sneaking up on.

sneak index is a number that varies. The sneak index is initially 3.

check sneaking up on something when the noun is not the purple guard robot:
	say "There's no sneaking up on that right now." instead;
	
carry out sneaking up on the purple guard robot:
	decrement the sneak index;
	
Check going during Cybernetica Battle:
	say "Trying to reach an exit would surely get [us] shot." instead;
	
After doing something other than sneaking up on the guard robot during Cybernetica Battle:
	if sneak index < 3 and the purple guard robot is in the Cybernetica office:
		increment sneak index;
		say "The guard robot moves a little farther away from [us].";
		stop the action;
		
Shoot out the window is a descriptive clip with conversation "[We] must have poked up [our] shoulder or something, for the guard robot fires his disruptor. The shot takes out a window on the east side of the room. The electrostatic field around the building keeps the atmosphere from pouring out."
	
report sneaking up on the purple guard robot:
	if sneak index is 2:
		say "[We] creeps a little ways toward the guard robot.";
	otherwise if sneak index is 1:
		say "Slowly, slowly, [we] gets a little closer. Just a little more...";
		say line break;
		print shoot out the window;
		change east exit of Cybernetica office to ledge;
		change west exit of ledge to Cybernetica office;
		change outside exit of Cybernetica office to ledge;
		change inside exit of ledge to Cybernetica office;
		now the Cybernetica office is window-broken;
	otherwise:
		say "[We] is right up next to the robot, crouched beneath a desk. She'll never get a better shot.";
		
useless shooting is a clip with conversation "Beck: 'Are you still shooting at those things? Even if you hit 'em it's not going to leave a scratch.'

Jones (whispering): 'So what do you propose?'

Beck: 'Get closer. Keep your head down, but move in closer to it until you can get a good shot in.'";

carry out shooting purple guard robot with the disruptor pistol during Cybernetica Battle:
	if sneak index > 0:
		say "[We] raises [our] head and fires wide. The robot fires back. Jones ducks and crawls off among the labyrinth of desks.[paragraph break]";
		print useless shooting;
	otherwise:
		say "[We] aims the pistol upward under the robot's enhanced armor and fires. [We] flinches back when the robot's innards explode downward in a shower of sparks. It topples over, dead.";
		remove the purple guard robot from play;
		move the destroyed purple robot to the Cybernetica office;
	
Cybernetica Battle ends when purple guard robot is not in the Cybernetica office.

When Cybernetica Battle ends:
	score 1;	
	say line break;
	converse "Jones: 'Better than a video game. '
	
	Beck: 'Nice, but don[']t forget to credit your handler.'
	
	Jones: 'Yes, yes, thanks for helping me not get killed.'   
	
	Beck: 'You're welcome.'";

Check dropping something when the location is the ledge:
	say "Bad idea." instead;

Volume 6 - Things

The disruptor pistol is a thing. The description is "A compact instrument of death, with only one setting: kill.". Understand "gun/weapon" as the disruptor pistol.

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
		
A room can be atmo-thin or safe.
The atmo-suit can be needed or unneeded.

Before going from a safe room to an atmo-thin room:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player does not wear the atmo-suit:
		say "[We] can't go outside without an atmo-suit.";
		stop the action;

Report going to a safe room:	
	now the atmo-suit is unneeded;
	if the atmo-suit is worn:
		silently try taking off the atmo-suit;
		queue "[We] doffs the Atmo-Suit.";
	continue the action.
	
Check wearing the atmo-suit when the atmo-suit is unneeded:
	say "[We] needs to be able to move around quickly. Better not wear the [Atmo-Suit]." instead;
		
The elevator drop key is a thing. "Hanging from a hook here is [a elevator drop key]." The description is "A drop key is a special device used to open an elevator door from the outside. It consists of a thin shaft which is hinged at th-- oh just Google it." 

A thing can be an enemy.

A guard robot is a kind of enemy person. It is neuter. The description is "Definitely not a friendly android. More of a spiny killer with a disruptor barrel mounted on its head.". Understand "guard/barrel/killer/head" as a guard robot.
There is a guard robot called the guard-robots. It is privately-named. It is scenery. The printed name is "guard robots". Understand "guard/guards/robot/robots/green/red" as the guard-robots. 
There is a guard robot called the purple guard robot. It is scenery.
There is a thing called the dead mauve robot. Understand "remains/guard" as the dead mauve robot. "The remains of the mauve guard robot are sprawled on the ground." The description is "From the outside there's no sign of what killed the mauve guard robot." It is fixed in place.
There is a thing called the destroyed purple robot. "The remains of the purple guard robot are sprawled on the ground." The description is "The tattered guts of the purple guard robot spill out from it's armored carapace." It is fixed in place.

Check taking a guard robot:
	say "An interesting idea." instead;

Instead of attacking an enemy thing:
	say "You'll need to specify how [we] should attack [the noun]. For instance, you might say 'shoot [the noun] with [the disruptor pistol]'." 
	
A couch is a kind of enterable supporter. It is usually scenery.

A container can be keyed. A door can be keyed. A container is usually not keyed. A door is usually not keyed.

The bottled water is a thing. The description is "A [if full]full[otherwise]empty[end if] bottle of Olympus Springs water." Understand "bottle/Olympus/Springs" as the bottled water.
The bottled water can be full or empty. It is full. The printed name is "[if full]full[otherwise]empty[end if] water bottle".

Check drinking the bottled water:
	say "Jones isn't thirsty." instead;
	
Check eating the bottled water:
	say "Jones isn't thirsty." instead;
	
Check pouring the water:
	say "Why waste it?" instead;
	
Check pouring the water on something: 
	say "Why waste it?" instead;

A bottle of Electrofil quick-setting conductive polymer gel is a pourable thing. Understand "bottles" as Electrofil quick-setting conductive polymer gel.

The hook cable is privately-named. The printed name is "cable with hooks at either end". Understand "cable/hooks/hook" or "cable with hooks" or "cable with hooks at either end" or "cable with hooks at the end/ends" or "hooked cable" as the hook cable.

The description is "This is a strong but slender cable, presumably of carbon nanotubes. There are steel hooks at either end.".

A cardkey is a kind of thing.

Swiping it through is an action applying to one carried thing and one thing. 
Understand "swipe [something] through/in [something]" as swiping it through.

Check swiping when the noun is not a cardkey:
	say "That can't be swiped." instead;
	
Carry out swiping:
	try unlocking the second noun with the noun;
	
Definition: a white board is blank if the writing of it is empty.

A white board is a kind of thing. A white board has a text called the writing. The description is "[if not blank]The board says '[writing]'[otherwise]The board is blank[end if].".

Writing is an action applying to one topic. Understand "write [text]" as writing.

Check writing when no white board is in the location:
	say "There's nothing to write on here." instead;

Carry out writing:
	let board be a random white board in the location;
	now the writing of board is "[writing of board] [topic understood]";
	
Report writing:
	let board be a random white board in the location;
	say "Now the board says '[writing of board]'.";
	
Erasing is an action applying to one thing. Understand "erase [thing]" as erasing.

Check erasing when the noun is not a white board:
	say "That can't be erased." instead;
	
Carry out erasing:
	now the writing of the noun is "";
	
Report erasing:
	say "Now the board is blank.";

Volume 7 - Geography

Book 1 - Ground Floor

the speeder dock is a room. The player is in the speeder dock.

the entry doorway is north of Speeder Dock. The preposition is "at".

the entry door is scenery in entry doorway.

the lobby is north of the entry doorway.

the ground floor elevator hall is north of the lobby.

the ground floor elevator door is a door. It is west of the ground floor elevator hall. The printed name is "elevator door". Through the ground floor elevator door is the ground floor elevator shaft. The ground floor elevator door is closed and unopenable. Understand "elevator/door" as the ground floor elevator door.

the ground floor elevator door-inside is a door. It is east of the ground floor elevator shaft. It is scenery. The printed name is "elevator door". Through the ground floor elevator door-inside is the ground floor elevator hall. The ground floor elevator door-inside is a half-door of the ground floor elevator door. Understand "elevator/door" as the ground floor elevator door-inside. "The backside of the elevator door."

Instead of opening the ground floor elevator door:
	say "[We] can't just open the elevator with [our] hands.";

To say ground name of (D - a direction):
	if D is north or D is south or D is east or D is west:
		say "the [dir] side of the ground floor";
	otherwise:
		say "the [dir] corner of the ground floor";

A ground-floor is a kind of room. It is privately-named. The printed name is "[ground name of dir]". A ground-floor has a direction called dir.

ground-floor-1 is west of Lobby. It is a ground-floor. The dir is southwest.  The preposition is "at".

ground-floor-2 is north of ground-floor-1. It is a ground-floor. The dir is west. The preposition is "on".

the elevator-room-door is a door. It is privately-named. It is scenery. The printed name is "utility door". Understand "elevator/room/door/utility" as elevator-room-door. It is east of ground-floor-2. Through the elevator-room-door is the elevator room.
the elevator-room-door is closed, locked, lockable and openable. The red cardkey unlocks the elevator-room-door.
The description of the elevator-room-door is "It's a white metal door, completely typical. It has a swipe card lock right above the handle.".

the elevator-room-door-inside is a door. It is privately-named. It is scenery. The printed name is "elevator room door". Understand "elevator/room/door" as elevator-room-door-inside. It is west of the elevator room. The elevator-room-door-inside is a half-door of the elevator-room-door. Through the elevator-room-door-inside is ground-floor-2.
The description is "It's a white metal door, completely typical. It has a card swipe right above the handle.".

ground-floor-3 is north of ground-floor-2. It is a ground-floor. The dir is northwest. The preposition is "at".

ground-floor-4 is east of ground-floor-3 and north of the elevator hall. It is a ground-floor. The dir is north. The preposition is "on".

ground-floor-5 is east of ground-floor-4. It is a ground-floor. The dir is northeast. The preposition is "at".

ground-floor-6 is south of ground-floor-5. It is a ground-floor. The dir is east. The preposition is "on".

the closet door is a door. it is west of ground-floor-6. Through the closet door is the maintenance closet. 

the closet-door-inside is a door. It is privately-named. It is scenery. The printed name is "closet door". Understand "closet/door" as the closet-door-inside. It is east of the maintenance closet. Through the closet-door-inside is ground-floor-6. The closet-door-inside is a half-door of the closet door. The description is "A typical white utility door."

ground-floor-7 is south of ground-floor-6 and east of the lobby. It is a ground-floor. The dir is southeast. The preposition is "at".

the ground floor stairwell is east of the elevator hall.

Book 2 - Lower Elevator Shaft

the ninth floor elevator shaft is above the ground floor elevator shaft.

Book 3 - The Ninth Floor

The ninth floor elevator door is a door. It is scenery. It is east of the ninth floor elevator shaft and west of the ninth floor elevator hall. The description is "A golden sliding door, opening in the middle."

The ninth floor stairwell is east of the ninth floor elevator hall.

The ninth floor north hallway is north of the ninth floor elevator hall.

The ninth floor south hallway is south of the ninth floor elevator hall.

The Cybernetica door is a door. It is east of the ninth floor north hallway. It is scenery. Through the Cybernetica door is the Cybernetica office. The cybernetica door is closed, openable, locked, and lockable. The description is "A slick corporate office door lettered 'Cybernetica'. It has a swipe lock above the handle." Understand "swipe/lock" as the cybernetica door.
The Cybernetica door-inside is a door. It is west of the Cybernetica office. It is privately-named. The printed name is "Cybernetica door". It is scenery. Through the Cybernetica door-inside is the ninth floor north hallway. The Cybernetica door-inside is a half-door of the Cybernetica door.  

The Martian Chemical door is a door. It is scenery. It is east of the ninth floor south hallway and west of the Martian Chemical office. The Martian Chemical door is closed, openable, locked, and lockable. "A slick corporate office door with the fancy company logo of Martian Chemical. It has a swipe lock above the handle." Understand "swipe/lock" as Martian Chemical door.

The martian chemical logo is part of the Martian Chemical door. The description is "The figure of a beaker holding a red liquid against the backdrop of the planet Mars."

The north-mgmt-doorway is scenery in ninth floor north hallway. It is privately-named. The printed name is "doorway". "An office can be seen past the doorway."

The south-mgmt-doorway is scenery in ninth floor south hallway. It is privately-named. The printed name is "doorway". "An office can be seen past the doorway."

The north end of the building management office is west of the ninth floor north hallway.
The preposition is "at".

the south end of the building management office is south of the north end of the building management office and west of the ninth floor south hallway. The preposition is "at".

a ledge is a room. The preposition is "on". It is always-indefinite. a ledge is atmo-thin.

a window washing scaffold is a room. The preposition is "on". It is always-indefinite. a window washing scaffold is atmo-thin.

Book 4 - The Tenth Floor

the tenth floor elevator hall is a room. It is open space. The preposition is "in".

The tenth-floor-region is a region. It contains the tenth floor elevator hall, the elevator car-room, and the tenth floor stairwell.

To say microthings office name of (D - a direction):
	if D is north or D is south or D is east or D is west:
		say "the [dir] side of the Consolidated Microthings office";
	otherwise:
		say "the [dir] corner of the Consolidated Microthings office";

A microthings-room is a kind of room. It is privately-named. The printed name is "[microthings office name of dir]". A microthings-room has a direction called dir. 
 
microthings-1 is a microthings-room. It is open space. It is south of the tenth floor elevator hall. The preposition is "on". It is in the tenth-floor-region. The dir is south.
 
microthings-2 is a microthings-room. It is open space. It is west of microthings-1. The preposition is "at". It is in the tenth-floor-region. The dir is southwest. 
 
microthings-3 is a microthings-room. It is open space. It is north of microthings-2. The preposition is "on". It is in the tenth-floor-region. The dir is west.
 
microthings-4 is a microthings-room. It is open space. It is north of microthings-3. The preposition is "at". It is in the tenth-floor-region. The dir is northwest.
 
microthings-5 is a microthings-room. It is open space. It is east of microthings-4 and north of the tenth floor elevator hall. The preposition is "on".  It is in the tenth-floor-region. The dir is north.
 
microthings-7 is a microthings-room. It is open space. It is southeast of microthings-5. The preposition is "on". It is in the tenth-floor-region. The dir is east.
 
microthings-8 is a microthings-room. It is open space. It is south of microthings-7 and east of microthings-1. The preposition is "at". It is in the tenth-floor-region. The dir is southeast.

the air handling door is a door. It is east of microthings-5 and west of the air handling room. The air handling door is scenery. "An ordinary utility door."

The vent access door is a door. It is inside from the air handling room. It is scenery. Through the vent access door is the window washing scaffold. The description of the vent access door is "A small door leading into the air duct." Understand "opening" as vent access door.

Instead of entering the vent access door:
	try going east;

The elevator car-room is west of the tenth floor elevator hall. It is open space. It is privately-named. The printed name is "elevator car".  It is in the tenth-floor-region.

Instead of going east from the elevator car-room:
	if floor of the elevator car-room is:
		-- 1:
			move player to ground floor elevator hall;
		-- 9:
			move player to ninth floor elevator hall;
		-- 10:
			move player to tenth floor elevator hall;
		-- 100:
			move player to the (100th floor elevator hall);

Instead of going west from the ground floor elevator hall when the elevator car-room is in running mode:
	if the floor of the elevator car-room is 1:
		move the player to the elevator car-room;
	otherwise:
		say "The elevator is not at this floor.";

Instead of going west from the ninth floor elevator hall when the elevator car-room is in running mode:
	if the floor of the elevator car-room is 9:
		move the player to the elevator car-room;
	otherwise:
		say "The elevator is not at this floor.";

Instead of going west from the tenth floor elevator hall when the elevator car-room is in running mode:
	if the floor of the elevator car-room is 10:
		move the player to the elevator car-room;
	otherwise:
		say "The elevator is not at this floor.";

Instead of going west from the 100th floor elevator hall when the elevator car-room is in running mode:
	if the floor of the elevator car-room is 100:
		move the player to the elevator car-room;
	otherwise:
		say "The elevator is not at this floor.";

The top of the elevator car is above the elevator car-room. The preposition is "on".

The tenth floor stairwell is east of the tenth floor elevator hall.


Chapter 1 - Lines of Sight

microthings-1 farsees microthings-2 and microthings-8 and microthings-5.

microthings-2 farsees microthings-3, microthings-4, and microthings-8.

microthings-3 farsees microthings-4.

microthings-4 farsees microthings-5.

microthings-5 farsees microthings-7.

microthings-7 farsees microthings-8.

the tenth floor elevator hall farsees the elevator car-room, microthings-1, and microthings-5.


Book 5 - The 100th Floor 

The 100th floor elevator hall is a room. West of the 100th floor elevator hall is the placeholder room. The description of the placeholder room is "this is another secret message."

the penthouse north is north of 100th floor elevator hall.

the penthouse east is southeast of penthouse north.

the penthouse south is southwest of penthouse east and south of 100th floor elevator hall.

the penthouse west is northwest of penthouse south and southwest of penthouse north.

the roof stairs is east of 100th floor elevator hall.

The roof access door is a closed, locked, lockable, openable scenery door. It is above the roof stairs and below the penthouse roof. The description of the roof access door is "Looking strangely out of place, it is a common grey metal door with a push bar."

The preposition of the roof stairs is "on".

The preposition of the penthouse roof is "on".

Book 6 - The Roof

the flyer pad is west of the penthouse roof. The preposition is "on".

a cage is north of the penthouse roof. The preposition is "next to". 

Carry out looking when the location is the cage (this is the cage description heading rule): 
	if the player is not supported by the cage-thing:
		if the cage is broken:
			say "Galaxy Jones is in [bold type]the cage[roman type]. [run paragraph on]";
		otherwise:
			say "Galaxy Jones is next to [bold type]the cage[roman type]. [run paragraph on]";
	otherwise:
		say "Galaxy Jones is standing on [bold type]the cage[roman type]. [run paragraph on]";

For naming when the location is the cage (This is the cage naming rule):
	follow the cage description heading rule;
	say line break;
	
The cage description heading rule is listed before the new room description heading rule in the carry out looking rules.

The new room description heading rule does nothing when the location is the cage.
The standard naming rule does nothing when the location is the cage.
	
Volume 8 - Room Implementations

Book 1 - City Backdrops

First floor view of New Reykjavik is a backdrop. It is privately-named. It is in speeder dock, lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
	
The printed name is "outside".

The description is "Outside the building are the red-dusted streets of New Reykjavik."

Understand "city/reykjavik/planet/mars/outside/out/glass/streets" or "glass wall" or "new reykjavik" as first floor view of New Reykjavik.

Ninth floor view of New Reykjavik is a backdrop. It is privately-named. It is in south end of the building management office, north end of the building management office, ninth floor south hallway, ninth floor north hallway, Martian Chemical office, Cybernetica office.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking Building stands near the periphery, overlooking the vast red plain of Utopia Planitia."
	
Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain" as ninth floor view of New Reykjavik.

Perilous view of New Reykjavik is a backdrop. It is privately-named. It is in ledge, window washing scaffold.

The printed name is "the city".

The description is "From this perilous location, outside the comforting electrostatic field trapping the atmosphere of the building, one can see with striking clarity the lights of the city. The surrounding plains go on forever."

Understand "city/planet/mars/out/outside" as perilous view of New Reykjavik.

Tenth floor view of New Reykjavik is a backdrop. It is privately-named. It is in microthings-1, microthings-2, microthings-3, microthings-4, microthings-5, microthings-7, microthings-8.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking building stands near the periphery, overlooking the vast red plain of Utopia Planitia."

Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain" as tenth floor view of New Reykjavik.

100th floor view of New Reykjavik is a backdrop. It is privately-named. It is in penthouse south, penthouse east, penthouse west, penthouse south, penthouse roof, cage, and landing pad.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking Building stands near the periphery, overlooking the vast red plain of Utopia Planitia."

Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain" as (100th floor view of New Reykjavik).

Book 2 - Ground Floor

Chapter 1 -  Speeder Dock

The description of the speeder dock is "A safe harbor from the periodic dust storms of Utopia Planitia, the dock features several dozen speeder bays. Only a few are filled right now. The building entryway is to the north, under a red stone façade carved into the likeness of a fearsome Viking.".

The conversation of the speeder dock is "[reset LPR][Our] handler Beck comes over [our] headset. 'Alright, what's going on?'

[We] replies, 'I[']m in the speeder dock. No movement. What can I expect inside?'

'Blueprints show the ground floor is one big empty space with elevators in the center. Not a lot of places for resistance to hide, but you can never tell. Be careful.'".

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

The building entryway is a backdrop. It is in the speeder dock, entry doorway, and lobby. "[If the location is the lobby]The entryway (exit actually) leads out to the speeder dock.[otherwise]The entryway is dominated by the towering façade of a Viking king, namesake of the building itself.". Understand "entry/doorway/entrance/entranceway/facade/façade/viking" as building entryway. Understand "exit" as building entryway when the location is the lobby.
	
Chapter 2 - Building Entryway

The description of the entry doorway is "A glass revolving door leads into a large open space north of here. The speeder dock is to the south.".

The conversation of the entry doorway is "Jones peers upwards at the 100 stories of glass and steel. 'What do you want to bet Thallium's got Europa all the way at the top?'

Beck: 'Oh, no doubt.'";

The open-space is scenery in the entry doorway. It is privately-named. The printed name is "open space". Understand "open space" as open-space. "On the far side of the glass walls is a large open space serving as the extended lobby of the building."

The description of the entry door is "A glass revolving door emblazoned with the symbol of a Viking king astride the planet Mars."

Before going from entry doorway to lobby for the first time:
	converse "Jones takes a deep breath. 'I[']m going in.'
	
	Beck replies, 'You got this, Galaxy.'".

Chapter 3 - Lobby

The ground-floor-floor is a backdrop. It is privately-named. The printed name is "floor". Understand "floor" as the ground-floor-floor. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description of the ground-floor-floor is "Yards and yards of white and grey marble, rare for Mars."

The ground-floor-ceiling is a backdrop. It is privately-named. The printed name is "ceiling". Understand "ceiling" as the ground-floor-ceiling. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description of the ground-floor-ceiling is "The whole ground floor is bright and airy, its ceiling covered with reflective pyramids. Supporting struts criss-cross the area, from which sparkling crystal chandeliers are suspended."

The description of the lobby is "The ground floor of the Viking Building is breathtaking. Low-G architecture means more glass and thinner supports, and the building takes advantage of that. Four walls of glass surround a central pillar in which are set the utility rooms and elevators. In between is an expanse of plants, water features, and stylish seating. Near the entryway is a front desk[if the giant sculpture is in the lobby]. A giant crystal sculpture floats above the center of the area, suspended on almost invisible cables[end if]. [We] may go east and west from here, north to the elevators, or south out of the building[if lobby shootout is happening or lobby shootout has happened]. There are two niches in the central wall from which the guard robots emerged[end if].".

The lobby-background is scenery in the lobby. It is privately-named. Understand "plants/water/features/feature/stylish/seating" as the lobby-background. "The ground is floor is huge and made for holding people comfortably. Thus the hundreds of seats amidst Earth pleasures such as water and living green plants."

The supports are scenery in the lobby. "Thin but incredibly strong."

The elevators-scenery is scenery in the lobby. It is privately-named. The printed name is "elevators". Understand "elevator/elevators" as the elevators-scenery. "They're in the center of the building, north of here."

The niches are scenery in the lobby. "Aside from a robot charging station, there's nothing here." Understand "niche" as niches.

The front desk is scenery in the lobby. It is a pseudocontainer. The contents description is "There's not much on the desk other than a note that says '[doorcode]'.". "There is nothing of interest on the front desk." 
The note is in the front desk. The description is "The note says '[doorcode]'.".

Instead of opening the front desk:
	say "[We] opens a few drawers, all of which contain paper, pens, and other things of little interest.";
	
The giant sculpture is scenery in the lobby. Understand "art/artwork/Rambutan/glass/crystal/abstraction/cables/installation" as the giant sculpture. "It's a huge crystal abstraction, provocative in its arrogance but evocative of nothing. A typical public installation by the artist Rambutan. It's held up by metal cables."

comment on energy absorption is a clip with conversation "[line break]Jones: 'Target seems to be absorbing disruptor fire. This will make things a little harder.'".
	
Report shooting a guard robot with the disruptor pistol during Lobby Shootout:
	say "[one of]Oops! [we] [miss].[or][We] [stick] [our] head out from behind the desk and squeezes off a shot at [the noun]. In [our] haste it goes wide of the target.[or]A barrage of fire from the robots prevents [us] from firing.[or]Oof. Big miss.[or][Our] shot hits [the noun] dead on, but nothing happens, almost as if the robot had absorbed the energy.[print comment on energy absorption][line break][or]A perfect shot! Yet, somehow, the robot is unscathed.[print comment on energy absorption][or][Our] shot goes wide, reflecting off one of the building struts and into the suspended sculpture. The artwork begins to spin wildly, straining its cables.[at random]";
	
Check shooting something with the disruptor pistol:
	if the noun is not a guard robot and the noun is not the giant sculpture:
		say "[regarding the noun]Shooting [them] would accomplish nothing.";
	 
The tangled ruin is a fixed in place pseudocontainer. "Spread across the floor in a tangled ruin are the remains of a giant crystal sculpture and two guard robots." Understand "remains/sculpture/art/glass/guard/robots/robot/red/green/ruins" as the tangled ruin. 
The description is "[We] searches some more, but nothing further turns up."
The contents description is "[We] digs through the ruins and finds a cable with hooks at either end, which [we] takes."
The tangled ruin is auto-take.
The hook cable is in the tangled ruin.
	
battle won is a clip with conversation "Beck: 'What was that crash? What[']s going on?'

Jones: 'That, my friend, was what you'd call a work of art. Targets terminated.'".

Carry out shooting the giant sculpture with the disruptor pistol:
	say "[We] [fire] the disruptor into the sculpture's main support cable, snapping it. The huge crystal blob starts to sag, straining the other cables. In quick succession they break as well, and the whole installation plummets to the ground, right on top of the hapless guard robots.";
	score 1;
	say line break;
	remove the guard-robots from play;
	remove the giant sculpture from play;
	move the tangled ruin to the lobby;
	print battle won;
	
entering is acting recklessly.
taking is acting recklessly.
jumping is acting recklessly.

Instead of acting recklessly during Lobby Shootout:
	say "As soon as [we] [start] to act, an energy beam zips past [our] head, forcing [us] back down behind the desk.";
	
Instead of dropping the disruptor pistol:
	say "That would be ill-advised.";
	
The tasteful couch is a couch in the lobby. "Quite tasteful for a homicidal madman, really."

The ground floor central pillar is a backdrop. It is privately-named. The printed name is "central pillar". Understand "central/pillar" as ground floor central pillar. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description is "The central area where the elevators and utility rooms are."
	
Chapter 4 - Ground Floor

[The room-floor of the lobby is the ground-floor-floor.
The room-floor of the ground-floor-1 is the ground-floor-floor.
The room-floor of the ground-floor-2 is the ground-floor-floor.
The room-floor of the ground-floor-3 is the ground-floor-floor.
The room-floor of the ground-floor-4 is the ground-floor-floor.
The room-floor of the ground-floor-5 is the ground-floor-floor.
The room-floor of the ground-floor-6 is the ground-floor-floor.
The room-floor of the ground-floor-7 is the ground-floor-floor.
The room-floor of the ground floor elevator hall is the ground-floor-floor.

The room-ceiling of the lobby is the ground-floor-ceiling.
The room-ceiling of the ground-floor-1 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-2 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-3 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-4 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-5 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-6 is the ground-floor-ceiling.
The room-ceiling of the ground-floor-7 is the ground-floor-ceiling.]

Section 1 - ground-floor-1

The description of ground-floor-1 is "A lush waterfall here contrasts with the dusty red streets of New Reykjavik beyond the glass walls. The ground floor extends north and east."

The waterfall is a scenery pseudocontainer in ground-floor-1. "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again." The contents description is "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again. A single coin sits on the bottom of the basin." 

Understand "water/basin" as waterfall.

The wide-leaved Earth plants are part of the waterfall. The description of the wide-leaved Earth plants is "Imported plants are a must on Mars, to relieve the stress of living on a lifeless world.". Understand "ferns" as the wide-leaved Earth plants.

The coin is in the waterfall. The description is "A One Areo coin, with Ares on the front and the Viking 2 lander on the back.".

Section 2 - ground-floor-2

The description of ground-floor-2 is "Semicircular couches open on either side of a central carpeted path leading north and south. Set in the central pillar of the building to the east is a utility door. The city looms beyond the glass wall to the west."

The east semicircular couch is a couch in ground-floor-2. The description is "An inoffensive beige couch, shaped in a half-circle, opening towards the west.".
The west semicircular couch is a couch in ground-floor-2. The description is "An inoffensive beige couch, shaped in a half-circle, opening towards the east.".

The central carpeted path is scenery in ground-floor-2. The description is "A strip of grey carpet running north to south, in the midst of the marble floor. (Incidentally, the massive expense of moving real marble from Earth to the Mars is just further proof of Thallium's madness, seriously.)". Understand "carpet/rug" as the central carpeted path.
 
The swipe lock is scenery in ground-floor-2. "An ordinary swipe lock."

Instead of inserting something into swipe lock:
	try unlocking the elevator-room-door with the noun;

Instead of using something with swipe lock:
	try unlocking the elevator-room-door with the noun;

Section 3 - ground-floor-3

The description of ground-floor-3 is "A large relief map of mars is mounted on the north wall here. One can leave here to the south or east.".

The large relief map of mars is scenery in ground-floor-3. "The map is crafted of bronze and sports a star at the site of New Reykjavik.";

The star is a part of the large relief map. The description is "Ah, New Reykjavik! Even colder than Old Reykjavik!".

Section 4 - ground-floor-4

The description of ground-floor-4 is "The area is dominated by a towering statue of Admiral Thallium against the north wall. The ground floor extends west and east from here. The elevator is to the south."

The statue of admiral thallium is scenery in ground-floor-4. The description is "His nauseating visage seems to leer at [us], and [we] suppresses a shiver of disgust.".

The conversation of the statue of admiral thallium is "Jones groans. 'Be glad you're not here, Beck. This is revolting.'

Beck chuckles. 'I won't ask.'".

The elevators-scenery-2 is scenery in the lobby. It is privately-named. The printed name is "elevators". Understand "elevator/elevators" as the elevators-scenery. "They're in the center of the building, south of here."

Section 5 - ground-floor-5

The description of ground-floor-5 is "The area is dedicated to celebrating the military career of Admiral Thallium. Uniforms, medals, ribbons, and other miscellanea are mounted on the wall or in showcases. All this despite the fact that no one has turned up any evidence that Thallium served in any navy of any country on any planet. One can escape to the west or south.".

Some military-detritus are scenery pseudocontainer in ground-floor-5. They are privately-named. The printed name is "medals, ribbons, and all". Understand "uniforms/uniform/medals/ribbons/ribbon/miscellanea/showcases/showcase/cases/case" as military-detritus.
The contents description is "[We] yawns looking over the assortment of faux honors. They're all behind glass, but one of the display cases is partly open, leaving the rather garish medal inside unprotected.".
"There's a remarkable array of faux honors here, all behind glass. One of the display cases is partly open and empty of the medal it once held."

Instead of opening the military-detritus:
	try examining the military-detritus;

The garish medal is in the military-detritus. It is a pseudocontainer.
The contents description is "While the front looks authentic, the reverse is engraved with Thallium's personal motto 'Planetas Vincam'. The ribbon conceals a safety pin. It looks like it could be removed.".
The description is "While the front looks authentic, the reverse is engraved with Thallium's personal motto 'Planetas Vincam'. Earlier [we] removed the safety pin."
The safety pin is in the garish medal. The description of the safety pin is "A standard silver metal safety pin."

Instead of taking off the safety pin when the safety pin is in the garish medal:
	try taking the safety pin;
	
Instead of wearing the garish medal:
	say "[We] declines to wear a fake medal from a fake Admiral.";


Section  6- ground-floor-6

The description of ground-floor-6 is "Apparently some kind of function was happening here before Admiral Thallium emptied the building, for there is an array of canapes on a catering table here. The floor stretches north and south, and there's a closet door to the west."

The conversation of ground-floor-6 is "Beck: 'Blueprints indicate a closet to the west of you. Might be useful.'";

The catering table is a scenery pseudocontainer in ground-floor-6. "The table is covered with a wide array of treats from the ridiculously expensive, such as shrimp tea sandwiches (where do you get shrimp on Mars?), to the just plain ridiculous, like poached ostrich eggs in jelly. A good number of forks are laid out to one side.". Understand "canapes", "canape", "hors d'oeuvres", "food", "snacks", "treats", "array" as the catering table.

After examining the catering table:
	converse "Jones: 'What would you like me to bring you, Beck? Shrimp tea sandwiches, or poached ostrich eggs?'
	
	Beck: 'Oh, the shrimp. Definitely get the shrimp.'";

Check eating the catering table:
	say "There are so many things on the table. [We] might want to look at them and decide what [we] want";
	
Check taking the catering table:
	say "There are so many things on the table. [We] might want to look at them and decide what [we] want";

The conversation is "Jones: 'Well, at least the Admiral treats his guests right. Except me. And Europa.'".

The catering table contains a fork. The catering table contains a shrimp tea sandwich. The catering table contains poached ostrich eggs in jelly.
Understand "silverware/forks" as the fork. The description of the fork is "A very stylish silver-plated fork.".
Understand "sandwiches" as the shrimp tea sandwich. The description of shrimp tea sandwich is "Simply delightful." 
The shrimp tea sandwich is edible. The poached ostrich eggs in jelly is edible. The description is "Definitely not to [our] taste."
Understand "egg" as the poached ostrich eggs in jelly.

Check eating the shrimp tea sandwich:
	say "[We] is not hungry." instead;

Check taking the poached ostrich eggs: 
	say "Don't even." instead; 

Check eating the poached ostrich eggs: 
	say "Sorry, no." instead; 
	
The conversation of the poached ostrich eggs in jelly is "Jones: 'You ever have poached ostrich eggs, Beck?'

Beck: 'No, but I'll take you for some when you're done there.'

Jones: 'Oh, thanks.'"

can't open maintenance closet is a clip with conversation "Jones: 'Door on the east side has a keypad lock.'".
opened maintenance closet is a clip with conversation "Jones: 'I've unlocked the east side utility door.'"

report unlocking the closet door with something:
	if the closet door is locked:
		print can't open maintenance closet;
	otherwise:
		print opened maintenance closet;

	

Section 1 - ground-floor-7

The description of ground-floor-7 is "The centerpiece of this area is the actual Viking 2 lander, which landed right here on Utopia Planitia. The glass walls look out onto the city. [We] can go north or west from here.".

The Viking 2 lander is scenery in ground-floor-7.  "The lander is such a big, ungainly object it's hard to imagine it was once a pinnacle of human achievement."

Chapter 5 - Maintenance Closet

The description of the maintenance closet is "A bare, white-walled room containing various maintenance items."

The maintenance items are scenery in the maintenance closet. "Various uninteresting items, like mops and brooms and the like."

The closet door is closed, lockable, openable, and locked. It is scenery. "A typical white metal utility door. Next to it is a keypad with the digits 0-9."
A keypad is a part of the closet door. The description is "An ordinary numerical keypad."

Check opening the closet door when the closet door is locked:
	say "[We] will have to enter the correct code on the keypad first." instead;
	
Instead of typing doorcode on the keypad:
	say "An indicator light glows green.";
	now the closet door is unlocked;
	say line break;
	print opened maintenance closet;
	
Instead of typing a number on the keypad:
	say "An indicator light blinks red.";	
	if closet door has not been unlocked:
		converse "[line break]Jones: 'it[']s not [number understood]...'";
	
Instead of typing a number on the keypad for the second time:
	say "An indicator light blinks red.";	
	if closet door has not been unlocked:
		converse "[line break]Jones: 'it[']s not [number understood]...'";
		converse "[line break]Beck: 'I don[']t think you[']ll get it just typing random numbers.'";
	
Instead of typing a number on the keypad for the fourth time:
	say "An indicator light blinks red.";	
	if closet door has not been unlocked: 
		converse "[line break]Jones: 'it[']s not [number understood]...'";
		converse "[line break]Beck: 'Seriously, Jones.'";
	
Does the player mean typing a number on the keypad:
	it is very likely.
	
Check unlocking keylessly the closet door:
	say "[We] will have to enter the correct code on the keypad.[paragraph break][print can't open maintenance closet]" instead;
	
Check unlocking the closet door with something:
	say "[We] will have to enter the correct code on the keypad instead.[paragraph break][print can't open maintenance closet]" instead;

The red cardkey is on the shelf. The description of the red cardkey is "An anonymous red card with a magnetic stripe." Understand "card/key" as red cardkey. The red cardkey is a cardkey.
The shelf is scenery in the maintenance closet. The description of the shelf is "A plain white plastic shelf mounted on the wall."

The Atmo-Suit is in the maintenance closet.

Chapter 6 - Ground Floor Elevator Hall

The description of the ground floor elevator hall is "This hallway between the north and south ends of the ground floor is home to the elevator to the west. To the east is the entrance to a stairwell[if the elevator door is open]. The elevator door is open, revealing the bottom of the elevator shaft. Jones could climb into it, if she wished[end if].". Understand "hallway" as the ground floor elevator hall.

The ground-floor-stairwell is scenery in the ground floor elevator hall. The printed name is "stairwell". Understand "stairwell/stairs" as the ground-floor-stairwell. "They lead up from here."

The elevator-shaft is scenery in the ground floor elevator hall. It is privately-named. The printed name is "elevator shaft". Understand "elevator/shaft" as the elevator-shaft. The description is "A dark hole beyond the elevator doors."

Does the player mean using drop key with the ground floor elevator door:
	it is very likely;
	
Does the player mean doing something to the elevator-shaft:
	it is very unlikely;

Instead of entering the elevator-shaft when the ground floor elevator door is closed:
	say "[We] will need to open the elevator door first.";
	
Instead of entering the elevator-shaft when the ground floor elevator door is open:
	try going west;
	
Understand "climb into [something]" as entering.

The call button is scenery in the ground floor elevator hall. "A black button mounted on the wall."

Instead of pushing the call button:
	say "[We] presses [the call button], but nothing happens.";

The description of the ground floor elevator door is "A gleaming gold elevator door. There is a hole near the top for inserting a drop key.". The ground floor elevator door has matching key the elevator drop key. It is scenery.

The drop-key-hole is a part of the ground floor elevator door. The printed name is "drop key hole". Understand "elevator/drop/key/hole" as the drop-key-hole. The description is "It's a small hole about half an inch in diameter."
	
Instead of unlocking the ground floor elevator door with the elevator drop key when the ground floor elevator door is closed:
	safely open the elevator door;
	say "[We] inserts [the elevator drop key] into [the drop-key-hole] and turns it, disengaging the lock mechanism. Then [we] slides the door open."
	
Instead of unlocking the ground floor elevator door with the elevator drop key when the ground floor elevator door is open:
	say "The [ground floor elevator door] is already open.";
	
Instead of inserting the elevator drop key into the drop-key-hole:
	try unlocking the ground floor elevator door with the elevator drop key;

Instead of using the elevator drop key when location is the ground floor elevator hall:
	try unlocking the ground floor elevator door with the elevator drop key;
	
Instead of using the elevator drop key with the ground floor elevator door:
	try unlocking the ground floor elevator door with the elevator drop key;
	
Does the player mean using the elevator drop key with the elevator drop key:
	it is very unlikely;
	
Instead of using the elevator drop key with the drop-key-hole:
	try unlocking the ground floor elevator door with the elevator drop key;

Chapter 7 - Elevator Room

The description of the elevator room is "This is a utility room related to the operation of the elevator, on the other side of the east wall here. There is a control panel on the wall, and a door leading west."

The elevator control panel is scenery in the elevator room. "From the looks of it, elevator technology hasn't evolved much since it was first developed. This control panel is a primitive collection of wires, circuit boards, indicator lights, and other components. It also seems to be completely inactive -- none of the lights are on." Understand "wires/circuit/board/boards/indicator/lights/light/component/components/controls" as the elevator control panel.

Instead of doing something other than examining to the elevator control panel:
	say "Playing with the controls for a dangerous piece of equipment she doesn't understand is not something Jones would do.";

The elevator drop key is in the elevator room. 

The hammer is in the elevator room. "Lying discarded on a table here is a hammer." The description is "An ordinary claw hammer".

Chapter 8 - Ground Floor Stairwell

The description of the ground floor stairwell is "this is a secret message."

don't take the stairs is a clip with conversation "Jones: 'In case of fire, don't use the stairs.'"

Instead of going to ground floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
	say line break;
	print don't take the stairs;
	try looking;
	

Book 3 - Elevator Shaft

elevator shaft-region is a region. 
ground floor elevator shaft is in elevator shaft-region. 
second floor elevator shaft is in elevator shaft-region. "The door here is closed.".
third floor elevator shaft is in elevator shaft-region. "The door here is closed.".
fourth floor elevator shaft is in elevator shaft-region. "The door here is closed.".
fifth floor elevator shaft is in elevator shaft-region. "The door here is closed.".
sixth floor elevator shaft is in elevator shaft-region. "The door here is closed.".
seventh floor elevator shaft is in elevator shaft-region. "The door here is closed.".
eighth floor elevator shaft is in elevator shaft-region. "The door here is closed.".
ninth floor elevator shaft is in elevator shaft-region. "The door here is [if ninth floor elevator door is open]open[otherwise]closed[end if].".

Instead of examining up when the location is in elevator shaft-region:
	try examining the elevator car-backdrop;
	
Instead of examining down when the location is in elevator shaft-region and the location is not the ground floor elevator shaft:
	say "[We] [are] afraid of heights.";
	
Instead of examining down when the location is the ledge:
	say "There's a window cleaner's scaffold about six feet below [us]. Beyond that is a precipitous drop to the streets of New Reykjavik.";

The description of the ground floor elevator shaft is "[We] is at the bottom of a dark well. Shining [our] suit light up, [we] can see that the elevator car is several floors up, unmoving. There is a ladder running up the wall next to the door."

A ladder is a backdrop. It is in ground floor elevator shaft, second floor elevator shaft, third floor elevator shaft, fourth floor elevator shaft, fifth floor elevator shaft, sixth floor elevator shaft, seventh floor elevator shaft, eighth floor elevator shaft, ninth floor elevator shaft. The description is "A simple steel ladder."

The elevator car-backdrop is a backdrop. It is privately-named. The printed name is "elevator car". Understand "elevator/car" as the elevator car-backdrop. It is in ground floor elevator shaft, second floor elevator shaft, third floor elevator shaft, fourth floor elevator shaft, fifth floor elevator shaft, sixth floor elevator shaft, seventh floor elevator shaft, eighth floor elevator shaft, ninth floor elevator shaft, elevator car-room, and elevator top. The description is "this is a secret message".

Instead of examining the elevator car-backdrop:
	if location is ground floor elevator shaft or location is second floor elevator shaft or location is third floor elevator shaft or location is fourth floor elevator shaft:
		say "The elevator car hovers several floors above [us]. [We] prays it doesn't start to descend.";
	otherwise if location is fifth floor elevator shaft or location is sixth floor elevator shaft or location is seventh floor elevator shaft:
		say "The elevator car is just a few floors up.";
	otherwise if location is eighth floor elevator shaft:
		say "The elevator car is two floors up.";
	otherwise if location is ninth floor elevator shaft:
		say "The elevator car is just above [our] head.";
	otherwise if location is elevator car-room:
		try looking;
	otherwise:
		say "[We] [are] standing on top of the elevator car.";

Instead of climbing the ladder when the location is the ground floor elevator shaft:
	try going up;

Instead of using the ladder when the location is the ground floor elevator shaft:
	try going up;
	
[The useless elevator doors are a backdrop. It is privately-named. The printed name is "elevator door". Understand "elevator/door" as the useless elevator doors. 
It is in second floor elevator shaft, third floor elevator shaft, fourth floor elevator shaft, fifth floor elevator shaft, sixth floor elevator shaft, seventh floor elevator shaft, and eighth floor elevator shaft.]
	
After going from ninth floor elevator shaft to ninth floor elevator hall for the first time:
	score 1;
	say line break;
	converse "Jones: 'Finally out of the shaft. That was quite a climb.'

	Beck: 'This floor is just offices. Check the building management office to the west. It might have some useful stuff.'";
	continue the action;

After going from ninth floor elevator shaft to ninth floor elevator hall:
	now the ninth floor elevator door is closed;
	continue the action;

After going from ninth floor elevator hall to ninth floor elevator shaft:
	now the ninth floor elevator door is closed;
	continue the action;
	
Instead of jumping when the location is in the elevator shaft-region and the location is not the ground floor elevator shaft:
	say "Your sense of humor is very primitive, isn't it?";

Book 4 - Ninth Floor

The description of the ninth floor stairwell is "this is a secret message."

The description of the ninth floor elevator hall is "The elevator is to the west, the stairwell is to the east, and a corridor leads north and south. There is a bottled water vending machine here." Understand "corridor" as ninth floor elevator hall.

The ninth-floor-stairwell is scenery in the ground floor elevator hall. The printed name is "stairwell". Understand "stairwell/stairs" as the ninth-floor-stairwell. The description is "They lead up and down from here."

Instead of going to ninth floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
	say line break;
	print don't take the stairs;
	try looking;
	
The vending machine is scenery in the ninth floor elevator hall. The vending machine is a transparent, closed container. The bottled water is in the vending machine. The description of the vending machine is "This is a secret message."

Instead of examining the vending machine:
	if the vending machine contains the bottled water:
		say "There is one bottle left.";
	otherwise:
		say "The machine is empty.";

This is the can't reach inside the vending machine rule:
	if the container in question is the vending machine:
		say "[We] willl have to buy it first.";
		deny access;

The can't reach inside the vending machine rule is listed before the can't reach inside closed containers rule in the reaching inside rules.

Instead of inserting the coin into the vending machine:
	try buying the bottled water with the coin;
	
Instead of buying the bottled water with the coin:
	now the player carries the bottled water;
	remove the coin from play;
	say "[We] inserts the coin in the machine and takes the bottle that appears a few seconds later.";
	
After deciding the scope of the player when the location is the ninth floor elevator hall and the bottled water is in the vending machine:
	place the bottled water in scope;
	
rule for reaching inside the vending machine while buying the bottled water with the coin:
	allow access;
	
The description of the Ninth Floor North Hallway is "This anonymous corporate hallway ends here at the north end of the building. An open doorway leads west. To the east is a door labeled 'Cybernetica Inc.'";
	
The description of the Ninth Floor South Hallway is "This anonymous corporate hallway ends here at the south end of the building. An open doorway leads west. To the east is a door labeled 'Martian Chemical'";

Chapter 1 - Cybernetica office

The description of the Cybernetica office is "It[']s spacious and luxurious, designed to make developers forget how spent they are from months of overwork and abuse. Ergonomic desks and chairs fill space like a furniture fractal, before giving way to an open area, presumably for group activities[if cybernetica office is window-broken]. One of the windows along the east side of the office is broken[end if].".

The description of the Cybernetica door-inside is "This side intentionally left blank.".
	
The Cybernetica office can be window-broken.

Before going from a room (called R1) to an atmo-thin room (called R2) when R1 is not atmo-thin and the Atmo-Suit is not touchable:
	say "The atmosphere is too thin out there. [We] needs protective gear." instead;

Before going from Cybernetica office to ledge when the Atmo-Suit is touchable for the first time:
	converse "Jones: 'I'm going out the window to see if I can find a way to get up to the tenth floor.'
	
	Beck: 'Whoa whoa whoa, Jones. You know you're not good with heights.'
	
	Jones: 'Ask Thallium how how much that matters once I've kicked his ass. Watch me, I'll look down and not even flinch.'";

The cybernetica-desks are scenery in the Cybernetica office. They are privately-named. The printed name is "desks". Understand "desk/desks/chair/chairs" as the cybernetica-desks. "Very nice and good for hiding under and among."

Broken-window is scenery in the Cybernetica office. It is privately-named. The printed name is "broken window". Understand "broken/window/east/eastern" as broken-window. "Looks like [we] could get through if [we're] careful."
	
Chapter 2 - Outside

The description of the ledge is "She's plastered up against the wall, trying not to look down[if the floor of the window washing scaffold is 10]. The scaffold is right above [our] head[end if].".

The ledge-wall is scenery in the ledge. It is privately-named. The printed name is "wall". Understand "wall" as the ledge-wall. "Right now, it's [our] only friend."
	
Instead of examining down when the location is the ledge for the first time:
	say "Okay, fine. [We] look down, slowly, slowly... and there's a window cleaner's scaffold, about six feet below [us].[paragraph break]";
	change down exit of the ledge to window washing scaffold;
	converse "Jones: 'Okay, so. There's a window washing platform right below me. I might be able to drop down to it, but I won't be able to get back up.'
	
	Beck: 'Take it easy, Jones.'";
	now the window washing scaffold is discovered;
	
Instead of going down from ledge when the floor of the window washing scaffold is not 8:
	say "That would be a long fall.";
	
The window washing scaffold can be discovered.
	
Instead of jumping when the location is the ledge and the window washing scaffold is discovered:
	try going down;
	
Instead of jumping when the location is the ledge:
	say "On a [italic type]ledge?[roman type] Are you crazy?";
	
The description of the window washing scaffold is "lalala".

The window washing scaffold has a number called the floor. The floor is usually 8.

I hate it out here is a clip with conversation "[line break]Jones: 'Beck?'

Beck: 'Yes?'

Jones: 'I hate it out here.'

Beck: 'Well, there's the open window right next to you.'";

explaining the vent is a clip with conversation "Jones: 'Alright, I'm by the tenth floor now. What's this grill thing here?' 

Beck: 'That's an exhaust vent. There's an air handling room on this floor which it leads into. If you can get the cover off you should be able to access the whole floor from here.'"

Carry out looking when the location is the window washing scaffold (this is the describe the scaffold rule):
	if the floor of the window washing scaffold is 8:
		say "It's lined up with the eighth floor window. There doesn't seem to be any way to get into the building here. Mounted on the scaffold is a control panel with two buttons: one indicating up and one indicating down.";
	otherwise if the floor of the window washing scaffold is 9:
		say "It's lined up with the ninth floor window. [We] could climb back into the building through the window here. Mounted on the scaffold is a control panel with two buttons: one indicating up and one indicating down.";
		print I hate it out here;
	otherwise if the floor of the window washing scaffold is 10:
		say "It's lined up with the tenth floor. Instead of a window, there's what appears to be an exhaust vent. If it's for forced air, though, the fan is currently not running. Mounted on the scaffold is a control panel with two buttons: one indicating up and one indicating down.";
		say line break;
		print explaining the vent;
		
window-thing is scenery in the window washing scaffold. It is privately-named. The printed name is "window". Understand "window" as the window-thing.

Does the player mean opening the window washing scaffold: it is very unlikely;
		
fakeroom10 is west of window washing scaffold and inside from window washing scaffold.
fakeroom10 is east of air handling room and outside of air handling room.
The description of fakeroom10 is "this room is fake.".

[Every turn:
	if the location is window washing scaffold and the floor of the window washing scaffold is 9:
		now fakeroom10 is apparent;
	otherwise if the location is window washing scaffold and the floor of the window washing scaffold is 10 and the exhaust vent is open:
		now fakeroom10 is apparent;
	otherwise:
		now fakeroom10 is not apparent;]

Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 10:
	try entering the exhaust vent;
		
Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 9:
	move player to the cybernetica office;
		
Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 8:
	say "None of the windows here are open.";
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 10:
	try entering the exhaust vent;
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 9:
	move player to the cybernetica office;
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 8:
	say "None of the windows here are open.";
	
Instead of going east from the Cybernetica office when the floor of the window washing scaffold is 9:
	move the player to the window washing scaffold;
	
Instead of going east from the Cybernetica office when the floor of the window washing scaffold is not 9:
	move the player to the ledge;
	
Instead of going outside from the Cybernetica office when the floor of the window washing scaffold is 9:
	move the player to the window washing scaffold;
	
Instead of going outside from the Cybernetica office when the floor of the window washing scaffold is not 9:
	move the player to the ledge;

Instead of going east from the air handling room when the floor of the window washing scaffold is 10:
	move the player to the window washing scaffold;

Instead of going inside from the air handling room when the floor of the window washing scaffold is 10:
	move the player to the window washing scaffold;

Instead of going outside from the air handling room when the floor of the window washing scaffold is 10:
	move the player to the window washing scaffold;

Instead of going east from the air handling room when the floor of the window washing scaffold is not 10:
	say "The scaffold is not at this floor.";

Instead of going inside from the air handling room when the floor of the window washing scaffold is not 10:
	say "The scaffold is not at this floor.";

Instead of going outside from the air handling room when the floor of the window washing scaffold is not 10:
	say "The scaffold is not at this floor.";

	
The room description body text rule does nothing when the location is the window washing scaffold.
The describe the scaffold rule is listed last in the carry out looking rules.

The scaffold control panel is scenery in the window washing scaffold. "It's got two buttons: up and down.". Understand "buttons" as the scaffold control panel.

The scaffold up button is part of the scaffold control panel. The description is "It's a green button with an arrow pointing up.". Understand "green" as the scaffold up button.
The scaffold down button is part of the scaffold control panel. The description is "It's a red button with an arrow pointing down.". Understand "red" as the scaffold down button.




To set exits from scaffold:
	if the floor of the window washing scaffold is 8:
	[	change the down exit of the ledge to the window washing scaffold;
		change the west exit of the window washing scaffold to nothing;
		change the east exit of the Cybernetica office to the ledge;]
		move the exhaust vent to the room of stuff;
	if the floor of the window washing scaffold is 9:
		[change the down exit of the ledge to nothing;
		change the west exit of the window washing scaffold to the Cybernetica office;
		change the east exit of the Cybernetica office to the window washing scaffold;]
		move the exhaust vent to the room of stuff;
	if the floor of the window washing scaffold is 10:
		[change the down exit of the ledge to nothing;
		change the west exit of the window washing scaffold to nothing;
		change the east exit of the Cybernetica office to the ledge;]
		move the exhaust vent to the window washing scaffold;

Check pushing the scaffold up button:
	if the floor of the window washing scaffold is 10:
		say "Nothing happens." instead;
		
Carry out pushing the scaffold up button:
	increment the floor of the window washing scaffold;
	set exits from scaffold;

Report pushing the scaffold up button:
	say "[We] presses the button, and the scaffold begins to rise.";
	try looking;
	stop the action;

Check pushing the scaffold down button:
	if the floor of the window washing scaffold is 8:
		say "Nothing happens." instead;
		
Carry out pushing the scaffold down button:
	decrement the floor of the window washing scaffold;
	set exits from scaffold;

Report pushing the scaffold down button:
	say "[We] presses the button, and the scaffold begins to descend.";
	try looking;
	stop the action;

The exhaust vent is a scenery container. It is closed and openable. "It's a white metal grill held in place by four screws.". Understand "screws/grill/cover" as the exhaust vent.
The screws are part of the exhaust vent. The description is "Plain screws painted with white enamel."

Instead of unscrewing the exhaust vent with the screwdriver:
	if the exhaust vent is closed:
		now the exhaust vent is open;
		say "[We] loosens the screws with the screwdriver and removes the grill from the vent.";
	otherwise:
		say "The vent is already open.";
	
Instead of closing the exhaust vent:
	say "After [we] went to so much trouble to open it?";

Instead of opening the exhaust vent:
	try unscrewing the exhaust vent with the screwdriver;
	
Instead of unlocking the exhaust vent with the screwdriver:
	try unscrewing the exhaust vent with the screwdriver;
	
understand "remove [exhaust vent] with [screwdriver]" as unscrewing it with;
	
Instead of entering the exhaust vent when the exhaust vent is open for the first time:
	say "[We] climbs inside the vent, crawls along a short length of duct work, and emerges through another, hinged grill, into the air handling room.";
	score 1;
	now the player is in the air handling room;
	try taking off the atmo-suit;
	converse "Jones: 'Ha! I'm in!'
	
	Beck: 'Be careful, you[']re likely to run into more resistance here. The floor is all one open office, so any guard robots will have good line of sight.'
	
	Jones: 'Got it.'
	
	Beck: 'And Jones? Save your game.'";
	
Instead of entering the exhaust vent when the exhaust vent is open:
	say "[We] climbs inside the vent, crawls along a short length of duct work, and emerges through another, hinged grill, into the air handling room.";
	now the player is in the air handling room;
	try taking off the atmo-suit;
	
Instead of going nowhere from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is open:
	if the noun is west:
		try entering the exhaust vent;
	otherwise:
		say "[text of the can't go that way rule response (A)]";
		
Instead of taking off the exhaust vent:
	if the player carries the screwdriver:
		try unscrewing the vent with the screwdriver;
	otherwise:
		say "[We] doesn't have anything to remove the screws with.";
		
Instead of taking off the atmo-suit when the location is atmo-thin:
	say "That would be inadvisable in the thin Martian atmosphere.";

Chapter 3 - Building Management Office

The description of the north end of the building management office is "The building management office is a bunch of desks and task boards. There is a particularly large desk against the west window. The office exit is to the east, and the office continues to the south.";

The large desk is in the north end of the building management office. It is scenery. It is a container. It is closed, openable, locked, and lockable. "It's a pretty utilitarian desk of some plastic material. It has a single drawer with a lock.". Understand "drawer/lock" as the large desk.

Instead of unlocking the large desk with the safety pin:
	say "[We] pushes the pin into the keyhole and wiggles it around. After a few seconds of this the desk drawer pops open[if desk contains something]. It contains [a list of objects contained in the large desk][end if].";
	now the large desk is unlocked;     
	now the large desk is open;
	
The north-desks are scenery in the north end of the building management office. They are privately-named. The printed name is "desks". Understand "desks" as north-desks. "There are lots of them, none of which are particularly interesting."

The north-task-boards are scenery in the north end of the building management office. They are a white board. They are privately-named. The printed name is "task boards". Understand "task/tasks/board/boards" as north-task-boards. The writing is "[italic type]1. Describe scenery objects on Engineering Deck[line break]
2. Fix check rule when installing new engine component[line break]
3. Add more facts to computer database[line break]
4. Fix Arvax response to rebooting the ship computer[roman type]

and etc."	
	
picking it with is an action applying to two things. Understand "pick [something] with [something]", "pick [something] lock with [something]", "pick lock of/on [something] with [something]" as picking it with. 
picking with is an action applying to one thing. Understand "pick the/-- lock with [something]" as picking with.

Check picking something with something:
	say "Not likely." instead;

Check unlocking a locked lockable thing with the safety pin when the noun is keyed:
	say "[We] gives it a shot, but the lock won't turn." instead;

Check unlocking a locked lockable thing with the safety pin when the noun is not keyed:
	say "The lock doesn't take a regular key." instead;

Check picking a locked lockable thing with the safety pin when the noun is keyed:
	try unlocking the noun with the safety pin instead;

Check picking a locked lockable thing with the safety pin when the noun is not keyed:
	try unlocking the noun with the safety pin instead;
	
Check picking with something when the large desk is not touchable:
	say "What do you want [us] to pick?" instead;
	
Carry out picking with safety pin when the large desk is touchable:
	try unlocking the large desk with the safety pin;

Instead of picking the large desk with the safety pin:
	try unlocking the large desk with the safety pin;

The black cardkey is in the large desk. The black cardkey unlocks the Cybernetica door. The black cardkey unlocks the Martian Chemical door. Understand "card/key" as the black cardkey. The black cardkey is a cardkey. The description is "Black like evil, or like secrets?"

A filing cabinet is a container in the south end of the building management office. It is scenery. It is closed and openable. "An ordinary filing cabinet, with five drawers. The label on the front says 'Personnel Records'." Understand "file/files" as the filing cabinet.

Check opening the filing cabinet:
	say "[We] has better things to do than look through reams of personnel records." instead.

The description of the south end of the building management office is "The building management office is a bunch of desks and task boards. There is a filing cabinet against the east wall. The office exit is to the east, and the office continues to the north." 
	
The south-desks are scenery in the south end of the building management office. They are privately-named. The printed name is "desks". Understand "desk/desks" as south-desks. "There are lots of them, none of which are particularly interesting."

The south-task-boards are scenery in the south end of the building management office. They are privately-named. They are a white board. The printed name is "task boards". Understand "task/tasks/board/boards" as south-task-boards. The writing is "Jones is coming, surprise day off!".	
A screwdriver is in the south end of the building management office. "A screwdriver sits atop the filing cabinet." The description is "A standard Phillips screwdriver with a red plastic handle."

The black cat is an animal. The description is "It's really a beautiful cat, sleek and black.". It is undescribed.

The screwdriver can be behind the filing cabinet.

Instead of taking the screwdriver when the screwdriver is not handled and the screwdriver is not behind the filing cabinet and the shrimp tea sandwich is somewhere:
	move the black cat to the south end of the building management office;
	now the screwdriver is behind the filing cabinet;
	now the screwdriver is handled;
	now the screwdriver is undescribed;
	say "[We] reaches for the screwdriver, but [we] fumbles it and it rolls off the back of the filing cabinet.[paragraph break]";
	converse "Jones: 'Damn.'
	
	Beck: 'What? What's going on?'
	
	Jones: 'Just being clumsy is all.'";
	
The black cat can be angry.

Instead of looking behind the filing cabinet when the screwdriver is behind the filing cabinet:
	say "(taking the screwdriver)[command clarification break]";
	try taking the screwdriver;	

Instead of looking behind the filing cabinet when the screwdriver is not behind the filing cabinet and the black cat is not angry:
	say "[We] moves to look behind the filing cabinet, and in doing so, brushes the screwdriver off the back of the filing cabinet.[paragraph break]";
	move the black cat to the south end of the building management office;
	now the screwdriver is behind the filing cabinet;
	converse "Jones: 'Damn.'
	
	Beck: 'What? What's going on?'
	
	Jones: 'Just being clumsy is all.'";

Instead of taking the screwdriver when black cat is in the location and the black cat is not angry:
	say "[We] reaches behind the cabinet to retrieve the screwdriver. A swipe and a hiss make her recoil.[paragraph break]";
	converse "Jones: 'Holy --!'
	
	Beck: 'What now?'
	
	Jones: 'There's a cat here! Behind a filing cabinet. Gotta get behind there to get a screwdriver, so I need a way to drive off the cat.'";
	now the black cat is angry;
	
Instead of taking the screwdriver when black cat is in the location and the black cat is angry:
	say "Forget it. [We] isn't getting another scratch.";
	
After dropping the shrimp tea sandwich when black cat is in the location and the black cat is angry:
	say "Sensing food, the black cat pokes its head out, grabs the shrimp in its jaws, and races off. [We] takes the screwdriver.[paragraph break]";
	remove the black cat from play;
	remove the shrimp tea sandwich from play;
	now the player carries the screwdriver;
	now the screwdriver is not undescribed;
	now the screwdriver is not behind the filing cabinet;
	score 1;
	say line break;
	converse "Jones: 'Aha! No creature is too fearsome for Galaxy Jones!'
	
	Beck: 'Congratulations on your victory.'";
	
Instead of giving the shrimp tea sandwich to the black cat:
	try dropping the shrimp tea sandwich;

	
Chapter 4 - Martian Chemical Office

The description of the martian chemical office is "This seems like the business office of the chemical company rather than the lab. Most of the room is taken up by desks and other office stuff. There is a cabinet that looks intriguing, however.".

The chemical cabinet is scenery in the Martian Chemical office. "The cabinet is full of bottles of [Electrofil quick-setting conductive polymer gel]."

The Electrofil quick-setting conductive polymer gel is in the cabinet. The description of the Electrofil is "An opaque pink bottle labeled 'Electrofil' in large friendly letters." Understand "bottle" as the Electrofil quick-setting conductive polymer gel.

The untakable bottle is in the cabinet. It is undescribed. It is privately-named. Understand "bottle/Electrofil/quick-setting/conductive/polymer/gel" as the untakable bottle. The description is "this is a secret message."

Instead of taking the untakable bottle:
	Say "[We] has already taken one bottle of Electrofil from the cabinet. [We] should use it before taking another.";
	
Rule for clarifying the parser's choice of the Electrofil quick-setting conductive polymer gel when the untakable bottle is touchable:
	do nothing;

Book 5 - Tenth Floor

The description of the tenth floor stairwell is "this is a secret message."

The description of the air handling room is "There is a good number of loud fans and other air handling machinery here. A small hinged vent opening leads into some ductwork, and from there to the outside. A door leads west.".

The fans are scenery in the air handling room. "They're loud." Understand "machinery" as fans.

The ductwork is scenery in the air handling room. "A short length leading from the fans here to the outside." Understand "duct" as ductwork.

Instead of going to tenth floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
	say line break;
	print don't take the stairs;
	try looking;
	
To say elevator description:
	If the elevator car-room is not in running mode:
		say "The elevator car to the west stands open";
	otherwise if the floor of the elevator car-room is 10:
		say "The elevator car to the west stands open";
	otherwise:
		say "The elevators doors to the west are closed.";

The description of the tenth floor elevator hall is "[elevator description]. There is a stairwell to the east. The hall runs north and south into a sumptuous corporate office.";

The tenth-floor-stairwell is scenery in the tenth floor elevator hall. The printed name is "stairwell". Understand "stairwell/stairs" as the tenth-floor-stairwell. "They lead up and down from here."

The description of microthings-1 is "This is reception. It has a great view of the New Reykjavik Botanic Dome. Couches are lined up to take advantage. The floor east and west, and north to the elevator".

Reception is scenery in microthings-1. "No one is covering the desk at present."

The couches-microthings-1 are scenery enterable supporters in microthings-1. They are privately-named. The printed name is "couches". Understand "couch/couches/seat/seats/seating" as the couches-microthings-1. The description is "Tan leather couches, very expensive."

The New Reykjavik Botanic Dome is scenery in microthings-1. "A large geodesic dome made of lightweight and durable materials, designed to withstand the harsh conditions on Mars such as extreme temperatures, radiation, and dust storms. A green glow emanates from the translucent walls."

The description of microthings-2 is "This looks like the IT area of the office. Numerous desks and an abundance of computer parts are here. [We] can go north or east from here.".

The desks-microthings-2 is scenery in microthings-2. It is privately-named. The printed name is "desks". Understand "desk/desks" as desks-microthings-2. "How dull."

The computer parts are scenery in microthings-2. "Of no use to [us]."

The description of microthings-3 is "This ocean of desks looks out toward the Utopia Tower, twice the height of the Viking Building, where [we] is now. One can go north or south.".

The desks-microthings-3 is scenery in microthings-3. It is privately-named. The printed name is "desks". Understand "desk/desks" as desks-microthings-3. "More desks. Ho hum."

The Utopia Tower is scenery in microthings-3. "Incredible. A tower that height would never stand on Earth."

The description of microthings-4 is "Various executive offices line the north and west walls here. [We] can go east or south.".

The executive offices are scenery in microthings-4. "It's hard to imagine how anything useful could be in there."

The description of microthings-5 is "This is the company cafeteria. The elevator is south, the air handling room is to the east, and the office continues to the west and southeast.". 

The cafeteria is scenery in microthings-5. "The food looks like it would be delicious, if it weren't hours-old and cold."

The description of microthings-7 is "This part of the office is currently unused. [We] can go northwest or south from here.".
The description of microthings-8 is "This corner of the floor contains the gym and other company amenities. Reception is to the west, and an empty area lies to the north.".

The gym is scenery in microthings-8. "Looks well-equipped, but alas [we] doesn't have time to work out."
	
Chapter 1 - The Robot Chase

The mauve guard robot is a guard robot in microthings-2. The mauve guard robot is active.
				
The mauve guard robot has a room called the goal. The goal of the mauve guard robot is microthings-2.
The mauve guard robot has a room called the homebase. The homebase of the mauve guard robot is microthings-2.

oldloc is a room that varies.

Before going somewhere when the player is in tenth-floor-region and the mauve guard robot is somewhere:
	now oldloc is room of stuff;
	if the location of the mauve guard robot farsees the location:
		now oldloc is the location;
	
After going somewhere when the player is in tenth-floor-region and the mauve guard robot is somewhere:
	if oldloc is not the room of stuff and the location of the mauve guard robot farsees oldloc:
		now the goal of the mauve guard robot is the location;
	continue the action;

Every turn when the mauve guard robot is in the tenth-floor-region and the mauve guard robot is not under attack: 
	if the mauve guard robot is in the location:
		say "The robot slaughters Jones.";		
		end the story;
	otherwise if the goal of the mauve guard robot is not the location of the mauve guard robot:
		let D be the best route from the location of the mauve guard robot to the goal of the mauve guard robot;
		try the mauve guard robot going D;
		if the location of the mauve guard robot is the location:
			say "The robot slaughters Jones.";
			end the story;
	otherwise:
		now the goal of the mauve guard robot is the homebase of the mauve guard robot;
	if the location of the mauve guard robot farsees the location:
		now the goal of the mauve guard robot is the location;
		
Instead of shooting the mauve guard robot with something when the location is in the tenth-floor-region:
	say "[Our] shot goes wide.";

the describe room gone into rule does nothing when the noun is the mauve guard robot.

Chapter 2 - The Microthings Offices

The present is a thing in microthings-2. The description is "The note on the present says 'For Galaxy -- see you soon! -- Your friend, the Admiral.'". "There is a present with a note attached sitting on a desk here.". Understand "note/gift/box" as the present.
The golden key is a thing. The description is "It's a beautiful solid gold antique-style 'skeleton' key.".

Instead of unwrapping the present:
	try opening the present;
	
Instead of opening the present:
	remove the present from play;
	now the player carries the golden key;
	say "[We] rips the package open and discovers a golden key.";
	

Chapter 3 - The Elevator Car
	
The golden keyhole is scenery in the elevator car-room. "Inset in the mahogany panel, it looks like real gold and has the shape of an antique 'skeleton' key."

The elevator car-room has a number called the floor. The floor of the elevator car-room is 10.
The elevator car-room can be in running mode.

The ceiling panel is in the elevator car-room. "One of the ceiling panels looks loose." The description is "Asbestos? In this day and age?"

it's real ivory is a taunting clip with conversation "Admiral Thallium's voice oozes from concealed speakers: 'Yes, Jones, that is real ivory. I imported the elephant here myself for a hunt on my estate. You have no idea how much money it takes to simulate an African jungle on Mars. In retrospect I should have gotten an Indian elephant.'".

The description of the elevator car-room is "It's luxurious, with gold-plated walls and crystal lighting on the ceiling. The button panel is lacquered dark mahogany with what looks like real ivory buttons. The carpeting is soft and plush[If elevator car-room is in running mode]. A golden key rests in a golden keyhole above the buttons. The buttons 1, 9, 10, and 100 are illuminated[otherwise]. A golden keyhole sits above the buttons[end if].".

The elevator-car-door is scenery in the elevator car-room. It is privately-named. The printed name is "elevator car door". Understand "elevator/car/door" as the elevator-car-door. "The door is open."

Instead of opening the elevator-car-door:
	say text of the can't open what's already open rule response (A);

Instead of closing the elevator-car-door when the elevator is not in running mode:
	say "[We] can't close them by hand, and the elevator seems to be off."

Instead of closing the elevator-car-door when the elevator is in running mode:
	say "You don't need to explicitly open and close the elevator door."

The elevator-walls are scenery in the elevator car-room. They are privately-named. The printed name is "walls". Understand "walls/wall/gold/plated", "gold-plated" as elevator-walls. "Yes, that's real gold-plating."

The crystal lighting is scenery in the elevator car-room. "Nice. Excessive, but nice."

The elevator-control-panel is scenery in the elevator car-room. It is privately-named. The printed name is "elevator button panel". Understand "elevator/button/control/panel" as the elevator-control-panel. "The button panel is lacquered dark mahogany with what looks like real ivory buttons."

The ivory buttons are scenery in the elevator car-room. "[We] recoils in disgust."

The carpeting is scenery in the elevator car-room. "Soft and velvety in a deep red."

button pushing is an action applying to one number. Understand "push [number]" as button pushing. Understand "press [number]" as button pushing.

Check button pushing a number when the number understood is not listed in { 1, 9, 10, 100 } or the elevator car-room is not in running mode:
	say "Nothing happens." instead;
	
Check button pushing a number when the number understood is the floor of the elevator car-room:
	say "[We're] already on that floor." instead;
	
the elevator car-room has a number called the floor. The floor of the elevator car-room is 10.

To describe elevator ride from (F - a number) to (T - a number):
	if T is 100:
		say "The elevator accelerates upwards at a frightening rate. The numbers cllimb towards 100. Soon the elevator slows, and the door opens on the 100th floor.";
	otherwise if F is 100:
		say "The ride downward is a terrifying plunge, but at least it's over quickly.";
	otherwise:
		say "The elevator quickly arrives at its destination.";
	
Carry out button pushing a number:
	describe elevator ride from the floor of the elevator car-room to the number understood;
	now the floor of the elevator car-room is the number understood;
	try looking;

Report looking when the location is the elevator car-room:
	print it's real ivory;

Instead of going up from the elevator car-room when the ceiling panel is in the elevator car-room:
	say text of the can't go that way rule response (A);
	say line break;

Instead of taking the ceiling panel:
	remove the ceiling panel from play;	
	say "[We] removes the ceiling panel, exposing a hole wide enough for [us] to climb through.";
	
Instead of pushing the ceiling panel:
	try taking the ceiling panel;
	
Instead of pulling the ceiling panel:
	try taking the ceiling panel;

Instead of opening the ceiling panel:   
	try taking the ceiling panel;

Instead of inserting the golden key into the golden keyhole:
	remove the golden key from play;
	now the elevator car-room is in running mode;
	say "[We] puts the key in the keyhole and turns. There is a pleasant chime, and some buttons light up.";
	try looking;

After deciding the scope of the player when the location is top of the elevator car:
	If the mauve guard robot is in the elevator car-room:
		place the mauve guard robot in scope;
		
Rule for reaching inside the elevator car-room when the location is top of the elevator and the mauve guard robot is in the elevator car-room:
	allow access;
	
The description of the top of the elevator car is "The elevator shaft extends many hundreds of feet above here. [We] can see down into the elevator car from here[if the mauve guard robot is in the elevator car-room]. The mauve guard robot is in the car, looking around as if confused[end if].";

The upper-shaft is scenery in the top of the elevator car. It is privately-named. The printed name is "elevator shaft". Understand "elevator/shaft" as the upper-shaft. "The shaft extends far up into the darkness. The ladder here is missing, making it impossible to climb up to the eleventh floor and beyond."

Instead of examining down when the location is the top of the elevator car:
	say "[if the location of the mauve guard robot is the elevator car-room]The mauve guard robot is in the elevator car[otherwise]The elevator car is empty[end if].";

After the mauve guard robot going from the elevator car-room to the tenth floor elevator hall when the location is the top of the elevator car:
	say "The mauve guard robot exits the elevator car, out of sight.";

After the mauve guard robot going from the tenth floor elevator hall to the elevator car-room when the location is the top of the elevator car:
	say "The mauve guard robot enters the elevator car below.";
	
The description of the mauve guard robot is "This one looks, if anything, even meaner than the ones [we] has already seen[if location is top of the elevator car]. It's looking around as if confused[end if]. There is a small vent on the top of its head, probably to dispose of excess heat."

The mauve guard robot has a number called the attack countdown. 
The mauve guard robot can be under attack.

Point of weakness is a clip with conversation "Jones: 'I think I see a point of weakness. Now if I can just get in close enough...'

Beck: 'Just stay out of its line of sight.'".
The robot vent is a part of the mauve guard robot. It is privately-named. The printed name is "vent". The description is "Definitely a point of weakness.[paragraph break][print point of weakness]". Understand "vent" as the robot vent.



Instead of shooting the mauve guard robot with the disruptor pistol when the location is the top of the elevator car:
	say "From the top, even from this range, [our] shot is entirely ineffective. The robot swivels its head to find [us], and [we] barely jumps back out of sight.";

Instead of jumping on the mauve guard robot when the location is the top of the elevator car:
	say "[We] drops down through the ceiling and on to the guard robot. It swings around looking for [us], obviously panicked that it can't bring its gun to bear on its attacker. [reset LPR][We] manages to hang on.";
	now the mauve guard robot is under attack;
	now the attack countdown of the mauve guard robot is 3;
	move the player to the elevator car-room;
	
Instead of looking when the mauve guard robot is under attack:
	do nothing;

Every turn when the mauve guard robot is under attack:
	decrement the attack countdown of the mauve guard robot;
	if the attack countdown of the mauve guard robot < 1:
		now the mauve guard robot is not under attack;
		say "The mauve guard robot throws [us] from its back, and [we] goes sprawling into the corner of the elevator. The robot rotates its disruptor barrel to face [us], and opens fire.";
		end the story;
	otherwise:
		say "The mauve guard robot struggles against [our] hold on it, to no avail.";

Report waiting when the mauve guard robot is under attack:
	do nothing;
	stop the action;
	
Instead of pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot:
	say "[We] pours the gel into the	vent on the robot's head. The robot flails around wildly and throws [us] from its back, then lets out a loud crackling sound and stops moving.";
	score 1;
	now the mauve guard robot is not under attack;
	remove the mauve guard robot from play;
	move the dead mauve robot to the elevator car-room;
	remove the Electrofil quick-setting conductive polymer gel from play;
	try looking;
	
Instead of going when the mauve guard robot is under attack:
	say "[We] can't leave the elevator when [we're] hanging on nto the robot for dear life.".
	
Instead of pouring the Electrofil quick-setting conductive polymer gel on the robot vent:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot when the location is the top of the elevator car:
	say "[We] tries, but [we] can't get close enough to the robot.";

Instead of shooting the mauve guard robot with the disruptor pistol when the mauve guard robot is under attack:
	say "Firing would be too risky at this close range. [We] could easily hit [ourselves] with the rebound.";
	
Book 6 - 100th Floor

The roof stairs can be hidden. The roof stairs are hidden.

The description of the 100th floor elevator hall is "The luxury is staggering.  The walls are made of polished black marble, and the floors are covered in plush black carpeting that muffles the sound of footsteps. The ceiling is high and adorned with a crystal chandelier. The elevator doors to the west are gold-plated. Sumptuous living quarters are visible to the north and south[if roof stairs are not hidden]. A portion of the eastern wall has slid away to reveal a stunning white marble staircase[end if].".

The walls-100 is scenery in the 100th floor elevator hall. They are privately-named. The printed name is "walls". Understand "wall/walls" as the walls-100. "Black marble. Wow. It's beautiful."

The carpet-100 is scenery in the 100th floor elevator hall. It is privately-named. The printed name is "carpet". Understand "carpet/carpeting/rug/floor" as the carpet-100. "Dark black, almost threatening, rounding out the storm cloud atmosphere of the room."

The chandelier is scenery in the 100th floor elevator hall. "An enormously extravagant display of crystal."

The elevator-doors-100 are scenery in the 100th floor elevator hall. They are privately-named. The printed name is "elevator doors". Understand "elevator/door/doors" as elevator-doors-100. "It's not clear why everything has to be so extravagant."

stairs appeared is a clip with conversation "Jones: 'Must be the way up to the roof. Beck, you there?'

Beck: 'Yep, I'm here, just a bit busy is all. I[']ll meet you on that roof.'".

After looking when the location is the 100th floor elevator hall and the roof stairs are not hidden:
	print stairs appeared;
	
Instead of going east when the location is 100th floor elevator hall:
	if the roof stairs are hidden:
		say text of the can't go that way rule response (A);

the penthouse north has description "This is Thallium's bedroom. Apart from the expansive round bed in the center of the room, notable features include the line of dummies displaying his various suits of clothes, a large vanity table, and the complete lack of mirrors on the ceiling, thankfully. One may leave the room to the southwest, south, and southeast.". The printed name is "northern corner of the penthouse".

The bed is scenery in the penthouse north. "It's round and huge, and it looks supremely comfortable."
Instead of entering the bed:
	say "No time for lying down.";	

Understand "lie on [something]" as entering.

The dummies are scenery in penthouse north. "The best outfit is his Napoleon outfit." Understand "clothes/clothing/outfits/suits" as dummies.

The vanity table is scenery in penthouse north. "So aptly named for a man like the Admiral."

the penthouse east has description "This is apparently an office. A huge desk constructed of bubinga wood and carved in intricate patterns sits before the panoramic window. Video screens, currently displaying Thallium's logo, line the walls. Jones can go northwest or southwest.". The printed name is "eastern corner of the penthouse".

The huge desk is scenery in penthouse east. "Bubinga wood, if you must know, is, according to Wikipedia, 'a flowering plant genus in the family [italic type]Fabaceae'[roman type]."

The video screens are scenery in penthouse east. "They are showing Thallium's logo, the ten planets in order overlaid with the motto 'Planetas Vincam'."

the penthouse south has description "This must be Thallium's 'treasure room', to go by the obscene display of wealth. The most notable feature is the array of diamonds lining the walls. Everything else here pales in comparison. The penthouse continues to the northwest, north, and northeast.". The printed name is "southern corner of the penthouse".

The conversation of the penthouse south is "Thallium seems to speak from all around [us]. 'You like diamonds, Jones? Of course you do -- they're a girl's best friend, after all.'
	
	Jones snorts, 'Sure, Thallium.'".
	
A gem is a kind of thing. Understand "diamonds/gem/gems" as the gem.
The glass diamond is a gem. The glass diamond can be discovered. The printed name is "[if discovered]glass diamond[otherwise]diamond". The description is "Worthless.".

The real diamond is a gem in the room of stuff. The description is "Maybe 2.5 carats, it's a beautiful gem, if you're into diamonds."

Instead of examining the real diamond when the real diamond is in the room of stuff:
	say "So many of them, from the tiny to the obscenely large. It looks like it wouldn't be hard to pry one out.";

Rule for clarifying the parser's choice of something when doing something to the glass diamond:
	do nothing;

After deciding the scope of the player when the location is penthouse south and the real diamond is in the room of stuff:
	place the real diamond in scope;
	
Instead of taking the real diamond when the glass diamond is nowhere and the glass diamond is not discovered:
	now the player carries the glass diamond;
	say text of the standard report taking rule response (A);
	say paragraph break;
	converse as thallium "Thallium giggles. 'Oh, I hope you're not disappointed, Jones.'";
	
Instead of examining the glass diamond when the glass diamond is not discovered: 
	say line break;
	converse "Jones: 'Hmm. This is made of glass.'
	
	Thallium: 'Poor, sad Jones. But here's the thing. There [special-style-2]is[special-style-1] a real diamond in there; it's just you'll never find it before the building's defenses flood the whole floor with poisonous gas. Or maybe I'm bluffing. Maybe I'm not. Can you afford to gamble?'";
	say line break;
	say "Jones tosses the fake away.";
	remove the glass diamond from play;
	now the glass diamond is discovered.

attacking it with is an action applying to one thing and one carried thing. Understand "attack [something] with [something]" as attacking it with.

Check attacking something with something:
	say text of the block attacking rule response (A);
	say line break instead;

Instead of attacking the real diamond with the hammer:
	say "[We] commences to smash all of the diamonds. After destroying several dozen fraudulent gems, [we] finds one that won't break. [We] takes the real diamond.[paragraph break]";
	now the player carries the real diamond;
	converse "Thallium: 'Wow, clever solution. Be careful you don't cut yourself.'
	
	Jones: 'I appreciate your concern.'"
	
Instead of attacking the real diamond:
	if the player carries the hammer: 
		say "(with the hammer)[command clarification break]";
		try attacking the real diamond with the hammer;
	otherwise:
		say "What do you want to attack it with?";
	
Instead of taking the real diamond when the glass diamond is somewhere:
	say "[We] has already taken a diamond. Isn't one enough?";

Instead of taking the real diamond when the glass diamond is discovered and the real diamond is in the room of stuff:
	say "[We] will never find the real diamond this way.".

the penthouse west has description "The purpose of this room is unclear. Instead of the black carpet that plagues the rest of the penthouse, the floor is fashioned from a striking polished red granite. Instead of windows, there are walls. Thallium's personal insignia, the ten planets in order overlaid with the motto 'Planetas Vincam', is carved into the deep red wood outer wall, and inlaid with ebony. In the center of the room is a thin metal pillar ending in a claw, which looks like it's meant to hold something. Finally, there is something that looks like an electronic eye set into the inner wall. One may leave to the northeast or southeast.". The printed name is "western corner of the penthouse".

The metal pillar is scenery in the penthouse west. 
The claw is part of the metal pillar. It is a container with carrying capacity 1. The description is "It looks like it could grip a small object.".

Instead of inserting something that is not a gem into the claw:
	say "That won't fit in the claw.";

Instead of inserting a gem into the claw:
	now the noun is in the claw;
	if the noun is the glass diamond:
		say "As soon as [We] inserts [the noun] into the claw, laser beams spring from five emitters on the walls. They hit the diamond and refract and disperse without any effect.";
	otherwise:
		say "As soon as insert [the noun] into the claw, laser beams spring from five emitters on the walls. They hit the diamond and join into a single more powerful beam that strikes the electronic eye on the wall. A sound like a sliding door comes from behind [us], and [we] spins around to see the red wall slide down into the floor. It exposes a control panel of sorts, featuring a large red button labeled 'Press Me'.";
		now the control panel is in the penthouse west;
		
The penthouse control panel is a scenery thing. The penthouse control panel can be discovered. "The panel features two buttons, one a large red button labeled 'Press Me', and the other a small black button without a label.'".

The large red button is a part of the penthouse control panel. The description is "It's labeled 'Press Me'."
The small black button is a thing. The description is "Very nondescript."

Instead of examining the penthouse control panel when the penthouse control panel is not discovered:
	say "[We] discovers a secret panel, which when opened exposes a small black button.";
	now the penthouse control panel is discovered;
	now the black button is a part of the penthouse control panel;
	
Instead of pushing the large red button for the first time:
	converse "Thallium's voice startles [us], and [we] forgets the button for a moment. 
	
	'Yes, yes, press it!', Thallium squeaks.";
	
Instead of pushing the large red button:
	say "[We] presses the red button, but nothing seems to happen. After a few seconds, however, [we] starts to feel light-headed, and shortly after she starts to suffocate. It's not a nice way to die.";
	end the story saying "Galaxy Jones was killed by poison gas.";
	
Instead of pushing the small black button:
	say "Somewhere beyond this room comes the sound of something heavy being moved.";
	now the roof access door is unlocked;
	now the roof stairs are not hidden;
	
The granite floor is scenery in penthouse west. "On Mars, sometimes one gets tired of red." 

The insignia is scenery in penthouse west. "'Planetas Vincam', incidentally, means 'I will conquer the planets.'" 

The electronic eye is scenery in penthouse west. "Looks like it might be a sensor of some sort."
	
The description of the roof stairs is "Thick slabs of marble lead from the hall to the west to the rooftop door above.";

Book 7 - The Rooftop

The rooftop is a region. The cage, the penthouse roof, and the landing pad are in the rooftop.

Chapter 1 - Scenes

Endgame is a scene. Endgame begins when the location is penthouse roof.

On-Rooftop is a scene. On-Rooftop begins when the location is penthouse roof. On-Rooftop ends when Thallium alight begins.

[penthouse roof has a number called the count. The count of the penthouse roof is 0.]

Thallium alight is a scene. Thallium alight begins when the player is in cage or the player is in flyer pad.

When Thallium alight begins:
	if player is in cage:
		say "South of the cage, Thallium crosses the roof to the flyer pad, where he boards the waiting flyer. The flyer lifts off and moves towards Jones.";
		move Admiral-Thallium to the room of stuff;

Before going to flyer pad during On-Rooftop:
	say "Thallium trails after Jones.";
	say line break;
	converse as Thallium "Um, Jones -- that harlot you're so bent on freeing from captivity is over [special-style-2]there[special-style-1]. Now get out of the way, I'm trying to escape.'
	
	Thallium shoulders past [us]. [We] attempts to grab his shoulder, but [we] is thrown back by an unseen force.
	
	Thallium smirks. 'Personal security field, remember? Now I must be off.'
	
	Jones watches as Thallium boards the flyer. It takes off a moment later.";
	move Admiral-Thallium to the room of stuff;
	[increment the count of the penthouse roof;]
	[say line break;
	say penthouse roof text;
	say ".";]
	
Check shooting something with the disruptor pistol during endgame:
	say "[Our] disruptor does nothing. Looks like Thallium was telling the truth." instead;
	
Thallium alight ends when time since Thallium alight began is 2 minutes.

Thallium ultimatum is a scene.
Thallium ultimatum begins when Thallium alight ends.

When Thallium ultimatum begins:
	converse as thallium "Thallium's flyer hovers over the rooftop. 'Jones!'  he bellows. 'Play time is over. I grow weary of your intransigence. In a moment this roof will be swarmed by guard robots -- of many different colors -- so many robots you couldn't possibly vandalize them all.  Say your prayers, Jones, or whatever you do when you're about to die.'
	
	Jones rolls her eyes.";
	converse "[line break]A little ways off, a small red flyer aims for the rooftop and accelerates.";

Before going somewhere during Thallium ultimatum:
	say "Thallium's flyer floats after Jones.";
	
Saving Europa is a scene. Thallium ultimatum ends when Admiral Thallium's Flyer is nowhere. 
Saving Europa begins when Thallium ultimatum ends.

The red flyer is a backdrop. The description is "Jones's little red flyer, Galaxy Two."

When Saving Europa begins:
	converse "The red flyer, now recognizable as Galaxy's own, settles down onto the landing pad.";
	move the red flyer to the rooftop;
 
Chapter 2 - Penthouse Roof

[Check opening the roof access door when the roof access door is unlocked and the location is the roof stairs:]
Check going east when the location is the 100th floor elevator hall:
	if DEBUG is false:
		say "[line break]Are you sure you wish to face the evil Admiral Thallium? Are you ready to pass the point of no return?[line break]>";
		if the player consents:
			continue the action;
		stop the action;
	continue the action;
	
After going to the penthouse roof for the first time:
	now the roof access door is closed;
	now the roof access door is locked; 
	say "[We] opens the door and steps through onto the roof. The door crashes shut, and a lock audibly clicks.";
	score 1;
	continue the action;
	

Report going to penthouse roof for the first time:
	say line break;
	converse as thallium "Jones walks out onto the luxurious penthouse roof. Admiral Thallium turns from the railing to face [us]. He is dressed in an absurd elaboration of a Martian Admiral's uniform. He looks Jones up and down with a lecherous leer. 'Ah, Galaxy Jones, as lovely as ever. If it weren't so unbearably cliché I[']d ask you to join me in my rise to greatness. But alas, you are too habituated to the smug high of [']goodness['].' He sighs dramatically. 'We've trodden similar ground before; no need to discuss it further. Although I would challenge any of your various [special-style-2]amoureux[special-style-1] to conjugate [']tread['] correctly.
	
	'Anyway, I guess this is the time where you do something predictably undignified and violent. Before you do I feel I should inform you that your sidearm has been rendered quite ineffective by my personal security field. But do go ahead and try it.'
	
	Jones sneers. 'I wouldn't give you the satisfaction,' she says, looking around. 'I see you don't have any of your robot pets up here. How are you going to stop me from rescuing Europa?'
	
	'Oh please, while we're trying things, try that too. I wish you luck breaking the silnium bars of the cage.'
	
	'What's silnium?'
	
	'A superstrong material invented here in my Martian Chemical laboratory. We had a press conference for it -- weren[']t you watching?'
	
	'Couldn[']t be bothered.'
	
	'Oh for frotz sake, Jones, you're so frustrating!'
	
	Thallium turns his back on Jones and stares out over the city.";
	

	

[To say penthouse roof text:
	If the count of the penthouse roof is 0:
		say "Numerous flyers dot the skies around the city";
	if the count of the penthouse roof is 1:
		say "An unidentified flyer is headed towards the building";
	if the count of the penthouse roof is 2:
		say "An aircraft is almost upon the building, flying low. It is a small Martian flyer, painted with a galaxy logo";
	if the count of the penthouse roof is 3:
		say "Jones's flyer hovers above the roof, looking to land";
	if the count of the penthouse roof is 4:
		say "Jones's flyer rests on the landing pad";]

Rule for writing a paragraph about Admiral-Thallium when Admiral-Thallium is in penthouse roof:
	say "[Admiral-Thallium] is sulking.";

The description of the penthouse roof is "It is an extravagant and opulent space, designed to showcase Thallium's wealth and power. Much of the rooftop is devoted to an outdoor lounge area, with comfortable seating and a fire pit, centered around a hot tub and flanked by a bar. All around is the city of New Reykjavik, and beyond that the red Martian landscape. Around the entirety of the roof is an electrostatic field designed to keep air in and particulates out. To the north is a large cage, and to the west is a landing pad[if Europa Callisto is in the cage]. Jones can distantly see a woman lying on the floor of the cage[end if][If Admiral-Thallium is in penthouse roof]. A green and black flyer sits on the landing pad[end if]."

The lounge area is scenery in the penthouse roof. "Looks like a good time, if [we] weren't already busy." Understand "fire/pit/bar" as the lounge area.

The rooftop seating is scenery in the penthouse roof. "[We] has other things to focus on."

Admiral-Thallium is in penthouse roof.

Admiral Thallium's Flyer is a backdrop. It is in penthouse roof, cage, and flyer pad. The description is "this is a secret message".
Instead of examining Admiral Thallium's flyer during On-Rooftop:
	say "It's big and green and black. Looks like a Sirius XE."

Instead of examining Admiral Thallium's flyer during Thallium alight:
	say "Hovering above [us], it's distinctly menacing. It's not visibly armed, but it conveys the impression of a beast about to strike. It's flying low, the rails of its landing gear just a few feet above Jones's head.";

Instead of examining Admiral Thallium's flyer during Thallium ultimatum:
	say "Hovering above [us], it's distinctly menacing. It's not visibly armed, but it conveys the impression of a beast about to strike. It's flying low, the rails of its landing gear just a few feet above Jones's head.";

The description of cage is "[if the cage is not broken]The closely-set silnium bars seem to dash all hope of a rescue.[otherwise]The whole structure is tilted, leaving a hole at the eastern end.[end if]".

Bars don't budge is a descriptive clip with conversation "Jones tries the strength of the bars just in case. They don't budge.".

Report looking when the location is the cage:
	print bars don't budge;

Europa Callisto is in a cage.
	
Instead of doing something to Europa Callisto when action requires a touchable noun and the cage is intact:
	say "[We] can't reach Europa inside the cage." instead;
	
Instead of doing something when action requires a touchable second noun and the second noun is Europa Callisto and the cage is intact:
	say "[We] can't reach Europa inside the cage." instead;

The cage can be intact or broken. The cage is intact.

Rule for writing a paragraph about Europa Callisto when Europa Callisto is in the cage and the cage is intact:
	say "[Europa Callisto] is lying at the center of the cage, out of [our] reach.";

Rule for writing a paragraph about Europa Callisto when Europa Callisto is in the cage and the cage is broken:
	say "Jones is kneeling at Europa Callisto's side, trying to rouse her.";
	
The cage-thing is a privately-named enterable supporter in the cage. It is scenery. The printed name is "cage". Understand "cage/bars/silnium" as the cage-thing. "The cage is huge for holding just one prisoner. The silnium bars are grey and iridescent. They run both horizontally and vertically, creating a lattice."

Instead of climbing the cage-thing:
	try entering the cage-thing;
	
Does the player mean doing something to the cage:
	it is very unlikely;
	
Does the player mean doing something to the cage-thing:
	it is very likely;
	
Chapter 3 - Hooking the flyer

To break the cage:
	say line break;
	converse "[We] throws the cable up to the flyer where it hooks around the rail, and attaches the other end to the cage, then jumps off the cage to escape the aftermath. Seeing his flyer's predicament, Thallium jumps through the door and disappears below the edge of the roof. The flyer reaches the end of its tether and slingshots downwards, slamming into side of the building.
	
	The cage has tilted to the side, one attachment torn loose from the rooftop. Jones crawls into the cage to see to Europa Callisto. 
	
	'Europa! Can you hear me? I need you to move to get out of this cage. I can't carry you through that small opening. Europa!'
	
	Europa moans but doesn't show any signs of having understood Jones.";
	remove Admiral Thallium's flyer from play;
	remove the hook cable from play;
	now the cage is broken;
	move the player to the cage;

Instead of throwing the hook cable at admiral thallium's flyer when the player is on the cage-thing:
	say line break;
	converse "[We] throws the cable up to the flyer where it hooks around the rail, and attaches the other end to the cage, then jumps off the cage to escape the aftermath. Seeing his flyer's predicament, Thallium jumps out of the flyer and disappears below the edge of the roof. The flyer reaches the end of its tether and slingshots downwards, slamming into side of the building.
	
	The cage has tilted to the side, one attachment torn loose from the rooftop. Jones crawls into the cage to see to Europa Callisto. 
	
	'Europa! Can you hear me? I need you to move to get out of this cage. I can't carry you through that small opening. Europa!'
	
	Europa moans but doesn't show any signs of having understood Jones.";
	remove Admiral Thallium's flyer from play;
	remove the hook cable from play;
	now the cage is broken;
	move the player to the cage;
		
Instead of tying the hook cable to the cage-thing when the player is on the cage-thing:
	say line break;
	converse "[We] attaches one end of the cable to the cage, and throws the other end up to the flyer where it hooks around the rail, then jumps off the cage to escape the aftermath. Seeing his flyer's predicament, Thallium jumps out of the flyer and disappears below the edge of the roof. The flyer reaches the end of its tether and slingshots downwards, slamming into side of the building.
	
	The cage has tilted to the side, one attachment torn loose from the rooftop. Jones crawls into the cage to see to Europa Callisto. 
	
	'Europa! Can you hear me? I need you to move to get out of this cage. I can't carry you through that small opening. Europa!'
	
	Europa moans but doesn't show any signs of having understood Jones.";
	remove Admiral Thallium's flyer from play;
	remove the hook cable from play;
	now the cage is broken;
	move the player to the cage;

Instead of throwing the hook cable at admiral thallium's flyer:
	say "[We] throws the cable, but it comes up short. [We] gathers it up again.";
	
Instead of tying the hook cable to the cage-thing when the player is not on the cage-thing:
	say "It doesn't seem useful to attach the cable to this part of the cage.";
	
Chapter 4 - The Flyer Pad

The description of the flyer pad is "This is what one would expect from a rooftop flyer pad: landing lights surrounding a large letter F painted in white on a red background."
	
Chapter 5 - The Water Bottle

Instead of giving the bottled water to Europa when the cage is broken:
	converse "[We] opens the water bottle and brings it to Europa's lips. Even with closed eyes she drinks, first slowly and then with increasing vigor, until her eyes open.
	
	'Ga- Galaxy Jones?' she says.
	
	Jones nods, but says 'We'll have time for introductions later. We have to get out of here before the roof is full of killer robots. Can you crawl? If you can get through that hole I can carry you the rest of the way.'
	
	Europa nods. 'I think so.'
	
	Galaxy Jones helps her through the hole in the cage, then gently picks her up and jogs toward the waiting flyer. Beck's familiar face appears at the door of the aircraft, urging her on.";
	say line break;
	converse as thallium "Not so far away, Admiral Thallium crawls back over the edge of  the roof. As he pulls himself up, he aims a pistol at Jones's back...";
	say line break;
	converse "...and she falls sprawling on the landing pad, Europa Callisto tumbling from her arms. Beck is by Callisto's side in a moment, lifting her and carrying her into the flyer.";
	say line break;
	converse as thallium "And then the robots swarm the roof like a mechanical rainbow tide. By the time Beck returns to the door it is already too late. A group of robots surrounds Jones, while another robot carries Thallium triumphantly. Beck has no choice but to take off, leaving Jones behind, not knowing if she still lives...";
	end the story finally saying "The End, For Now..."
	
Instead of going during Saving Europa:
	say "[We] can't leave Europa now!";
	
Instead of entering during Saving Europa:
	say "[We] can't leave Europa now!";
	
When Saving Europa begins:
	Beck shouts in two turns from now;
	
At the time when Beck shouts:
	say "Beck sticks his head out of the door of the flyer and yells 'C'mon Jones, get Europa and get in the flyer!'";
	
	
Volume 9 - The End, etc

To show credits:
	say "Extensions by:[line break]";
	say italic type;
	say the list of extension credits;
	say roman type;
	say line break;
	say "Story by Phil Riley.";
	say "Programming by Phil Riley.";
	say "Playtesting by Leon Lin, Oliver Matthias, and Jade.";
	say "Invaluable inspiration from Laura Taalman.";
	say line break;
	say "The story, all names, characters, and incidents portrayed in this production are fictitious. No identification with actual persons (living or deceased), places, buildings, and products is intended or should be inferred.";
	say line break;
	say "Promotional consideration provided by Olympus Springs Inc.";
	say paragraph break;
	say "...";
	say paragraph break;
	
To screen print (T - a text):
	say "[italic type]<[T]>[roman type][paragraph break]";
	
After printing the player's obituary when the story has ended finally:
	say paragraph break;
	show credits;
	screen print "Black screen";
	say "'Jones! Jones! Wake up! I'm trying to talk to you!'";
	say line break;
	screen print "Cut to a shot of two closed eyes";
	say "'C'mon, open those eyes.'";
	say line break;
	screen print "The shot widens to show Galaxy Jones, the Solar System's greatest hero, flat on the floor, seemingly unconscious";
	say "'This is getting tiresome, Jones. Stop playing dead.'";
	say line break;
	say "Her eyes flutter open, close again, then open. She winces and brings one hand up to shield her eyes. 'Who's that?' she says, hoarsely.";
	say line break;
	converse "Join Galaxy Jones next time in [special-style-2]Galaxy Jones II: Existential Time Crisis![special-style-1]";
	print the galaxy banner;
	
Volume 10 - Speech

Book 1 - Talking to Beck

Understand "ask [someone] about [any visited room]" as quizzing it about.
Understand "ask about [any visited room]" or "a [any visited room]" as implicit-quizzing.
Understand the command "tell" as something new.

After deciding the scope of the player:
	place beck in scope;
	
Instead of doing something to Beck when action requires a touchable noun:
	say "Beck is just a voice in [our] ear." instead;
	
Instead of doing something when action requires a touchable second noun and the second noun is Beck:
	say "Beck is just a voice in [our] ear." instead;
	
Instead of doing something to Beck when action requires light:
	say "[We] can't see Beck.";

After asking Beck about something:
	say line break;
	converse "Beck: 'I'm not sure what you're asking about, Jones.'";

Report quizzing Beck about something:
	say line break;
	converse "Beck: 'Hmm. Don't have much to say about that right now.'";
	stop the action;

After quizzing Beck about guard-robots when comment on energy absorption is unused during Lobby Shootout:
	say line break;
	converse "Beck: 'Keep your head down and keep firing.'";	

After quizzing Beck about guard-robots when comment on energy absorption is used during Lobby Shootout:
	say line break;
	converse "Beck: 'It doesn't look like shooting the robots is doing any good. Is there another way you can hurt them?'";
	
After quizzing Beck about the hook cable:
	say line break;
	converse "Beck: 'Could come in handy.";
	
After quizzing Beck about the Lobby:
	say line break;
	converse "Beck: 'Impressive place.'";
	
After quizzing Beck about the Speeder Dock:
	say line break;
	converse "Beck: 'Guess everyone went home when Thallium went ape.'";
	
After quizzing Beck about the 100th floor elevator hall:
	say line break;
	converse "Beck: 'This guy's got some kind of inferiority complex.'";
	
After quizzing Beck about Admiral Thallium's Flyer:
	say line break;
	converse "Beck: 'It's a nice vehicle, I'll give him that. Have you ever noticed villains always have ugly houses and beautiful flyers?'";
	
After quizzing Beck about Admiral-Thallium:
	say line break;
	converse "Beck: 'Wonderful man, can't get enough of him.'";
	
After quizzing Beck about the air handling room:
	say line break;
	converse "Beck: 'Good thing this was here. Don't see why we'd hang around, though.'";
	
After quizzing Beck about the Atmo-Suit when the ledge is not visited:
	say line break;
	converse "Beck: 'Hope we don't have to use it.'";
	
After quizzing Beck about the Atmo-Suit when the ledge is visited:
	say line break;
	converse "Beck: 'Good thing this was around.'";
	
After quizzing Beck about the Atmo-Suit when the ledge is not visited:
	say line break;
	converse "Beck: 'Hope we don't have to use it.'";
	
After quizzing Beck about Beck:
	say line break;
	converse "Beck: 'I'm just happy to serve.'";
	



Chapter 2 - Pleading / Help

Pleading is an action applying to nothing. Understand "ask beck for help", "ask beck what to do" as pleading.

Report pleading: 
	say line break;
	converse "Beck: 'Looks like you're managing okay.'";

To decide what number is plead (ID - a value):
	if there is an id of ID in the Table of Pleading Counts:
		let c be the count corresponding to an id of ID in the Table of Pleading Counts;
		if c is 3:
			decide on 3;
		increment c;
		now the count corresponding to an id of ID in the Table of Pleading Counts is c;
		decide on c;
	otherwise:
		choose a blank row in the Table of Pleading Counts;
		now id entry is ID;
		now count entry is 1;
		decide on 1;

Table of Pleading Counts
id (value)	count (number)
with 100 blank rows;	


Volume 11 - Language 

Book 1 - Verbs

to approach is a verb. to enter is a verb. to dive is a verb. to miss is a verb. to start is a verb. to fire is a verb. To draw is a verb. to stick is a verb.

Volume 12 - Prettiness

Book 1 - Moving Between Rooms 
 
Table of Transitions
source room (a room)	target room (a room)	transition text (a text)	spoken (a number)
speeder dock	entry doorway	"[We] [approach] the Viking Building entryway, the dramatic façade towering over [us]."	--
entry doorway	speeder dock	"[We] slinks back to the speeder dock."
entry doorway	lobby	"[We] passes through the revolving door and into the lobby, alert to any defenses."
lobby	entry doorway	"[We] leaves the building."
lobby	ground-floor-1	"[We] crosses the floor carefully, [disruptor pistol] at the ready."
lobby	ground-floor-7	"[We] crosses the floor carefully, [disruptor pistol] at the ready."
ground floor elevator hall	ground floor elevator shaft	"[We] climbs into the elevator shaft"
the Cybernetica office	ledge	"[We] climbs out the window."
ledge	window washing scaffold	"[We] drops off the ledge onto the scaffold. It rocks unnervingly for a moment."
ground floor elevator  shaft	ninth floor elevator shaft	"[We] climbs up the shaft, stopping at each floor to test each door. [We] gets all the way to the ninth floor, directly below the elevator car, before finding one that opens."

To decide which text is the transition for (source - a room) to (target - a room):
	repeat through the Table of Transitions:
		if (source room entry is source) and (target room entry is target) and there is no spoken entry:
			decide on transition text entry;
	decide on "none";
	
To mark transition text for (source - a room) to (target - a room) as used:
	repeat through the Table of Transitions:
		if (source room entry is source) and (target room entry is target) and there is no spoken entry:
			now spoken entry is 1;

After going from a room (called R1) to a room (called R2): 
	let transition text be the transition for R1 to R2;
	if transition text is not "none":
		say "[transition text][paragraph break]"; 	
		mark transition text for R1 to R2 as used;
	continue the action;
	
Volume 13 - A few extra descriptions

the description of light-meter is "no need for a description".
	
Volume 14 - Not for release

DEBUG is true. 

Understand "* [text]" as a mistake ("Noted.").

Include Property Checking by Emily Short.

Volume 15 - Tests

test elevator with "n/n/z/shoot art/x art/e/n/type 0/w/take all/e/x table/take all/n/x medals/take medal/x medal/take pin/w/w/s/e/take all/w/s/x waterfall/take coin/e/n/use drop key with elevator".
test ninth with "test elevator/w/u/u/u/u/u/u/u/u/e".
test mgmt with "test ninth/buy water with coin/n/w/pick desk lock with pin/take black card/s/take screwdriver/look behind cabinet/drop shrimp/look behind cabinet/e".
test ledge with "test mgmt/e/take gel from cabinet/w/n/n/e/sneak up on robot/sneak up on robot/sneak up on robot/shoot robot/s/n/e".
test air with "test ledge/look down/look down/look down/d/press up/press up/open vent with screwdriver/w".
test robot with "test air/w/s/w/take panel/e/s/n/w/u/jump on robot/pour gel on robot/e/s/w/open present/e/n/w/put golden key in keyhole".
test 100 with "test robot/press 100/e/s/smash diamonds with hammer/w/nw/put gem in claw/x panel/press black button/ne/s".
test endgame with "test 100/e/u/n/climb cage/throw cable at flyer/give water to europa".