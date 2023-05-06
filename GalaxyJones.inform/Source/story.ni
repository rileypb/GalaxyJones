"Galaxy Jones" by Phil Riley

Include Basic Screen Effects by Emily Short.
Include Deluxe Doors by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Skeleton Keys by Emily Short.

Include Epistemology by Eric Eve. 
Include Conversation Framework by Eric Eve.

Include Galaxy Banner by Philip Riley.
Include Third Person Narration by Philip Riley.       
Include Pseudocontainers by Philip Riley.
Include Look That Way by Philip Riley.   
Include Open Spaces by Philip Riley.
Include Visible Rooms by Philip Riley.

The story title is "Galaxy Jones".
The story author is "Phil Riley".
The story headline is "An Interactive Rescue Mission".
The story genre is "Science Fiction".
The release number is 6.
The story creation year is 2023.

Release along with a website.
Release along with an interpreter.
Release along with cover art.
 
Volume 1 - Technical Stuff
			
Use MAX_STATIC_DATA of 240000.

DEBUG is a truth state that varies. DEBUG is initially false.
 
To continue: 
	if DEBUG is false:
		say "[bracket]continue[close bracket]"; 
		say paragraph break; 
		wait for any key;
		
When play begins:
	now the left hand status line is "[location-title-case]";
	now the right hand status line is "[score] of [maximum score] points";

To start header style: 
	(- VM_Style(HEADER_VMSTY); -)
	
To say header style:
	start header style;
	
Before printing the banner text:
	if accessible is on:
		say "Galaxy Jones![line break]";
	otherwise:
		print the galaxy banner;	
		say line break;
		
Before looking for the first time:
	say "[line break]A sleek dark red speeder roars into the dock of the Viking Building. A tall woman in a battle-ready jumpsuit and carrying a disruptor pistol climbs out of it: [header style]Galaxy Jones.[roman type][line break]";

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
	if accessible is off:
		print the galaxy banner;
	increase score by n;
	follow the notify score changes rule;
	
maximum score is 10.

The parser nothing error internal rule response (B) is "I'm not sure what you're referring to.".

To lb:
	say line break;
	
accessible is an object. accessible can be on or off. It is off.

The unlocking before opening rule is not listed in any rulebook.

Understand "room" as a room.

the can't drop what's already dropped rule does nothing.

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

The requested actions require persuasion rule response (A) is "[The noun] [refuse] to cooperate with Jones."
To refuse is a verb.

the block attacking rule response (A) is "Jones only uses violent means when absolutely necessary."

The block sleeping rule response (A) is "There's no lying down on the job for Galaxy Jones!"

The right second rule response (A) is "[We] [are] unable to unlock [the noun] with [the second noun]." 

The block throwing at rule response (A) is "That's unlikely to accomplish anything.".

The can't enter what's already entered rule response (A) is "But Jones is already on [the noun].".

Book 3 - Some default actions

Check informing Beck about something:	
	say "Don't worry, Galaxy Jones will tell Beck what he needs to know." instead;

Check telling Beck about something:
	say "Don't worry, Galaxy Jones will tell Beck what he needs to know." instead;
	
Check informing Europa about something when the cage is broken:
	say "She's too out of it to respond." instead;
	
Check telling Europa about something when the cage is broken:
	say "She's too out of it to respond." instead;
 
Check informing someone about something:
	now current interlocutor is beck;
	say "It's doubtful [regarding the noun][they] [are] interested." instead;

Check telling someone about something:
	now current interlocutor is beck; 
	say "It's doubtful [regarding the noun][they] [are] interested." instead;

Check imploring:
	now current interlocutor is beck;
	say "[We] is more than capable of acquiring things by herself." instead;

Check requesting for:
	now current interlocutor is beck;
	say "[We] is more than capable of acquiring things by herself." instead;
	
Check asking someone that is not beck about something:
	now current interlocutor is beck;
	say "[regarding the noun][They're] not likely to be helpful." instead;
	
Check asking Europa about something when the cage is broken:
	say "She's too out of it to respond." instead;
	
Check quizzing someone that is not beck about something:
	now current interlocutor is beck;
	say "[regarding the noun][They're] not likely to be helpful." instead;
	
Check quizzing Europa about something when the cage is broken:
	say "She's too out of it to respond." instead;
	
Check saying hello to someone when the noun is not beck and the noun is not europa and the noun is not the cat:
	now current interlocutor is beck;
	say "[regarding the noun][They're] not likely to be helpful." instead;
	
Check saying hello to Europa when the cage is intact:
	now current interlocutor is beck;
	say "She's too out of it to respond." instead;	
	
Check searching a door:
	say "Jones will have to go through the door to see what's inside." instead;
	
A thing can be examined. 
Before examining something:
	now the noun is examined;
	
Instead of showing something to Beck:
	try quizzing Beck about the noun;
	
Instead of showing something to Europa:
	say "She doesn't seem to notice.";
	
Instead of showing bottled water to Europa:
	try giving the bottled water to Europa;
	
Instead of throwing something at a guard robot when Lobby Shootout has not ended and comment on energy absorption is unused:
	silently try dropping the noun;
	if the player does not carry the noun:
		say "Jones throws [the noun] at the robot. It just bounces off harmlessly.";
	
Instead of throwing something at a guard robot when Lobby Shootout has ended or comment on energy absorption is used:
	say "The thing is invulnerable to disruptor fire! Do you really thing throwing that at it is going to hurt it?"
	
	
Book 4 - Does the player mean

Does the player mean doing something to a person: it is very likely;

Does the player mean doing something to beck: it is very unlikely;

Does the player mean unlocking keylessly the drop key: it is very unlikely; 

Does the player mean unlocking the drop key with something: it is very unlikely; 

Does the player mean unlocking the large desk with the drop key: it is unlikely;

Does the player mean unlocking the cybernetica door with the drop key: it is unlikely;

Does the player mean unlocking the martian chemical door with the drop key: it is unlikely;

Does the player mean swiping the player through something: it is very unlikely;

Does the player mean swiping something through the player: it is very unlikely;

Does the player mean swiping the player through: it is very unlikely;

Does the player mean doing something to the player: it is unlikely;

Does the player mean doing something to the drop key when the player is not in the ground-floor-region: It is unlikely;

Does the player mean inserting the drop key into the elevator shaft: It is very unlikely;

Does the player mean inserting the drop key into the drop-key-hole: It is very likely;
Does the player mean inserting the red cardkey into the drop-key-hole: It is very unlikely;
[Does the player mean using the drop-key-hole with: It is very unlikely;
Does the player mean using the noun with the noun: It is very unlikely;
Does the player mean using the drop key with the drop-key-hole: It is very likely;
Does the player mean using the drop key with the drop key: It is very unlikely;
Does the player mean using something with the drop key: it is very unlikely;
Does the player mean using the drop key with the ground floor elevator door: it is very likely;]
	
Book 5 - Some extra actions
	
yelling is an action applying to nothing. Understand "yell", "scream" as yelling.
Check yelling:
	say "Admiral Thallium certainly already knows Jones is here." instead;
	
Understand "[number]" as typing it on when the location is ground-floor-6.

Rule for supplying a missing second noun when the location is ground-floor-6:
	now the second noun is the keypad;
	
Book 6 - Styling Text

Table of User Styles (continued)
style name	color	italic	indentation
special-style-1	"#0000FF"	false	0
special-style-2	"#0000FF"	true	0

Colored text is a truth state that varies. Colored text is initially true.

To say style1:
	if colored text is true:
		say special-style-1;
	otherwise:
		say bold type;

To say style2:
	if colored text is true:
		say special-style-2;
	otherwise:
		say italic type;
		
coloring off is an action out of world. Understand "color off" as coloring off.
Carry out coloring off:
	now colored text is false;
	say "Colored text turned off.";
		
coloring on is an action out of world. Understand "color on" as coloring on.
Carry out coloring on:
	now colored text is true;
	say "Colored text turned on.";


Book 7 - Post-look text queueing

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

Understand the command "hook" as "tie".

[Recalling it about is an action applying to two visible things. Understand "ask [someone] about [any interesting invisible thing]" as recalling it about.
Implicit-recalling is an action applying to one visible thing. Understand "ask about [any interesting invisible thing]" or "a [any interesting invisible thing]" as implicit-recalling.

Instead of implicit-recalling something:
	try quizzing beck about the noun;
	
Instead of recalling beck about something:
	try quizzing beck about the second noun;]
	
Frotzing is an action applying to one thing. Understand "frotz [something]" as frotzing.

Check frotzing scenery:
	say "Although you complete the spell, nothing seems to have happened." instead;

Check frotzing something fixed in place:
	say "Although you complete the spell, nothing seems to have happened." instead;
	
Carry out frotzing something:
	now the noun is lit;

Report frotzing the player:
	say "Jones is bathed in a sickly yellow light, bright enough to read by.";

To begin is a verb. To fade is a verb.

Report frotzing something when the noun is not the player:
	say "There is an almost blinding flash of light as [the noun] [begin] to glow! [They] slowly [fade] to a less painful level, but [the noun] [are] now quite usable as a light source.";

Book 1 - Counting moves

Move Count is a number that varies. 
Max Move Count is always 6.

Before doing something other than going:
	now move count is 0;

After going when the location is not in tenth-floor-region:
	increment move count;
	if move count is max move count:
		converse "Beck: '[one of]Boooring.[run paragraph on][or]Yawn.[run paragraph on][or]Where you going, Jones?[run paragraph on][or]Doo dee doo dee doo[or]Slow down, Jones, I'm trying to look at the scenery.[run paragraph on][at random]'
		
		Jones: '[one of]Shut up.[run paragraph on][or]I can't take you anywhere.[run paragraph on][or]One more time and I'll turn off the audio.[run paragraph on][or]Settle down or I'll turn this speeder around.[run paragraph on][at random]'";
		now move count is 0;
	continue the action;

Volume 3 - The Player Character
	
Player's surname is "Jones". 
Player's titled name is "Galaxy Jones".
Understand "Galaxy/Jones/woman" as yourself.

[The player-actual is a thing in the room of stuff. It is privately-named. It is proper-named. The printed name is "you, the player". Understand "me/myself" as the player-actual. The description is "You, the player, issue the commands to make Galaxy Jones go."]

[After deciding the scope of the player:
	place the player-actual in scope; ]
	
The black jumpsuit is worn by yourself. Understand "suit" as the black jumpsuit. The description is "It's an advanced Smart Suit, able to communicate sound, vision, and radar back to Beck at Galaxy Base. Also it has a neat light."

The suit light is part of the black jumpsuit. The description is "It automatically goes on when it gets dark. Cool."

Instead of taking off the black jumpsuit:
	say "Jones needs the jumpsuit to complete her mission.";
	 
After doing something to yourself:
	set pronouns from yourself;
	continue the action;

The description of the player is "Galaxy Jones stands at the ready.".

Figure of Jones is the file "Cover_Scaled.png". 

Instead of examining yourself:
	if accessible is on:
		say "Galaxy Jones looks ready to kick ass, dressed in a black bodysuit and carrying a disruptor pistol.";
	otherwise:
		display Figure of Jones;

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

Book 1 - People

Beck is a man in the room of stuff. The description is "Beck isn't exactly handsome, but he exudes a confidence that makes him memorable." He is familiar and seen.

Europa Callisto is a woman. The description is "Europa Callisto is a stunningly beautiful woman with long ice-blue hair and piercing blue eyes. Right now she's looking pretty ragged, though." She is familiar and seen.

Admiral-Thallium is a man. He is privately-named. The printed name is "Admiral Thallium". Understand "Admiral/Thallium" as Admiral-Thallium. He is familiar. He is seen. The description is "The 'Admiral' is a disctinctly ridiculous figure. He dresses in a mockery of a Martian admiral's uniform, plastered with medals. His hair is slicked back and his mustache is painstakingly waxed."

Instead of doing something to admiral-thallium when the action requires a touchable noun:
	say "Jones would rather not touch Thallium.";
	
Instead of throwing something at admiral-thallium:
	say "Jones would rather not sully [the noun].";

Book 2 - Conversation

An object has a text called the conversation.
An object can be used or unused. An object is usually unused.

Conversed this turn is a truth state that varies.

To converse (T - a text):
	now Conversed this turn is true;
	say "[style1][T][roman type][line break]";
	
This is the reset conversed this turn rule:
	Now conversed this turn is false;
	
The reset conversed this turn rule is listed first in the turn sequence rules.

To converse as thallium (T - a text):
	now Conversed this turn is true;
	say "[style1][T][roman type][line break]";

report looking:
	if the conversation of the location is not empty and the location is unused:
		converse the conversation of the location;
		now the location is used;
		
report examining something:
	if the conversation of the noun is not empty and the noun is unused:
		converse the conversation of the noun;
		now the noun is used;
		
A clip is a kind of object. A clip can be conversational or descriptive or taunting. A clip is usually conversational.

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
		now clip this turn is true;
	
Volume 5 - Plot

Intro is a truth state that varies. Intro is initially true.

Rule for constructing the status line while Intro is true:
	do nothing;

When play begins:
	if DEBUG is false:
		say "Would you like to play with accessibility on? (recommended for mobile) > ";
		if the player consents:
			now accessible is on;
		lb;
		if accessible is off:
			say "If the dashes below fit all on one line, your screen is wide enough. Otherwise, make it wider!";
			say "[fixed letter spacing]-----------------------------------------------------------------[variable letter spacing][paragraph break]";
		lb;
		say "Would you like to turn off [special-style-1]colored text[roman type]? [no line break]";
		if the player consents:
			now colored text is false;
		lb;
		say "You may turn color on and off at any time using COLOR ON and COLOR OFF.";
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
	now current interlocutor is beck;
	continue;

Book 1 - Lobby Shootout

Lobby Shootout is a scene. Lobby Shootout begins when the player is in the lobby for two turns.
Lobby Shootout ends when the location of the guard-robots is not the lobby and attack begun is true.

pinned down is a clip with conversation "[line break]Jones: 'I[']m pinned down here!'".
Check going during lobby shootout:
	say "Trying to reach an exit would surely get [us] shot.";
	print pinned down instead;

Attack begun is a truth state that varies.	

At the time when the attack begins:
	now attack begun is true;
	Move the guard-robots to the lobby;
	now guard-robots are seen;
	now guard-robots are familiar;
	say "Suddenly two robot guards, green and red, emerge from niches in the back wall! [We] [dive] behind the front desk and [draw] [our] disruptor pistol.[paragraph break]";
	converse "Jones shouts, 'I'm under fire from two ugly robot things!'
	
	Beck responds, 'Monitoring your suit radar.'";	
	
When Lobby Shootout begins:
	the attack begins in zero turns from now;
	
Instead of doing something when attack begun is false during lobby shootout:
	do nothing;
	
Instead of doing something to something when attack begun is false during lobby shootout:
	do nothing;
	
After looking when attack begun is true during Lobby Shootout:
	say "[one of]Two guard robots, red and green, criss-cross the lobby, stalking [us][or]Two guard robots prowl the lobby, trying to outflank [us][or]The guard robots have their head cannons trained on the front desk[at random].";
	
Clip this turn is a truth state that varies.
Every turn:	
	now clip this turn is false;
	
Flanking warning is a clip with conversation "Beck: 'Robot on your right!'[line break]".
Fight clip 6 is a clip with conversation "Jones: 'I could use some ideas here!'".
Fight clip 7 is a clip with conversation "Beck: 'How's it going in there?'

'Jones: 'You know -- like all art, it's hit or miss.'".

Every turn when attack begun is true during lobby shootout:
	let roll be a random number between 1 and 10;
	let spoken be false;
	if roll is 1:
		say "One of the robots fires directly above [our] head.";
		now spoken is true;
	if roll is 2:
		say "The robots intone 'Destroy Jones' in an eerie drone.";
		now spoken is true;	
	if roll is 3:
		print flanking warning;
		say "One robot tries to flank [us], but a shot from [our] disruptor sends it scurrying back.";	
		now spoken is true;
	if roll is 4:
		say "Zip! Disruptor fire scorches a nearby couch.";
		now spoken is true;
	if roll is 5:
		say "A robot fires a blistering shot into the front desk.";
		now spoken is true;
	if roll is 6:
		say "The two robots coordinate fire over the desk, narrowly missing [us]."; 
		now spoken is true;
	if clip this turn is false:
		let roll2 be a random number between 1 and 7;
		if roll2 is 6:				
			if spoken is true and fight clip 6 is unused:
				say line break;
			print fight clip 6;
		if roll2 is 7:
			if spoken is true and fight clip 7 is unused:
				say line break;
			print fight clip 7;
	 
After quizzing Beck about sculpture when attack begun is true during Lobby Shootout:
	say line break;
	converse "Beck: 'It's huge. Imagine if it fell on you.'";
	
After pleading when attack begun is true and comment on energy absorption is unused during Lobby Shootout:
	say line break; 
	converse "Beck: 'I dunno, maybe shoot the robots?'";
	
After pleading when comment on energy absorption is used during Lobby Shootout:
	say line break;	
	if plead Lobby Shootout is:
		-- 1: converse "Beck: 'Well, if your energy weapon won't hurt them, maybe direct physical force will?'";
		-- 2: converse "Beck: 'It would have to be something large. Throwing your shoe at them isn't going to cut it.'";
		-- otherwise: converse "Beck: 'That sculpture up there seems pretty big.'";
	

Instead of shooting something with the disruptor pistol when the noun is not a guard robot and the noun is not the sculpture during Lobby Shootout:
	say "Focus on the robots instead.";

Book 2 - Cybernetica Battle		

Cybernetica Battle is a scene. Cybernetica Battle begins when the player is in the Cybernetica office.

When Cybernetica Battle begins:
	move the purple guard robot to the Cybernetica office;
	now the purple guard robot is seen;
	now the purple guard robot is familiar;
	say "As soon as [we] steps into the office, a shot zaps just past [our] nose. [We] dives to the ground, protected by the maze of desks and chairs. Peeking through the mesh back of one of the chairs, [we] takes notice of both the purple guard robot training its disruptor on the room, and the chair's fine construction and lumbar support.";
	converse "[line break]Jones (whispering): 'We've got another one! I'm out of sight for now, but it's going to be hard to get a shot off at this [']bot.' 
	 
	Beck: 'What's the situation?'
	
	Jones: 'I[']m on the floor with desks and chairs all around. The target is a few yards off, coming this way. I can get a shot in, but it might just absorb it anyway.'
	
	Beck: 'Well, see if you can sneak up on it. Maybe close up you can find a way past its defenses.'";	

Sneaking up on is an action applying to one visible thing. Understand "sneak up on [something]", "sneak toward/towards [something]", "crawl toward/towards [something]", "move toward/towards [something]", "creep up on [something]", "creep toward/towards [something]", "follow [something]", "get closer to [something]", "move closer to [something]" as sneaking up on.

sneak index is a number that varies. The sneak index is initially 3.

check sneaking up on something when the noun is not the purple guard robot:
	say "There's no sneaking up on that right now." instead;
	
carry out sneaking up on the purple guard robot:
	decrement the sneak index;
	
Check exiting during Cybernetica Battle:
	say "[We] starts to stand, and a shot zips by, way too close. [We] hits the deck." instead;
	
Check going during Cybernetica Battle:
	say "Trying to reach an exit would surely get [us] shot." instead;
	
After doing something other than sneaking up on the guard robot during Cybernetica Battle:
	if sneak index < 3 and the purple guard robot is in the Cybernetica office:
		increment sneak index;
		say "The guard robot moves a little farther away from [us].";
	continue the action;
		
Shoot out the window is a descriptive clip with conversation "[We] must have poked up [our] shoulder or something, for the guard robot fires his disruptor. The shot takes out a window on the east side of the room. The electrostatic field around the building keeps the atmosphere from pouring out."
	
report sneaking up on the purple guard robot:
	if sneak index is 2:
		say "[We] creeps a little ways toward the guard robot.";
	otherwise if sneak index is 1:
		say "Slowly, slowly, [we] gets a little closer. Just a little more...";
		say line break;
		print shoot out the window;
		now bwindow is in Cybernetica office;
		now the Cybernetica office is window-broken;	
	otherwise:
		say "[We] is right up next to the robot, crouched beneath a desk. She can see right up under its armor.";
		
A thing can be navigable.
		
After examining the bwindow:
	change east exit of Cybernetica office to ledge;
	change west exit of ledge to Cybernetica office;
	change outside exit of Cybernetica office to ledge;
	change inside exit of ledge to Cybernetica office;
	now bwindow is navigable;
		
useless shooting is a clip with conversation "Beck: 'Are you still shooting at those things? Even if you hit [']em it's not going to leave a scratch.'

Jones (whispering): 'So what do you propose?'

Beck: 'Get closer. Keep your head down, but move in closer to it until you can get a good shot in.'";

carry out shooting purple guard robot with the disruptor pistol during Cybernetica Battle:
	if sneak index > 0:
		say "[We] raises [our] head and fires wide. The robot fires back. Jones ducks and crawls off among the labyrinth of desks.[paragraph break]";
		print useless shooting;
	otherwise:
		say "[We] aims the pistol upward under the robot's enhanced armor and fires. [We] flinches back when the robot's innards explode downward in a shower of sparks. It topples over, dead. Jones stands up and surveys her handiwork.";
		remove the purple guard robot from play;
		move the destroyed purple robot to the Cybernetica office;
	
Cybernetica Battle ends when purple guard robot is not in the Cybernetica office.

When Cybernetica Battle ends:
	score 1;	
	say line break;
	converse "Jones: 'Better than a video game.	'
	
	Beck: 'Nice, but don[']t forget to credit your handler.'
	
	Jones: 'Yes, yes, thanks for helping me not get killed.'   
	
	Beck: 'You're welcome.'";

Check dropping something when the location is the ledge:	
	say "Bad idea." instead;
	
dithering is an action applying to nothing. 
Understand "stand up", "get up", "stand" as dithering when the location is the cybernetica office.
Instead of dithering when cybernetica battle has ended:
	say "Jones is already standing up.";

Instead of dithering during cybernetica battle:
	say "That would be suicide.";

Instead of shooting something with the disruptor pistol when the noun is not the purple robot during Cybernetica Battle:
	say "Focus on the robot instead.";


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
	
Check wearing the atmo-suit when the atmo-suit is unneeded:
	say "[We] needs to be able to move around quickly. Better not wear the [Atmo-Suit]." instead;
		
The drop key is a thing. "Hanging from a hook here is [a drop key]." The description is "A drop key is a special device used to open an elevator door from the outside."  Understand "dropkey" as the drop key.

A thing can be an enemy.

A guard robot is a kind of enemy person. It is neuter. The description is "Definitely not a friendly android. More of a spiny killer with a disruptor barrel mounted on its head.". Understand "guard/barrel/killer/head" as a guard robot.
There is a guard robot called the guard-robots. It is privately-named. It is scenery. The printed name is "red and green guard robots". Understand "guard/guards/robot/robots/green/red/and" as the guard-robots. 
There is a guard robot called the purple guard robot. It is scenery.
There is a thing called the dead mauve robot. Understand "remains/guard" as the dead mauve robot. "The remains of the mauve guard robot are sprawled on the ground." The description is "From the outside there's no sign of what killed the mauve guard robot." It is fixed in place.
There is a thing called the destroyed purple robot. "The remains of the purple guard robot are sprawled on the ground." The description is "The tattered guts of the purple guard robot spill out from its armored carapace." It is fixed in place. Understand "remains/guts/guard/carapace/armor" as the destroyed purple robot.

Check taking a guard robot:
	say "An interesting idea." instead;

Instead of attacking an enemy thing:
	say "You'll need to specify how [we] should attack [the noun]. For instance, you might say 'shoot [the noun] with [the disruptor pistol]'." 
	
A couch is a kind of enterable supporter. It is usually scenery. Understand "furniture/seating/seat" as a couch.

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

A cardkey is a kind of thing. Understand "card/key/keycard" as a cardkey.

Swiping it through is an action applying to one carried thing and one thing. 
Understand "swipe [something] through/in [something]" as swiping it through.

Check swiping when the noun is not a cardkey:
	say "That can't be swiped." instead;
	
Carry out swiping:
	try unlocking the second noun with the noun;
	
Definition: a white board is blank if the writing of it is empty.

A white board is a kind of thing. A white board has a text called the writing. The description is "[if not blank]The board says '[writing]'[otherwise]The board is blank[end if]. A black marker with an eraser at the end is tied to the board.".

A black marker is a kind of thing.
Every white board incorporates a black marker.

An eraser is a kind of thing.
Every black marker incorporates an eraser.

Writing is an action applying to one topic. Understand "write [text]" as writing.

Writing contentlessly is an action applying to nothing. Understand "write", "write on board" as writing contentlessly.

Check writing when no white board is in the location:
	say "There's nothing to write on here." instead;

Carry out writing:
	let newtext be the topic understood;
	let board be a random white board in the location;
	if board is blank: 
		now the writing of board is newtext;
	otherwise:
		now the writing of board is "[writing of board] [newtext]";
	
Report writing:
	let board be a random white board in the location;
	say "Now the board says '[writing of board]'.";

Check writing contentlessly when no white board is in the location:
	say "There's nothing to write on here." instead;

Check writing contentlessly:
	say "You must say what you want Jones to write." instead;
	
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

the lobby is north of the entry doorway. The lobby is inside from the entry doorway.

Instead of entering building entryway:
	try going north;

the ground floor elevator hall is north of the lobby.

the ground floor elevator door is a door. It is west of the ground floor elevator hall. The printed name is "elevator door". Through the ground floor elevator door is the ground floor elevator shaft. The ground floor elevator door is closed and unopenable. Understand "elevator/lift/door/gold" as the ground floor elevator door.

the ground floor elevator door-inside is a door. It is east of the ground floor elevator shaft. It is scenery. The printed name is "elevator door". Through the ground floor elevator door-inside is the ground floor elevator hall. The ground floor elevator door-inside is a half-door of the ground floor elevator door. Understand "elevator/lift/door" as the ground floor elevator door-inside. "The backside of the elevator door."

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

the elevator-room-door is a door. It is privately-named. It is scenery. The printed name is "utility door". Understand "elevator/lift/room/door/utility" as elevator-room-door. It is east of ground-floor-2. Through the elevator-room-door is the elevator room.
the elevator-room-door is closed, locked, lockable and openable. The red cardkey unlocks the elevator-room-door.
The description of the elevator-room-door is "It's a white metal door, completely typical. It has a swipe card lock right above the handle.".

the elevator-room-door-inside is a door. It is privately-named. It is scenery. The printed name is "elevator room door". Understand "elevator/lift/room/door" as elevator-room-door-inside. It is west of the elevator room. The elevator-room-door-inside is a half-door of the elevator-room-door. Through the elevator-room-door-inside is ground-floor-2.
The description is "It's a white metal door, completely typical. It has a card swipe right above the handle.".

ground-floor-3 is north of ground-floor-2. It is a ground-floor. The dir is northwest. The preposition is "at".

ground-floor-4 is east of ground-floor-3 and north of the elevator hall. It is a ground-floor. The dir is north. The preposition is "on".

ground-floor-5 is east of ground-floor-4. It is a ground-floor. The dir is northeast. The preposition is "at".

ground-floor-6 is south of ground-floor-5. It is a ground-floor. The dir is east. The preposition is "on".

the closet door is a door. it is west of ground-floor-6. Through the closet door is the maintenance closet. 

the closet-door-inside is a door. It is privately-named. It is scenery. The printed name is "closet door". Understand "closet/door" as the closet-door-inside. It is east of the maintenance closet. Through the closet-door-inside is ground-floor-6. The closet-door-inside is a half-door of the closet door. The description is "A typical white utility door."

ground-floor-7 is south of ground-floor-6 and east of the lobby. It is a ground-floor. The dir is southeast. The preposition is "at".

the ground floor stairwell is east of the elevator hall. the ground floor stairwell is above the elevator hall.

Book 2 - Lower Elevator Shaft

the ninth floor elevator shaft is above the ground floor elevator shaft.

Book 3 - The Ninth Floor

The ninth-floor is a region. It contains the ninth floor stairwell, the ninth floor north hallway, the ninth floor south hallway, the north end of the building management office, the south end of the building management office, the Cybernetica office, and the Martian Chemical office.

The ninth floor elevator door is a door. It is scenery. It is east of the ninth floor elevator shaft and west of the ninth floor elevator hall. The description is "A golden sliding door, opening in the middle." It is open.

The ninth floor stairwell is east of the ninth floor elevator hall.
The ninth floor stairwell is above the ninth floor elevator hall.
The ninth floor stairwell is below the ninth floor elevator hall.

The ninth floor north hallway is north of the ninth floor elevator hall.

The ninth floor south hallway is south of the ninth floor elevator hall.

The Cybernetica door is a door. It is east of the ninth floor north hallway. It is scenery. Through the Cybernetica door is the Cybernetica office. The cybernetica door is closed, openable, locked, and lockable. The description is "A slick corporate office door lettered 'Cybernetica'. It has a swipe lock above the handle." Understand "office" as the cybernetica door.
The Cybernetica door-inside is a door. It is west of the Cybernetica office. It is privately-named. The printed name is "Cybernetica door". It is scenery. Through the Cybernetica door-inside is the ninth floor north hallway. The Cybernetica door-inside is a half-door of the Cybernetica door. 
 
The cybernetica-room-swipe-lock is scenery in ninth floor north hallway. It is privately-named. The printed name is "swipe lock". Understand "swipe/lock" as cybernetica-room-swipe-lock. "An ordinary swipe lock." 

Instead of inserting something into cybernetica-room-swipe-lock:
	try unlocking the cybernetica door with the noun;

[Instead of using something with cybernetica-room-swipe-lock:
	try unlocking the cybernetica door with the noun;]
	
Instead of swiping something through the cybernetica-room-swipe-lock:
	try unlocking the cybernetica door with the noun; 

The Martian Chemical door is a door. It is scenery. It is east of the ninth floor south hallway and west of the Martian Chemical office. The Martian Chemical door is closed, openable, locked, and lockable. "A slick corporate office door with the fancy company logo of Martian Chemical. It has a swipe lock above the handle." Understand "office" as Martian Chemical door. 
 
The Martian-room-swipe-lock is scenery in ninth floor south hallway. It is privately-named. The printed name is "swipe lock". Understand "swipe/lock" as Martian-room-swipe-lock. "An ordinary swipe lock." 

Instead of inserting something into Martian-room-swipe-lock:
	try unlocking the Martian chemical door with the noun;

[Instead of using something with Martian-room-swipe-lock:
	try unlocking the Martian chemical door with the noun;]
	
Instead of swiping something through the Martian-room-swipe-lock:
	try unlocking the Martian chemical door with the noun; 

The martian chemical logo is part of the Martian Chemical door. The description is "The figure of a beaker holding a red liquid against the backdrop of the planet Mars."

The north-mgmt-doorway is scenery in ninth floor north hallway. It is privately-named. The printed name is "doorway". "An office can be seen past the doorway." Understand "doorway" as north-mgmt-doorway.

The south-mgmt-doorway is scenery in ninth floor south hallway. It is privately-named. The printed name is "doorway". "An office can be seen past the doorway." Understand "doorway" as south-mgmt-doorway.

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

The elevator car-room is west of the tenth floor elevator hall. It is open space. It is privately-named. The printed name is "elevator car".  It is in the tenth-floor-region. Understand "elevator/lift/car" as the elevator car-room.

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
The tenth floor stairwell is above the tenth floor elevator hall.
The tenth floor stairwell is below the tenth floor elevator hall.


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
the roof stairs is above 100th floor elevator hall.

The roof access door is a closed, locked, lockable, openable scenery door. It is above the roof stairs and below the penthouse roof. The description of the roof access door is "Looking strangely out of place, it is a common grey metal door with a push bar."

The preposition of the roof stairs is "on".

The preposition of the penthouse roof is "on".

Book 6 - The Roof

the flyer pad is west of the penthouse roof. The preposition is "on".

a cage is north of the penthouse roof. The preposition is "next to". 

the cage is northeast of the flyer pad.

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

Understand "city/reykjavik/planet/mars/outside/out/glass/streets/wall/walls/window/windows/dusty/red" or "glass wall" or "glass walls" or "new reykjavik" as first floor view of New Reykjavik.

Ninth floor view of New Reykjavik is a backdrop. It is privately-named. It is in south end of the building management office, north end of the building management office, ninth floor south hallway, ninth floor north hallway, Martian Chemical office, Cybernetica office.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking Building stands near the periphery, overlooking the vast red plain of Utopia Planitia."
	
Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain/window/windows" as ninth floor view of New Reykjavik.

Perilous view of New Reykjavik is a backdrop. It is privately-named. It is in ledge, window washing scaffold.

The printed name is "the city".

The description is "From this perilous location, outside the comforting electrostatic field trapping the atmosphere of the building, one can see with striking clarity the lights of the city. The surrounding plains go on forever."

Understand "city/planet/mars/out/outside" as perilous view of New Reykjavik.

Tenth floor view of New Reykjavik is a backdrop. It is privately-named. It is in microthings-1, microthings-2, microthings-3, microthings-4, microthings-5, microthings-7, microthings-8.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking building stands near the periphery, overlooking the vast red plain of Utopia Planitia."

Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain/window/windows" as tenth floor view of New Reykjavik.

100th floor view of New Reykjavik is a backdrop. It is privately-named. It is in penthouse north, penthouse east, penthouse south, penthouse roof, cage, and flyer pad.

The printed name is "outside".

The description is "Looking down at New Reykjavik, one can trace the history of the city, as it expanded radially from its original domes, the multiple frontiers colliding and interfering like ripples in a pond, until eventually, the map gave way to rectangular regularity. The Viking Building stands near the periphery, overlooking the vast red plain of Utopia Planitia."

Understand "city/planet/mars/outside/out/new/reykjavik/utopia/planitia/red/plain/window/windows" as (100th floor view of New Reykjavik).

Book 2 - Ground Floor

Chapter 1 -  Speeder Dock

The description of the speeder dock is "A safe harbor from the periodic dust storms of Utopia Planitia, the dock features several dozen speeder bays. Only a few are filled right now. The building entryway is to the north, under a red stone façade carved into the likeness of a fearsome Viking.".

The conversation of the speeder dock is "[reset LPR][Our] handler Beck comes over [our] headset. 'Alright, what's going on?'

[We] replies, 'I[']m in the speeder dock. No movement. What can I expect inside?'

'Blueprints show the ground floor is one big empty space with elevators in the center. Not a lot of places for resistance to hide, but you can never tell. Be careful.

'And one other thing, Jones: if you need help you can [bold type]ASK BECK FOR HELP[style1]. You can also [bold type]ASK BECK ABOUT[style1] things or [bold type]ASK BECK ABOUT GAME[style1] for more information about the game. Finally, you can cause help to repeat from the beginning by saying [bold type]ASK BECK TO RESET HELP[style1]'".

The speeder-vehicle is a fixed in place thing in the speeder dock. It is privately-named. The printed name is "speeder". Understand "bay/speeder/vehicle/car/landspeeder/galaxy/one/dust/runner" as speeder-vehicle. "[Our] speeder, Galaxy One, sits in one of the parking bays.".
The description is "Galaxy One is a Dust Runner, a top-of-the-line model from Olympus Speedworks. It's deep crimson with tinted windows. Powerful turbines adorn vestigial wings that sweep back in severe rearward arcs.".

Check taking the speeder-vehicle:
	say "Stop being silly." instead;

Some tinted speeder windows are part of the speeder-vehicle. The description is "The tint is too dark to see through." Understand "window" as tinted speeder windows.

Some turbines are part of the speeder-vehicle. The description is "The engines cause [us] to recoil from the waves of heat rolling off of them." Understand "engines/thrusters/turbine/engine/thruster" as turbines.
 
Some wings are part of the speeder-vehicle. The description is "Not technically necessary as the speeder works via anti-gravity, the blade-like wings nonetheless give the vehicle a certain flair unobtainable by other means.". Understand "arcs/arc/wing" as wings.

Some parking bays are scenery in the speeder dock. Understand "spots/spot/places/place" as parking bays. "Most of the parking bays are unfilled."

Instead of entering the speeder-vehicle:
	say "[We] has a job to do here.";

The building entryway is a backdrop. It is in the speeder dock, entry doorway, and lobby. "[If the location is the lobby]The entryway (exit actually) leads out to the speeder dock.[otherwise]The entryway is dominated by the towering façade of a Viking king, namesake of the building itself.". Understand "entry/entrance/entranceway/facade/façade/viking/glass/steel" as building entryway. Understand "exit" as building entryway when the location is the lobby.

Some speeders are scenery in the speeder dock. "None of these are half as cool as Galaxy One."
	
Chapter 2 - Building Entryway

The description of the entry doorway is "A glass revolving door leads into a large open space north of here. The speeder dock is to the south.".

The conversation of the entry doorway is "Jones looks up at the 100 stories of glass and steel. 'What do you want to bet Thallium's got Europa all the way at the top?'

Beck: 'Oh, no doubt.'";

The open-space is scenery in the entry doorway. It is privately-named. The printed name is "open space". Understand "open space" as open-space. "On the far side of the glass walls is a large open space serving as the extended lobby of the building."

The description of the entry door is "A glass revolving door emblazoned with the symbol of a Viking king astride the planet Mars." Understand "revolving/symbol/doorway" as entry door.

Before going from entry doorway to lobby for the first time:
	converse "Jones takes a deep breath. 'I[']m going in.'
	
	Beck replies, 'You got this, Galaxy.'".
	
Check climbing the building:
	say "Even if that were feasible, Jones is afraid of heights." instead;

Instead of examining up when the location is the entry doorway:
	say "Beyond the glass ceiling, the building looms 100 stories tall.";

Chapter 3 - Lobby

The ground-floor-region is a region. It contains lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.

The ground-floor-floor is a backdrop. It is privately-named. The printed name is "floor". Understand "floor/marble" as the ground-floor-floor. It is in ground-floor-region.
The description of the ground-floor-floor is "Yards and yards of white and grey marble, rare for Mars."

The ground-floor-ceiling is a backdrop. It is privately-named. The printed name is "ceiling". Understand "ceiling" as the ground-floor-ceiling. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description of the ground-floor-ceiling is "The whole ground floor is bright and airy, its ceiling covered with reflective pyramids. Supporting struts criss-cross the area, from which sparkling crystal chandeliers are suspended."

The ground-floor-chandeliers are a backdrop. They are privately-named. The printed name is "chandeliers". Understand "chandelier/chandeliers" as the ground-floor-chandeliers. The description is "A baroque conglomeration of gold, silver, and crystal."

The ground-floor-chandeliers are in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.

The description of the lobby is "[first time]The ground floor of the Viking Building is breathtaking. Low-G architecture means more glass and thinner supports, and the building takes advantage of that. Four walls of glass surround a central pillar in which are set the utility rooms and elevators. In between is an expanse of plants, water features, and stylish seating. [only]Near the entryway is a front desk[if the giant sculpture is in the lobby]. A giant crystal sculpture floats above the center of the area, suspended on almost invisible cables[end if]. [We] may go east and west from here, north to the elevators, or south out of the building[if lobby shootout is happening or lobby shootout has happened]. There are two niches in the central wall from which the guard robots emerged[end if].".

The lobby-background is scenery in the lobby. It is privately-named. Understand "plants/water/features/feature/stylish" as the lobby-background. "The ground floor is huge and made for holding people comfortably. Thus the hundreds of seats amidst Earth pleasures such as water and living green plants." The printed name is "lobby"

The supports are a backdrop in the lobby. "Thin but incredibly strong." They are in ground-floor-region. Understand "support/strut/struts" as supports.

The pyramids are a backdrop in the lobby. "Angled reflective surfaces on the ceiling meant to disperse light." They are in ground-floor-region. Understand "pyramid" as pyramids.

The elevators-scenery is a backdrop in the lobby. It is privately-named. The printed name is "elevators". Understand "elevator/lift/lifts/elevators" as the elevators-scenery. "They're in the center of the building." It is in ground-floor-region.

The utility-rooms-scenery is a backdrop in the lobby. It is privately-named. The printed name is "utility rooms". Understand "utility/room/rooms" as the utility-rooms-scenery. "The utility rooms are somewhere around the central pillar." It is in ground-floor-region.

The niches are scenery in the lobby. "Aside from a robot charging station, there's nothing here." Understand "niche" as niches.

Some charging stations are scenery in the lobby. "The charging station is a socket fitted in a depression contoured to fit one of those robots." Understand "station/socket/sockets" as charging stations.

Instead of inserting something into the charging stations:
	say "Jones doesn't play with electrical sockets!";

The front desk is scenery in the lobby. It is a pseudocontainer. The contents description is "There's not much on the desk other than a sticky note that says '[doorcode]'.". "There is nothing of interest on the front desk." 
The sticky note is in the front desk. The description is "The note says '[doorcode]'.".

Instead of opening the front desk:
	say "[We] opens a few drawers, all of which contain paper, pens, and other things of little interest.";
	
The giant sculpture is scenery in the lobby. Understand "art/artwork/Rambutan/glass/crystal/abstraction/cables/cable/installation" as the giant sculpture. "It's a huge crystal abstraction, provocative in its arrogance but evocative of nothing. A typical public installation by the artist Rambutan. It's held up by metal cables."

comment on energy absorption is a clip with conversation "[line break]Jones: 'Target seems to be absorbing disruptor fire. This will make things a little harder.'

Beck: 'Got it.'".
	
Report shooting a guard robot with the disruptor pistol during Lobby Shootout:
	say "[one of]Oops! [we] [miss].[or][We] [stick] [our] head out from behind the desk and squeezes off a shot at [the noun]. In her haste it goes wide of the target.[or]A barrage of fire from the robots prevents [us] from firing.[or]Oof. Big miss.[or][Our] shot hits a robot dead on, but nothing happens, almost as if the robot had absorbed the energy.[print comment on energy absorption][or]A perfect shot! Yet, somehow, the robot is unscathed.[print comment on energy absorption][or][Our] shot goes wide, reflecting off one of the building struts and into the suspended sculpture. The artwork begins to spin wildly, straining its cables.[at random]";
	
Check shooting something with the disruptor pistol:
	if the noun is not a guard robot and the noun is not the giant sculpture:
		say "[text of the block attacking rule response (A)][line break]" instead;
	 
The tangled ruin is a fixed in place pseudocontainer. "Spread across the floor in a tangled ruin are the remains of a giant crystal sculpture and two guard robots." Understand "remains/sculpture/art/glass/crystal/guards/guard/robots/robot/red/green/ruins/ruin" as the tangled ruin. 
The description is "[We] searches some more, but nothing further turns up."
The contents description is "[We] digs through the ruins and finds a cable with hooks at either end, which [we] takes."
The tangled ruin is auto-take.
The hook cable is in the tangled ruin.
	
battle won is a clip with conversation "Beck: 'What was that crash? What[']s going on?'

Jones: 'That, my friend, was what you'd call a work of art. Targets terminated.'";

Lobby Shootout Aftermath is a scene. Lobby Shootout Aftermath begins when Lobby Shootout ends. Lobby Shootout Aftermath ends when player is in ground-floor-1 or player is in ground-floor-7 or player is in ground floor elevator hall.

When Lobby Shootout Aftermath Ends:
	converse as thallium "Admiral Thallium's voice booms from the ceiling. 'Little Galaxy thinks she's beaten the big bad Admiral. Sorry dear, that was only a taste.'".

Carry out shooting the giant sculpture with the disruptor pistol:
	say "[We] [fire] the disruptor into the sculpture's main support cable, snapping it. The huge crystal blob starts to sag, straining the other cables. In quick succession they break as well, and the whole installation plummets to the ground, right on top of the hapless guard robots.";
	score 1;
	say line break;
	remove the guard-robots from play;
	remove the giant sculpture from play;
	move the tangled ruin to the lobby;
	print battle won;
	

Instead of doing something other than shooting when (the action requires a touchable noun and the noun is not the player) or (the action requires a touchable second noun and the second noun is not the player) during Lobby Shootout:
	say "As soon as [we] [start] to act, an energy beam zips past [our] head, forcing [us] back down behind the desk.";
	
Instead of dropping the disruptor pistol:
	say "That would be ill-advised.";
	
Instead of inserting the disruptor pistol into something:
	say "That would be ill-advised.";
	
Instead of putting the disruptor pistol on something:
	say "That would be ill-advised.";
	
Instead of giving the disruptor pistol to someone:
	say "That would be ill-advised.";
	
Instead of eating the disruptor pistol:
	say "That would be ill-advised.";
	
The tasteful couch is a couch in the lobby. "Quite tasteful for a homicidal madman, really."

The ground floor central pillar is a backdrop. It is privately-named. The printed name is "central pillar". Understand "central/pillar" as ground floor central pillar. It is in lobby,
	ground-floor-1, ground-floor-2, ground-floor-3, ground-floor-4, ground-floor-5, ground-floor-6, ground-floor-7.
The description is "The central area where the elevators and utility rooms are."
	
Chapter 4 - Ground Floor

The room-floor of the lobby is the ground-floor-floor.
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
The room-ceiling of the ground-floor-7 is the ground-floor-ceiling.

Section 1 - ground-floor-1

The description of ground-floor-1 is "A lush indoor waterfall here contrasts with the dusty red streets of New Reykjavik beyond the glass walls. The ground floor extends north and east."

The waterfall is a scenery pseudocontainer in ground-floor-1. "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again." The contents description is "The waterfall descends the length of an artificial rock formation fringed by wide-leaved Earth plants and ferns. The water collects in a basin at the bottom, where it begins its journey again. A single coin sits on the bottom of the basin." 

Instead of inserting something into the waterfall:
	say "Why pollute this little oasis in Thallium's den of iniquity?";

The conversation of the waterfall is "Jones: 'One coin? Not very generous people around here.'";

Understand "water/basin" as waterfall.

The wide-leaved Earth plants are part of the waterfall. The description of the wide-leaved Earth plants is "Imported plants are a must on Mars, to relieve the stress of living on a lifeless world.". Understand "ferns" as the wide-leaved Earth plants.

The coin is in the waterfall. The description is "A one-Areo coin, with Ares on the front and the Viking 2 lander on the back.". Understand "money/cash" as the coin.

Instead of drinking the waterfall:
	say "Jones decides the water probably isn't clean enough to drink."
	
Does the player mean drinking the waterfall:
	it is very likely;

Section 2 - ground-floor-2

The description of ground-floor-2 is "Semicircular couches open on either side of a central carpeted path leading north and south. Set in the central pillar of the building to the east is a utility door with a swipe lock. The city looms beyond the glass wall to the west."

The semicircular couch is a couch in ground-floor-2. The description is "An inoffensive beige couch, shaped in a half-circle.". Understand "couches" as the semicircular couch.


The central carpeted path is scenery in ground-floor-2. The description is "A strip of grey carpet running north to south, in the midst of the marble floor. (Incidentally, the massive expense of moving real marble from Earth to Mars is just further proof of Thallium's madness, seriously.)". Understand "carpet/rug" as the central carpeted path.
 
The elevator-room-swipe-lock is scenery in ground-floor-2. It is privately-named. The printed name is "swipe lock". Understand "swipe/lock" as elevator-room-swipe-lock. "An ordinary swipe lock." 

Instead of inserting something into elevator-room-swipe-lock:
	try unlocking the elevator-room-door with the noun;

[Instead of using something with elevator-room-swipe-lock:
	try unlocking the elevator-room-door with the noun;]
	
Instead of swiping something through the elevator-room-swipe-lock:
	try unlocking the elevator-room-door with the noun;

Section 3 - ground-floor-3

The description of ground-floor-3 is "A large relief map of Mars is mounted on the north wall here. One can leave here to the south or east.".

The large relief map of Mars is scenery in ground-floor-3. "The map is crafted of bronze and sports a star at the site of New Reykjavik." Understand "bronze" as the large relief map of Mars.

The star is a part of the large relief map. The description is "Ah, New Reykjavik! Even colder than Old Reykjavik!".

Section 4 - ground-floor-4

The description of ground-floor-4 is "The area is dominated by a towering statue of Admiral Thallium against the north wall. The ground floor extends west and east from here. The elevator is to the south."

The statue of admiral thallium is scenery in ground-floor-4. The description is "His nauseating visage seems to leer at [us], and [we] suppresses a shiver of disgust.".

The conversation of the statue of admiral thallium is "Jones groans. 'Be glad you're not here, Beck. This is revolting.'

Beck chuckles. 'I won't ask.'".

The elevators-scenery-2 is scenery in the lobby. It is privately-named. The printed name is "elevators". Understand "elevator/lift/lifts/elevators" as the elevators-scenery. "They're in the center of the building, south of here."

Section 5 - ground-floor-5

The description of ground-floor-5 is "The area is dedicated to celebrating the military career of Admiral Thallium. Uniforms, medals, ribbons, and other miscellanea are mounted on the wall or in showcases. All this despite the fact that no one has turned up any evidence that Thallium served in any navy of any country on any planet. One can escape to the west or south.".

The conversation of ground-floor-5 is "Jones: 'Now this is some choice bullshit here.'

Beck: 'Looks like the record of the good Admiral's long and dedicated service.'".

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

After examining the catering table for the first time:
	converse "Jones: 'What would you like me to bring you, Beck? Shrimp tea sandwiches, or poached ostrich eggs?'
	
	Beck: 'Oh, the shrimp. Definitely get the shrimp.'";

Check eating the catering table:
	say "There are so many things on the table. [We] might want to look at them and decide what [we] wants." instead;
	
Check taking the catering table:
	say "There are so many things on the table. [We] might want to look at them and decide what [we] wants." instead;

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

Instead of entering the Viking 2 lander:
	say "It wasn't a manned craft.";

Chapter 5 - Maintenance Closet

The description of the maintenance closet is "A bare, white-walled room containing various maintenance items. The exit is to the east."

Instead of exiting when the location is the maintenance closet:
	try going east;

Instead of going out when the location is the maintenance closet:
	try going east;

The maintenance items are scenery in the maintenance closet. "Various uninteresting items, like mops and brooms and the like." Understand "mops/mop/brooms/broom" as the maintenance items.

The closet door is closed, lockable, openable, and locked. It is scenery. "A typical white metal utility door. Next to it is a keypad with the digits 0-9[if the closet door is locked]. An indicator light glows red[otherwise]. An indicator light glows green[end if]."
A keypad is a part of the closet door. The description is "An ordinary numerical keypad."

Check opening the closet door when the closet door is locked:
	say "[We] will have to enter the correct code on the keypad first." instead;
	
Instead of typing doorcode on the keypad:
	say "An indicator light by the door to the west glows green.";
	now the closet door is unlocked;
	say line break;
	print opened maintenance closet;
	
Instead of typing a number on the keypad:
	say "An indicator light by the door to the west blinks red.";	
	now the closet door is locked;
	if closet door has not been unlocked:
		converse "[line break]Jones: 'it[']s not [number understood]...'";
	
Instead of typing a number on the keypad for the second time:
	say "An indicator light by the door to the west blinks red.";	
	now the closet door is locked;
	if closet door has not been unlocked:
		converse "[line break]Jones: 'it[']s not [number understood]...'";
		converse "[line break]Beck: 'I don[']t think you[']ll get it just typing random numbers.'";
	
Instead of typing a number on the keypad for the fourth time:
	say "An indicator light by the door to the west blinks red.";	
	now the closet door is locked;
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

The elevator-shaft is scenery. It is privately-named. The printed name is "elevator shaft". Understand "elevator/lift/shaft" as the elevator-shaft. The description is "A dark hole beyond the elevator doors."

[Does the player mean using drop key with the ground floor elevator door:
	it is very likely;]
	
does the player mean opening the drop key: It is very unlikely;
	
Does the player mean doing something to the elevator-shaft:
	it is very unlikely;

Instead of entering the elevator-shaft when the ground floor elevator door is closed:
	say "[We] will need to open the elevator door first.";
	
Instead of entering the elevator-shaft when the ground floor elevator door is open:
	try going west;
	
Does the player mean doing something to the ground floor elevator hall: 
	It is unlikely;
	
Understand "climb into [something]" as entering.

The description of the ground floor elevator door is "A gleaming gold elevator door. There is a hole near the top for inserting a drop key.". The ground floor elevator door has matching key the drop key. It is scenery.

The drop-key-hole is a part of the ground floor elevator door. It is privately-named. The printed name is "small hole". Understand "small/hole" as the drop-key-hole. The description is "It's a small hole about half an inch in diameter."
	
Instead of unlocking the ground floor elevator door with the drop key when the ground floor elevator door is closed:
	safely open the elevator door;
	say "[We] inserts [the drop key] into [the drop-key-hole] and turns it, disengaging the lock mechanism. Then [we] slides the door open, exposing an empty elevator shaft to the west.";
	now the elevator-shaft is in the ground floor elevator hall.
	
Instead of unlocking the ground floor elevator door with the drop key when the ground floor elevator door is open:
	say "The [ground floor elevator door] is already open.";
	
Instead of unlocking keylessly the ground floor elevator door when the player carries the drop key:
	try unlocking the ground floor elevator door with the drop key;
	
Instead of inserting the drop key into the drop-key-hole:
	try unlocking the ground floor elevator door with the drop key;
	
Instead of inserting the drop key into the elevator door:
	try unlocking the ground floor elevator door with the drop key;

[Instead of using the drop key when location is the ground floor elevator hall:
	try unlocking the ground floor elevator door with the drop key;
	
Instead of using the drop key with the ground floor elevator door:
	try unlocking the ground floor elevator door with the drop key;
	
Does the player mean using the drop key with the drop key:
	it is very unlikely;
	
Instead of using the drop key with the drop-key-hole:
	try unlocking the ground floor elevator door with the drop key;]
	
Instead of closing the ground floor elevator door:
	say "Might as well leave it open in case Jones needs to get out.";
	


Chapter 7 - Elevator Room

The description of the elevator room is "This is a utility room related to the operation of the elevator, on the other side of the east wall here. There is a control panel on the wall, and a door leading west."

Instead of exiting when the location is the elevator room:
	try going west;
	
Instead of going outside when the location is the elevator room:
	try going west;

The elevator control panel is scenery in the elevator room. "From the looks of it, elevator technology hasn't evolved much since it was first developed. This control panel is a primitive collection of wires, circuit boards, indicator lights, and other components. It also seems to be completely inactive -- none of the lights are on." Understand "wires/circuit/board/boards/indicator/lights/light/component/components/controls" as the elevator control panel.

Instead of doing something other than examining to the elevator control panel:
	say "Playing with the controls for a dangerous piece of equipment she doesn't understand is not something Jones would do.";

The drop key is in the elevator room. 

The hammer is in the elevator room. "Lying discarded on a table here is a hammer." The description is "An ordinary claw hammer."

Chapter 8 - Ground Floor Stairwell

The description of the ground floor stairwell is "this is a secret message."

don't take the stairs is a clip with conversation "[line break]Jones: 'In case of fire, don't use the stairs.'"

stairwell trouble is a clip with conversation "[line break]Jones: 'I've got gunfire from somewhere up the stairs. I'll have to get above them and take them out from behind.'

Beck: 'Sounds like a plan.'"

Instead of going to ground floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
	print stairwell trouble;
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
ninth floor elevator shaft is in elevator shaft-region. "The door to the east is [if ninth floor elevator door is open]open[otherwise]closed[end if].".

The conversation of the ninth floor elevator shaft is "Beck: 'Huh. Seems like it should have taken longer than that.'"

Instead of examining up when the location is in elevator shaft-region:
	try examining the elevator car-backdrop;
	
Instead of examining down when the location is in elevator shaft-region and the location is not the ground floor elevator shaft:
	say "[We] [are] afraid of heights.";
	
Instead of examining down when the location is the ledge:
	say "There's a window cleaner's scaffold about six feet below [us]. Beyond that is a precipitous drop to the streets of New Reykjavik.";

The description of the ground floor elevator shaft is "[We] is at the bottom of a dark well. Shining [our] suit light up, [we] can see that the elevator car is several floors up, unmoving. There is a ladder running up the wall next to the door."

The conversation of the ground floor elevator shaft is "Beck: 'Ooh. It's like we're in an action film.'".

A ladder is a backdrop. It is in ground floor elevator shaft, second floor elevator shaft, third floor elevator shaft, fourth floor elevator shaft, fifth floor elevator shaft, sixth floor elevator shaft, seventh floor elevator shaft, eighth floor elevator shaft, ninth floor elevator shaft. The description is "A simple steel ladder."

The elevator car-backdrop is a backdrop. It is privately-named. The printed name is "elevator car". Understand "elevator/car" as the elevator car-backdrop. It is in ground floor elevator shaft, second floor elevator shaft, third floor elevator shaft, fourth floor elevator shaft, fifth floor elevator shaft, sixth floor elevator shaft, seventh floor elevator shaft, eighth floor elevator shaft, ninth floor elevator shaft, and elevator top. The description is "this is a secret message".

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
		try examining down;

Instead of climbing the ladder when the location is the ground floor elevator shaft:
	try going up;

[Instead of using the ladder when the location is the ground floor elevator shaft:
	try going up;]

Instead of climbing the ladder when the location is the ninth floor elevator shaft:
	try going down;

[Instead of using the ladder when the location is the ninth floor elevator shaft:
	try going down;]
	
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

The ninth-floor-stairwell is scenery in the ninth floor elevator hall. The printed name is "stairwell". Understand "stairwell/stairs" as the ninth-floor-stairwell. The description is "They lead up and down from here."

Instead of going to ninth floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
	print don't take the stairs;
	try looking;
	
The vending machine is scenery in the ninth floor elevator hall. The vending machine is a transparent, closed container. The bottled water is in the vending machine. "It's a Olympus Springs bottled water machine."

Instead of examining the vending machine:
	say "It's an Olympus Springs bottled water machine, well-stocked.";

This is the can't reach inside the vending machine rule:
	if the container in question is the vending machine:
		say "[We] will have to buy it first.";
		deny access;

The can't reach inside the vending machine rule is listed before the can't reach inside closed containers rule in the reaching inside rules.

Instead of inserting the coin into the vending machine:
	try buying the bottled water with the coin;
	
Instead of buying the bottled water with the coin:
	now the player carries the bottled water;
	remove the coin from play;
	say "[We] inserts the coin in the machine and takes the bottle that appears a few seconds later.";
	
Instead of buying the bottled water with something:
	say "[The second noun] is not negotiable currency.";
	
After deciding the scope of the player when the location is the ninth floor elevator hall and the bottled water is in the vending machine:
	place the bottled water in scope;
	
rule for reaching inside the vending machine while buying the bottled water with something:
	allow access;
	
The description of the Ninth Floor North Hallway is "This anonymous corporate hallway ends here at the north end of the building. An open doorway leads west. To the east is a door with a swipe lock, labeled 'Cybernetica Inc.'";
	
The description of the Ninth Floor South Hallway is "This anonymous corporate hallway ends here at the south end of the building. An open doorway leads west. To the east is a door with a swipe lock, labeled 'Martian Chemical.'";

Chapter 1 - Cybernetica office

The description of the Cybernetica office is "It[']s spacious and luxurious, designed to make developers forget how spent they are from months of overwork and abuse. Ergonomic desks and chairs fill space like a furniture fractal, before giving way to an open area, presumably for group activities[if Cybernetica office is window-broken]. One of the windows along the east side of the office is broken[end if][if purple guard robot is somewhere]. There is a menacing purple guard robot here, looking for Jones[end if].".

The description of the Cybernetica door-inside is "This side intentionally left blank.".
	
The Cybernetica office can be window-broken.

Before going from a room (called R1) to an atmo-thin room (called R2) when R1 is not atmo-thin and the Atmo-Suit is not touchable:
	say "The atmosphere is too thin out there. [We] needs protective gear." instead;

Before going from Cybernetica office to ledge when the Atmo-Suit is touchable and cybernetica battle is not happening for the first time:
	converse "Jones: 'I'm going out the window to see if I can find a way to get up to the tenth floor.'
	
	Beck: 'Whoa whoa whoa, Jones. You know you're not good with heights.'
	
	Jones: 'Ask Thallium how how much that matters once I've kicked his ass. Watch me, I'll look down and not even flinch.'";

The cybernetica-desks are scenery in the Cybernetica office. They are privately-named. The printed name is "desks". Understand "desk/desks/chair/chairs/furniture" as the cybernetica-desks. "Very nice and good for hiding under and among."

bwindow is scenery. It is privately-named. The printed name is "broken window". Understand "broken/window/east/eastern" as bwindow. "Looks like [we] could get through if [we're] careful. There's a ledge outside."

Does the player mean examining the bwindow: it is very likely;

Instead of doing something to the purple guard robot when the action requires a touchable noun:
	say "Fine way for Jones to get herself killed.";
	
The open area is scenery in the Cybernetica office. "A rectangular region free of desks in the middle of the office."
	
Chapter 2 - Outside

The description of the ledge is "The ledge runs north and south. Jones is plastered up against the wall, trying not to look down[if the floor of the window washing scaffold is 10]. The scaffold is right above [our] head[end if][if the window washing scaffold is discovered and the floor of the window washing scaffold is 8]. The scaffold is right below [us][end if].".

[The metal cables are scenery in the ledge. Understand "cable" as the metal cables. "It looks very tense. It runs up and down."]

flying is an action applying to nothing. Understand "fly" as flying.

Check flying:
	say "Not even Galaxy Jones.";
	
The ledge-wall is a backdrop. It is in the ledge and the window washing scaffold. It is privately-named. The printed name is "wall". Understand "wall" as the ledge-wall. "Right now, it's [our] only friend."

check climbing the ledge-wall:
	say "Wall-climbing is not among Galaxy Jones's many talents." instead;
	
Instead of examining down when the location is the ledge for the first time:
	say "Are you sure? Jones is really afraid of heights.";
	
Instead of examining down when the location is the ledge for the second time:
	say "Okay, fine. [We] looks down, slowly, slowly... and there's a window cleaner's scaffold, about six feet below [us].[paragraph break]";
	change down exit of the ledge to window washing scaffold;
	converse "Jones: 'Okay, so. There's a window washing platform right below me. I might be able to drop down to it, but I won't be able to get back up.'
	
	Beck: 'Take it easy, Jones.'";
	move the scaffold-scenery to the ledge;
	now the window washing scaffold is discovered;
	
Instead of jumping on the scaffold-scenery when the location is the ledge: 
	if the floor of the window washing scaffold is 10:
		say "Jones can't make that jump.";
	otherwise:
		try going down;

The scaffold-scenery is scenery. It is privately-named. The printed name is "scaffold". Understand "scaffold/window/washing/platform" as the scaffold-scenery. "It certainly looks more inviting than this ledge."
	
Instead of going down from ledge when the floor of the window washing scaffold is not 8:
	say "That would be a long fall.";
	
The window washing scaffold can be discovered.
	
Instead of jumping when the location is the ledge and the window washing scaffold is discovered:
	try going down;
	
Instead of entering the scaffold-scenery:
	if the floor of the window washing scaffold is 8:
		try going down;
	otherwise:
		say "Jones can't reach the scaffold from here.";
	
Instead of jumping when the location is the ledge:
	say "On a [italic type]ledge?[roman type] Are you crazy?";
	
The description of the window washing scaffold is "lalala".

The window washing scaffold has a number called the floor. The floor is usually 8.

I hate it out here is a clip with conversation "[line break]Jones: 'Beck?'

Beck: 'Yes?'

Jones: 'I hate it out here.'

Beck: 'Well, there's the open window right next to you.'";

explaining the vent is a clip with conversation "Jones: 'Alright, I'm by the tenth floor now. What's this grille thing here?' 

Beck: 'That's an exhaust vent. There's an air handling room on this floor which it leads into. If you can remove the cover you should be able to access the whole floor from here.'"

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
		
window-thing is a backdrop. It is in the window washing scaffold and the ledge. It is privately-named. The printed name is "windows". Understand "window/windows" as the window-thing. 

Instead of examining the window-thing:
	If the location is the ledge or the floor of the window washing scaffold is 9:
		say "The window here is broken, allowing Jones to reenter the building.";
	otherwise if the floor of the window washing scaffold is 8:
		say "It's dark inside, preventing Jones from seeing what's in there.";
	otherwise:
		say "You're up against an exhaust vent. There are no windows here.";

Does the player mean opening the window washing scaffold: it is very unlikely;
		
fakeroom10 is west of window washing scaffold and inside from window washing scaffold.
fakeroom11 is east of air handling room and outside of air handling room. It is atmo-thin. "This room is really fake."
The description of fakeroom10 is "this room is fake.".

[Every turn:
	if the location is window washing scaffold and the floor of the window washing scaffold is 9:
		now fakeroom10 is apparent;
	otherwise if the location is window washing scaffold and the floor of the window washing scaffold is 10 and the exhaust vent is open:
		now fakeroom10 is apparent;
	otherwise:
		now fakeroom10 is not apparent;]

Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is open:
	try entering the exhaust vent;
	if the location is the air handling room:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;

Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is closed:
	say "[We] will need to remove the vent cover first.";

Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is closed:
	say "[We] will need to remove the vent cover first.";
		
Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 9:
	move player to the Cybernetica office;
	if the location is the Cybernetica office:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;
		
Instead of going west from the ledge:
	move player to the Cybernetica office;
	if the location is the Cybernetica office:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;
		
Instead of going inside from the ledge:
	move player to the Cybernetica office;
	if the location is the Cybernetica office:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;
		
Instead of going west from the window washing scaffold when the floor of the window washing scaffold is 8:
	say "None of the windows here are open.";
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is open:
	try entering the exhaust vent;
	if the location is the air handling room:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is open:
	say "[We] will need to remove the vent cover first.";
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 9:
	move player to the Cybernetica office;
	if the location is the cybernetica office:
		now the atmo-suit is unneeded;
		if the player wears the atmo-suit:
			try taking off the atmo-suit;
		
Instead of going inside from the window washing scaffold when the floor of the window washing scaffold is 8:
	say "None of the windows here are open.";
	
Instead of going east from the Cybernetica office during Cybernetica battle:
	say "You'll never get out without being shot.";
	
Instead of going outside from the Cybernetica office during Cybernetica battle:
	say "You'll never get out without being shot.";
	
Instead of going east from the Cybernetica office when the floor of the window washing scaffold is 9 and Cybernetica battle is not happening:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the window washing scaffold;
	
Instead of going east from the Cybernetica office when the floor of the window washing scaffold is not 9 and Cybernetica battle is not happening:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the ledge;
	
Instead of going outside from the Cybernetica office when the floor of the window washing scaffold is 9 and the purple guard robot is nowhere:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the window washing scaffold;
	
Instead of going outside from the Cybernetica office when the floor of the window washing scaffold is not 9 and the purple guard robot is nowhere:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the ledge;

Instead of going east from the air handling room when the floor of the window washing scaffold is 10:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the window washing scaffold;

Instead of going inside from the air handling room when the floor of the window washing scaffold is 10:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
	move the player to the window washing scaffold;

Instead of going outside from the air handling room when the floor of the window washing scaffold is 10:
	now the atmo-suit is needed;
	if the atmo-suit is touchable:
		try wearing the atmo-suit;
	if the player is not wearing the atmo-suit:
		now the atmo-suit is unneeded;
		say "[We] needs an Atmo-Suit to go outside." instead;
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
		say "The scaffold is as far up as it will go." instead;
		
Carry out pushing the scaffold up button:
	increment the floor of the window washing scaffold;
	set exits from scaffold;

Report pushing the scaffold up button:
	say "[We] presses the button, and the scaffold begins to rise.";
	try looking;
	stop the action;

Check pushing the scaffold down button:
	if the floor of the window washing scaffold is 8:
		say "The scaffold is as far down as it will go." instead;
		
Carry out pushing the scaffold down button:
	decrement the floor of the window washing scaffold;
	set exits from scaffold;

Report pushing the scaffold down button:
	say "[We] presses the button, and the scaffold begins to descend.";
	try looking;
	stop the action;

The exhaust vent is a scenery container. It is closed and openable. "[if closed]It's a hinged white metal grille held in place by two large screws[otherwise]The vent is open; Jones can climb into the building here[end if].". Understand "screws/screw/grill/grille/cover" as the exhaust vent.
The screws are part of the exhaust vent. The description is "Plain screws painted with white enamel."

Instead of unscrewing the exhaust vent with the screwdriver:
	if the exhaust vent is closed:
		now the exhaust vent is open;
		say "[We] loosens the screws with the screwdriver and opens the grille.";
	otherwise:
		say "The vent is already open.";
	
Instead of closing the exhaust vent:
	say "After [we] went to so much trouble to open it?";

Instead of opening the exhaust vent when the player does not carry the screwdriver:
	say "Jones will need to remove the screws first."

Instead of opening the exhaust vent when the player carries the screwdriver:
	try unscrewing the exhaust vent with the screwdriver;
	
Instead of unlocking the exhaust vent with the screwdriver:
	try unscrewing the exhaust vent with the screwdriver;
	
understand "remove [exhaust vent] with [screwdriver]" or "take off [exhaust vent] with [screwdriver]" as unscrewing it with;
	
Instead of entering the exhaust vent when the exhaust vent is open for the first time:
	say "[We] climbs inside the vent, crawls along a short length of ductwork, and emerges through another hinged grille, into the air handling room.";
	score 1;
	now the player is in the air handling room;	
	try taking off the atmo-suit;
	converse "Jones: 'Ha! I'm in!'
	
	Beck: 'Be careful, you[']re likely to run into more resistance here. The floor is all one open office, so any guard robots will have good line of sight.'
	
	Jones: 'Got it.'
	
	Beck: 'And Jones? Save your game.'";
	
Instead of entering the exhaust vent when the exhaust vent is open:
	say "[We] climbs inside the vent, crawls along a short length of ductwork, and emerges through another hinged grille, into the air handling room.";
	now the player is in the air handling room;
	try taking off the atmo-suit;
	
Instead of going nowhere from the window washing scaffold when the floor of the window washing scaffold is 10 and the exhaust vent is open:
	if the noun is west:
		try entering the exhaust vent;
		try taking off the atmo-suit;
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

The large desk is in the north end of the building management office. It is scenery. It is a container. It is closed, openable, locked, and lockable. "It's a pretty utilitarian desk of some plastic material. It has a single drawer with a keyed lock.". Understand "drawer/lock" as the large desk.

Instead of unlocking the large desk with the safety pin when the large desk is locked:
	say "[We] pushes the pin into the keyhole and wiggles it around. After a few seconds of this the desk drawer pops open[if desk contains something]. It contains [a list of objects contained in the large desk][end if].";
	now the large desk is unlocked;     
	now the large desk is open;
	score 1;
	lb;
	converse "Beck: 'Galaxy Jones, master thief!'";
	
The north-desks are scenery in the north end of the building management office. They are privately-named. The printed name is "desks". Understand "desks" as north-desks. "There are lots of them, none of which are particularly interesting."

The north-task-boards are scenery in the north end of the building management office. They are a white board. They are privately-named. The printed name is "task board". Understand "task/tasks/board/boards" as north-task-boards. The writing is "[italic type]1. Describe scenery objects on Engineering Deck[line break]
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

[Check unlocking a locked lockable thing with the safety pin when the noun is not keyed:
	say "The lock doesn't take a regular key." instead;]

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
	
Check picking the large desk with something that is not the safety pin:
	say "That doesn't fit into the lock";

The black cardkey is in the large desk. The black cardkey unlocks the Cybernetica door. The black cardkey unlocks the Martian Chemical door. Understand "card/key" as the black cardkey. The black cardkey is a cardkey. The description is "Black like evil, or like secrets?"

A filing cabinet is a container in the south end of the building management office. It is scenery. It is closed and openable. "An ordinary filing cabinet, with five drawers. The label on the front says 'Personnel Records'." Understand "file/files/drawer/drawers" as the filing cabinet.

Check opening the filing cabinet:
	say "[We] has better things to do than look through reams of personnel records." instead.

The description of the south end of the building management office is "The building management office is a bunch of desks and task boards. There is a filing cabinet against the east wall. The office exit is to the east, and the office continues to the north." 
	
The south-desks are scenery in the south end of the building management office. They are privately-named. The printed name is "desks". Understand "desk/desks" as south-desks. "There are lots of them, none of which are particularly interesting."

The south-task-boards are scenery in the south end of the building management office. They are privately-named. They are a white board. The printed name is "task board". Understand "task/tasks/board/boards" as south-task-boards. The writing is "Jones is coming, surprise day off!".	
A screwdriver is in the south end of the building management office. "A screwdriver sits atop the filing cabinet." The description is "A standard Phillips screwdriver with a red plastic handle."
Understand "tool" as a screwdriver.

The black cat is an animal. The description is "It's really a beautiful cat, sleek and black.". It is undescribed.

The screwdriver can be behind the filing cabinet.

Instead of taking the screwdriver when the screwdriver is not handled and the screwdriver is not behind the filing cabinet and the shrimp tea sandwich is somewhere:
	move the black cat to the south end of the building management office;
	now the screwdriver is behind the filing cabinet;
	now the screwdriver is handled;
	now the screwdriver is undescribed;
	if noplead screwdriver < 1:
		setplead screwdriver to 1;
	say "[We] reaches for the screwdriver, but [we] fumbles it and it rolls off the back of the filing cabinet.[paragraph break]";
	converse "Jones: 'Damn.'
	
	Beck: 'What? What's going on?'
	
	Jones: 'Just being clumsy is all.'";
	
The black cat can be angry.

Instead of doing something to the cat when the action requires a touchable noun:
	say "No way. That thing is mean.";



Instead of looking behind the filing cabinet when the screwdriver is behind the filing cabinet:
	say "(taking the screwdriver)[command clarification break]";
	try taking the screwdriver;	

Instead of looking behind the filing cabinet when the screwdriver is not behind the filing cabinet and the black cat is not angry:
	say "[We] moves to look behind the filing cabinet, and in doing so, brushes the screwdriver off the back of the filing cabinet.[paragraph break]";
	move the black cat to the south end of the building management office;
	now the screwdriver is behind the filing cabinet;
	if noplead screwdriver < 1:
		setplead screwdriver to 1;
	converse "Jones: 'Damn.'
	
	Beck: 'What? What's going on?'
	
	Jones: 'Just being clumsy is all.'";

Instead of taking the screwdriver when black cat is in the location and the black cat is not angry:
	say "[We] reaches behind the cabinet to retrieve the screwdriver. A swipe and a hiss make her recoil.[paragraph break]";
	if noplead screwdriver < 3:
		setplead screwdriver to 3;
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
	
Check giving the shrimp tea sandwich to the black cat:
	try dropping the shrimp tea sandwich instead;
	
Instead of showing the shrimp tea sandwich to the black cat:
	now the current interlocutor is Beck;
	try dropping the shrimp tea sandwich;
	
Instead of throwing the shrimp tea sandwich at the black cat:
	try dropping the shrimp tea sandwich;

	
Chapter 4 - Martian Chemical Office

The description of the martian chemical office is "This seems like the business office of the chemical company rather than the lab. Most of the room is taken up by desks and other office stuff. There is a cabinet that looks intriguing, however.".

The chemical cabinet is scenery in the Martian Chemical office. "The cabinet is full of bottles of Electrofil quick-setting conductive polymer gel."

The Electrofil quick-setting conductive polymer gel is in the cabinet. It is undescribed. The description of the Electrofil is "An opaque pink bottle labeled 'Electrofil' in large friendly letters, it apparently hardens into a conductive substance very quickly." Understand "bottle" as the Electrofil quick-setting conductive polymer gel.

Instead of inserting something into the chemical cabinet:
	say "The cabinet is already full of bottles.";

After taking the Electrofil quick-setting conductive polymer gel: 
	now the Electrofil quick-setting conductive polymer gel is not undescribed;
	move the untakable bottle to the chemical cabinet;
	continue the action;
	
Does the player mean taking the untakable bottle: it is very unlikely;

The untakable bottle is a thing. It is undescribed. It is privately-named. Understand "bottle/Electrofil/quick-setting/conductive/polymer/gel" as the untakable bottle. The description is "this is a secret message."

Instead of taking the untakable bottle:
	Say "[We] has already taken one bottle of Electrofil from the cabinet. [We] should use it before taking another.";
	
Rule for clarifying the parser's choice of the Electrofil quick-setting conductive polymer gel when the untakable bottle is touchable:
	do nothing;
	
The chemical-desks are scenery in the Martian Chemical office. They are privately-named. The printed name is "desks". Understand "desk/desks" as the chemical-desks. "Seen one, seen [']em all. Except for the large desk across the hall, of course."

The office stuff is scenery in the Martian Chemical office. "Chairs, filing cabinets, tables... stuff."

Instead of opening the chemical cabinet:
	try examining the chemical cabinet;

Book 5 - Tenth Floor  

The description of the tenth floor stairwell is "this is a secret message."

The description of the air handling room is "There is a good number of loud fans and other air handling machinery here. A small hinged vent opening leads into some ductwork, and from there to the outside. A door leads west.".

The fans are scenery in the air handling room. "They're loud." Understand "machine/machines/machinery/fan" as fans.

Instead of doing something other than examining to the fans:
	say "Those are too dangerous to fiddle with."

The ductwork is scenery in the air handling room. "A short length leading from the fans here to the outside." Understand "duct/work" as ductwork.

Instead of going to tenth floor stairwell:
	say "As soon as [we] enters the stairwell, a disruptor blast from above zings past [our] shoulder, and [we] beats a hasty retreat. [We] won't be going up the stairs until [we] can clear out the resistance, and [we] can't do that from here.";
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

The description of microthings-1 is "This is reception. The front desk has a great view of the New Reykjavik Botanic Dome. Couches are lined up to take advantage. The floor extends east and west, and north to the elevator.".

Reception is scenery in microthings-1. "No one is covering the desk at present." Understand "front/desk" as reception.

The couches-microthings-1 are scenery enterable supporters in microthings-1. They are privately-named. The printed name is "couches". Understand "couch/couches/seat/seats/seating" as the couches-microthings-1. The description is "Tan leather couches, very expensive."

The New Reykjavik Botanic Dome is scenery in microthings-1. "A large geodesic dome made of lightweight and durable materials, designed to withstand the harsh conditions on Mars such as extreme temperatures, radiation, and dust storms. A green glow emanates from the translucent walls."

The description of microthings-2 is "This looks like the IT area of the office. Numerous desks and an abundance of computer parts are here. [We] can go north or east from here.".

[The desks-microthings-2 is scenery in microthings-2. It is privately-named. The printed name is "desks". Understand "desk/desks" as desks-microthings-2. "How dull."]

The computer parts are scenery in microthings-2. "Of no use to [us]."

The description of microthings-3 is "This ocean of desks looks out toward the Utopia Tower, twice the height of the Viking Building, where [we] is now. One can go north or south.".

The desks-microthings-3 is scenery in microthings-3. It is privately-named. The printed name is "desks". Understand "desk/desks" as desks-microthings-3. "More desks. Ho hum."

The Utopia Tower is scenery in microthings-3. "Incredible. A tower that height would never stand on Earth."

The description of microthings-4 is "Various executive offices line the north and west walls here. [We] can go east or south.".

The executive offices are scenery in microthings-4. "It's hard to imagine how anything useful could be in there."

The description of microthings-5 is "This is the company cafeteria. The elevator is south, the air handling room is to the east, and the office continues to the west and southeast.". 

The cafeteria is scenery in microthings-5. "The food looks like it would be delicious, if it weren't hours old and cold."

The food is part of the cafeteria. The description is "It's old and cold."

Instead of eating the food:
	say "It's not at all appetizing." instead;

The description of microthings-7 is "This part of the office is currently unused. [We] can go northwest or south from here.".
The description of microthings-8 is "This corner of the floor contains the gym and other company amenities. Reception is to the west, and an empty area lies to the north.".

The gym is scenery in microthings-8. "Looks well-equipped, but alas [we] doesn't have time to work out."
	
Chapter 1 - The Robot Chase

The mauve guard robot is a guard robot in microthings-2. The mauve guard robot is active.
				
The mauve guard robot has a room called the goal. The goal of the mauve guard robot is microthings-2.
The mauve guard robot has a room called the homebase. The homebase of the mauve guard robot is microthings-2.

Instead of shooting the robot vent with something:
	try shooting the mauve guard robot with the second noun;

Check shooting something with something when the location is in the tenth-floor-region or the location is the top of the elevator car:
	if the noun is not the robot vent and the noun is not the mauve guard robot:
		say "Jones should focus on disabling the robot." instead;

Check attacking something when the location is in the tenth-floor-region or the location is the top of the elevator car:
	if the noun is not the robot vent and the noun is not the mauve guard robot:
		say "Jones should focus on disabling the robot." instead;

Instead of sneaking up on the mauve guard robot:
	say "The room is too open to sneak up effectively." instead;

oldloc is a room that varies.

Report shooting the mauve guard robot with the disruptor pistol:
	say "[one of]The shot goes wide[or]The shot is absorbed by the mauve robot[or]The shot narrowly misses the guard robot[or]The beam strikes a window and reflects at a crazy angle around the room[at random].";
 
Before going somewhere when the player is in tenth-floor-region and the mauve guard robot is somewhere:
	now oldloc is room of stuff;
	if the location of the mauve guard robot farsees the location:
		now oldloc is the location;
	
After going somewhere when the player is in tenth-floor-region and the mauve guard robot is somewhere:
	if oldloc is not the room of stuff and the location of the mauve guard robot farsees oldloc:
		now the goal of the mauve guard robot is the location;
	continue the action;
	
Instead of shooting something with the disruptor pistol when the location of the mauve guard robot farsees the location and the noun is not the mauve guard robot:
	say "Focus on the robot instead.";

Every turn when the mauve guard robot is in the tenth-floor-region and the mauve guard robot is not under attack: 
	if the mauve guard robot is in the location:
		say "[one of]The robot slaughters Jones[or]The guard robot moves in on Jones with its slashing knife arms, slicing her to ribbons[or]Jones doesn't stand a chance against the mauve guard robot's terrible knives[or]The robot electrocutes Jones with its electro-darts[purely at random].";		
		lb;
		end the story saying "Jones was killed by the mauve guard robot";
	otherwise if the goal of the mauve guard robot is not the location of the mauve guard robot:
		let D be the best route from the location of the mauve guard robot to the goal of the mauve guard robot;
		try the mauve guard robot going D;
		if the location of the mauve guard robot is the location:
			say "[one of]The robot slaughters Jones[or]The guard robot moves in on Jones with its slashing knife arms, slicing her to ribbons[or]Jones doesn't stand a chance against the mauve guard robot's terrible knives[or]The robot electrocutes Jones with its electro-darts[purely at random].";	
			lb;
			end the story saying "Jones was killed by the mauve guard robot";
	otherwise:
		now the goal of the mauve guard robot is the homebase of the mauve guard robot;
	if story has not ended and clip this turn is false:
		if the location of the mauve guard robot farsees the location:
			now the goal of the mauve guard robot is the location;
			if conversed this turn is false and a random chance of 1 in 6 succeeds:
				converse "[one of]Beck: 'Come and get us, ugly!'
				
				Jones: '[']Us[']? Seems like I'm the only one with her life on the line.'[or]Beck: 'That's one ugly dude.'
				
				Jones: 'I wouldn't want to meet it up close.'[or]Beck: 'If I only had a heart, indeed.'[or]Beck: 'I don't think I like Thallium's choice of friends much.'[or]Beck: 'You're programmed to kill, but Jones is programmed to kick your metallic ass!'
				
				Jones: 'Ah, the bravery of being out of range.'[or]Beck: 'I hope you have a warranty, because you're about to be seriously damaged!'
				
				Jones: 'Really, Beck? Is this your best material?'[or]Beck: 'I've seen more intimidating kitchen appliances!'[at random]";
				now conversed this turn is true;
				continue the action;
		if the location is in tenth-floor-region and a random chance of 1 in 6 succeeds:
			converse "[one of]Thallium's voice booms over the office PA: 'You can run, Jones, but you can't - well, there aren't very many places you can hide.'[or]Thallium: 'Jones, you still hanging around with that loser Beck?'[or]Thallium: 'Don't you just hate it, Jones -- not knowing when death will just jump out at you?'[or]Thallium: 'I bet you're just [style2]dying[style1] to meet Europa, right, Jones?'[then at random]"


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
	
The golden keyhole is scenery in the elevator car-room. "Inset in the mahogany panel, it looks like real gold and has the shape of an antique 'skeleton' key." Understand "hole" as the golden keyhole.

Check inserting something that is not the golden key into the golden keyhole:
	say "That doesn't fit." instead;

Instead of exiting when the location is the elevator car-room:
	try going east;

The elevator car-room has a number called the floor. The floor of the elevator car-room is 10.
The elevator car-room can be in running mode.

The ceiling panel is in the elevator car-room. "One of the ceiling panels looks loose." The description is "Asbestos? In this day and age?"

it's real ivory is a taunting clip with conversation "Admiral Thallium's voice oozes from concealed speakers: 'Yes, Jones, that is real ivory. I imported the elephant here myself for a hunt on my estate. You have no idea how much money it takes to simulate an African jungle on Mars. In retrospect I should have gotten an Indian elephant.'".

The description of the elevator car-room is "It's luxurious, with gold-plated walls and crystal lighting on the ceiling. The button panel is lacquered dark mahogany with what look like real ivory buttons. The carpeting is soft and plush[If elevator car-room is in running mode]. A golden key rests in a golden keyhole above the buttons. The buttons 1, 9, 10, and 100 are illuminated[otherwise]. A golden keyhole sits above the buttons[end if][if the ceiling panel is nowhere]. There is a hole in the ceiling big enough for Jones to squeeze through[end if]. You can leave the elevator to the east.".

Does the player mean examining the elevator car-room: It is very likely;

The elevator-car-door is scenery in the elevator car-room. It is privately-named. The printed name is "elevator car door". Understand "elevator/lift/car/door" as the elevator-car-door. "The door is open."

Instead of opening the elevator-car-door:
	say text of the can't open what's already open rule response (A);

Instead of closing the elevator-car-door when the elevator is not in running mode:
	say "[We] can't close them by hand, and the elevator seems to be off."

Instead of closing the elevator-car-door when the elevator is in running mode:
	say "You don't need to explicitly open and close the elevator door."

The elevator-walls are scenery in the elevator car-room. They are privately-named. The printed name is "walls". Understand "walls/wall/gold/plated", "gold-plated" as elevator-walls. "Yes, that's real gold-plating."

The crystal lighting is scenery in the elevator car-room. "Nice. Excessive, but nice."

The elevator-control-panel is scenery in the elevator car-room. It is privately-named. The printed name is "elevator control panel". Understand "elevator/lift/control/panel" as the elevator-control-panel. "The button panel is lacquered dark mahogany with what looks like real ivory buttons."

The ivory buttons are scenery in the elevator car-room. "Real ivory. [We] recoils in disgust." Understand "button" as the ivory buttons.

Instead of pushing the elevator-control-panel:
	try pushing the ivory buttons;

The carpeting is scenery in the elevator car-room. "Soft and velvety in a deep red."

button pushing is an action applying to one number. Understand "push [number]" as button pushing. Understand "press [number]" as button pushing.

Check button pushing a number when the location is the elevator car-room and the number understood is not listed in { 1, 9, 10, 100 } or the elevator car-room is not in running mode:
	say "Nothing happens." instead;
	
Check button pushing a number when the location is the elevator car-room and the number understood is greater than 100 or the number understood is less than 1: 
	say "The buttons only run from 1 to 100." instead;
	
Check pushing ivory buttons in the elevator car-room:
	say "You have to specify what button, from 1 to 100." instead;
	
Check button pushing a number when the location is the elevator car-room and the number understood is the floor of the elevator car-room:
	say "[We're] already on that floor." instead;
	
the elevator car-room has a number called the floor. The floor of the elevator car-room is 10.

Check button pushing when the location is not the elevator car-room and the location is not ground-floor-6:
	say "There are no buttons here to push." instead;
	
Check button pushing when the location is ground-floor-6:
	try typing the number understood on the keypad;

whooee is a clip with conversation "[line break]Jones: 'Holy - This thing goes fast.'";

To describe elevator ride from (F - a number) to (T - a number):
	if T is 100:
		say "The elevator accelerates upwards at a frightening rate. The numbers climb towards 100. Soon the elevator slows, and the door opens on the 100th floor.";
		print whooee;
	otherwise if F is 100:
		say "The ride downward is a terrifying plunge, but at least it's over quickly.";
	otherwise:
		say "The elevator quickly arrives at its destination.";
	
Carry out button pushing a number when the location is elevator car-room:
	describe elevator ride from the floor of the elevator car-room to the number understood;
	now the floor of the elevator car-room is the number understood;
	try looking;

Report looking when the location is the elevator car-room:
	print it's real ivory;

Instead of going up from the elevator car-room when the ceiling panel is in the elevator car-room:
	say "Jones can neither climb walls nor fly.";
	say line break;

Instead of taking the ceiling panel:
	remove the ceiling panel from play;	
	say "[We] removes the ceiling panel, exposing a hole wide enough for [us] to squeeze through.";
	
Instead of prying the ceiling panel:
	try taking the ceiling panel;
	
Instead of pushing the ceiling panel:
	try taking the ceiling panel;
	
Instead of pulling the ceiling panel:
	try taking the ceiling panel;

Instead of opening the ceiling panel:   
	try taking the ceiling panel;
	
Understand "remove [the ceiling panel]" as taking;

The golden-key-scenery is scenery. It is privately-named. The printed name is "golden key". Understand "golden/key" as golden-key-scenery.

Instead of inserting the golden key into the golden keyhole:
	remove the golden key from play;
	move the golden-key-scenery to the elevator car-room;
	now the elevator car-room is in running mode;
	say "[We] puts the key in the keyhole and turns. There is a pleasant chime, and some buttons light up.";
	score 1;
	try looking;
	
Instead of taking the golden-key-scenery:
	say "Jones tries to take the key out of the keyhole, but it seems to be stuck there.";
	
Instead of removing the golden-key-scenery from the golden keyhole:
	say "Jones tries to take the key out of the keyhole, but it seems to be stuck there.";

After deciding the scope of the player when the location is top of the elevator car:
	If the mauve guard robot is in the elevator car-room:
		place the mauve guard robot in scope;
		
Rule for reaching inside the elevator car-room when the location is top of the elevator and the mauve guard robot is in the elevator car-room:
	allow access;
	
The description of the top of the elevator car is "[if floor of the elevator car-room < 100]The elevator shaft extends many hundreds of feet above her[otherwise]She is right at the top of the shaft[end if]. She can see down into the elevator car from here[if the mauve guard robot is in the elevator car-room]. The mauve guard robot is in the car, looking around as if confused[end if].";

The upper-shaft is scenery in the top of the elevator car. It is privately-named. The printed name is "elevator shaft". Understand "elevator/lift/shaft/ladder" as the upper-shaft. "[if floor of the elevator car-room is 1]The shaft extends far up into the darkness. There is ladder here, but there's no reason to use it when the elevator is working[otherwise if floor of the elevator car-room is 9 or floor of the elevator car-room is 10]The shaft extends far up into the darkness. The ladder here is missing, making it impossible to climb up to the eleventh floor and beyond[otherwise]This is the top of the shaft[end if]."

Instead of examining down when the location is the top of the elevator car:
	say "[if the location of the mauve guard robot is the elevator car-room]The mauve guard robot is in the elevator car[otherwise]The elevator car is empty[end if].";

After the mauve guard robot going from the elevator car-room to the tenth floor elevator hall when the location is the top of the elevator car:
	say "The mauve guard robot exits the elevator car, out of sight.";

After the mauve guard robot going from the tenth floor elevator hall to the elevator car-room when the location is the top of the elevator car:
	say "The mauve guard robot enters the elevator car below.";
	
The description of the mauve guard robot is "This one looks, if anything, even meaner than the ones [we] has already seen[if location is top of the elevator car]. It's looking around as if confused[end if]. There is a small vent on the top of its head, probably to dispose of excess heat."

Instead of climbing the upper-shaft:
	say "The ladder is broken here.";

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
	say "[We] pours the gel into the vent on the robot's head. The robot flails around wildly and throws [us] from its back, then lets out a loud crackling sound and stops moving.";
	now the mauve guard robot is not under attack;
	remove the mauve guard robot from play;
	move the dead mauve robot to the elevator car-room;
	remove the Electrofil quick-setting conductive polymer gel from play;
	try looking;
	
Instead of going when the mauve guard robot is under attack:
	say "[We] can't leave the elevator when [we're] hanging on nto the robot for dear life.".
	
Instead of pouring the Electrofil quick-setting conductive polymer gel on the robot vent:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of putting the Electrofil quick-setting conductive polymer gel on the mauve guard robot:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of putting the Electrofil quick-setting conductive polymer gel on the robot vent:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of inserting the Electrofil quick-setting conductive polymer gel into the mauve guard robot:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of inserting the Electrofil quick-setting conductive polymer gel into the robot vent:
	try pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot;
	
Instead of pouring the Electrofil quick-setting conductive polymer gel on the mauve guard robot when the location is the top of the elevator car:
	say "[We] tries, but [we] can't get close enough to the robot.";

Instead of shooting the mauve guard robot with the disruptor pistol when the mauve guard robot is under attack:
	say "Firing would be too risky at this close range. [We] could easily hit [ourselves] with the rebound.";
	
Book 6 - 100th Floor

The 100th-floor-region is a region. It contains the 100th floor elevator hall, penthouse north, penthouse east, penthouse south, and penthouse west.

The roof stairs can be hidden. The roof stairs are hidden.

The description of the 100th floor elevator hall is "The luxury is staggering.  The walls are made of polished black marble, and the floors are covered in plush black carpeting that muffles the sound of footsteps. The ceiling is high and adorned with a crystal chandelier. The elevator doors to the west are gold-plated. Sumptuous living quarters are visible to the north and south[if roof stairs are not hidden].

A portion of the eastern wall has slid away to reveal a stunning white marble staircase[end if].".

The walls-100 is scenery in the 100th floor elevator hall. They are privately-named. The printed name is "walls". Understand "wall/walls" as the walls-100. "Black marble. Wow. It's beautiful."

The carpet-100 is scenery in the 100th floor elevator hall. It is privately-named. The printed name is "carpet". Understand "carpet/carpeting/rug/floor/floors" as the carpet-100. "Dark black, almost threatening, rounding out the storm cloud atmosphere of the room."
 
The chandelier is scenery in the 100th floor elevator hall. "An enormously extravagant display of crystal." Understand "ceiling" as chandelier.

The elevator-door-100 is scenery in the 100th floor elevator hall. They are privately-named. The printed name is "elevator door". Understand "elevator/lift/door/doors/gold/gold-plated/plated" as elevator-door-100. "It's not clear why everything has to be so excessive."

stairs appeared is a clip with conversation "Jones: 'Must be the way up to the roof. Beck, you there?'

Beck: 'Yep, I'm here, just a bit busy is all. I[']ll meet you on that roof.'".

The living quarters are scenery in the 100th floor elevator hall. "They look just as over-the-top as the hall here."

After looking when the location is the 100th floor elevator hall and the roof stairs are not hidden:
	print stairs appeared;
	
Check going from the 100th floor elevator hall to the roof stairs when the roof stairs are hidden:
	say text of the can't go that way rule response (A);
	lb instead;

the penthouse north has description "This is Thallium's bedroom. Apart from the expansive round bed in the center of the room, notable features include the line of dummies displaying his various suits of clothes, a large vanity table, and the complete lack of mirrors on the ceiling, thankfully. One may leave the room to the southwest, south, and southeast.". The printed name is "northern corner of the penthouse". Understand "bedroom" as the penthouse north.

The expensive round bed is scenery in the penthouse north. "It's round and huge, and it looks supremely comfortable."
Instead of entering the expensive round bed:
	say text of the block sleeping rule response (A);	
	lb;

Understand "lie on [something]" as entering.

The dummies are scenery in penthouse north. "The best outfit is his Napoleon outfit." Understand "dummy" as dummies.

Admiral Thallium's clothes are scenery in penthouse north. "Hideous." Understand "clothing/suits/outfits/outfit/suit" as Admiral Thallium's clothes.

Instead of attacking the dummies:
	say "Jones lets off a little steam.";

The vanity table is scenery in penthouse north. "A vanity table. So aptly named for a man like the Admiral."

the penthouse east has description "This is apparently an office. A huge desk constructed of bubinga wood and carved in intricate patterns sits before the panoramic window. Video screens, currently displaying Thallium's logo, line the walls. Jones can go northwest or southwest.". The printed name is "eastern corner of the penthouse". Understand "office" as penthouse east. 

The huge desk is scenery in penthouse east. "The desk is really too big for a human-sized person. Bubinga wood, if you're unfamiliar with it, is according to Wikipedia, 'a flowering plant genus in the family [italic type]Fabaceae'[roman type]." Understand "pattern/patterns/intricate/bubinga/wood" as the huge desk.

The video screens are scenery in penthouse east. "They are showing Thallium's logo, the ten planets in order overlaid with the motto 'Planetas Vincam'." Understand "screen/tv/tvs" as video screens.

The penthouse-east-walls is scenery in penthouse east. It is privately-named. The printed name is "walls". Understand "wall/walls" as penthouse-east-walls. "The walls here are of the same black marble as elsewhere."

Admiral Thallium's logo is scenery in penthouse east. "The ten planets in order overlaid with the motto 'Planetas Vincam'." Understand "motto/planets/planet/ten" as Thallium's logo.

the penthouse south has description "This must be Thallium's 'treasure room', to go by the obscene display of wealth. The most notable feature is the array of diamonds lining the walls. Everything else here pales in comparison. [if the glass shards are in penthouse south]Broken glass litters the floor. [end if]The penthouse continues to the northwest, north, and northeast.". The printed name is "southern corner of the penthouse".

The treasure is scenery in penthouse south. "A wall of diamonds is treasure enough, don't you think?" Understand "wealth" as treasure.

The conversation of the penthouse south is "Thallium seems to speak from all around [us]. 'You like diamonds, Jones? Of course you do -- they're a girl's best friend, after all.'
	
	Jones snorts, 'Sure, Thallium.'".
	
[DIAMONDS]

The array of diamonds is scenery in penthouse south. Understand "diamond/gem/gems" as the array of diamonds. "[if glass diamond is not discovered]So many of them, from the tiny to the obscenely large. It looks like it wouldn't be hard to pry one out[otherwise]It's impossible to tell which ones are real and which are glass without prying each one out separately[end if]."

A gem is a kind of thing.
The glass diamond is a gem. It is privately-named. The glass diamond can be discovered. The printed name is "[if discovered]glass diamond[otherwise]diamond". The description is "Worthless.". Understand "diamond/gem" as the glass diamond.

The real diamond is a gem. Understand "gem" as the real diamond. The description is "Maybe 2.5 carats, it's a beautiful gem, if you're into diamonds." The printed name is "diamond"

prying is an action applying to one thing. Understand "pry [something] out/--", "pry out [something]", "loosen [something]" as prying.

Check prying (this is the block prying rule):
	say "That can't be pried out." instead;
	
Instead of prying the array of diamonds when the real diamond is nowhere and the glass diamond is nowhere and the glass diamond is not discovered:
	now the player carries the glass diamond;
	now the glass diamond is seen;
	now the glass diamond is familiar;
	say "You pry one of the diamonds out of the wall.";
	say line break;
	set pronouns from glass diamond;
	converse as thallium "Thallium giggles. 'Oh, I hope you're not disappointed, Jones.'";
	
Instead of taking the array of diamonds when the real diamond is nowhere and the glass diamond is nowhere and the glass diamond is not discovered:
	try prying the array of diamonds;

Rule for clarifying the parser's choice of something when doing something to the glass diamond:
	do nothing;
	
Instead of examining the glass diamond when the glass diamond is not discovered: 
	say line break;
	converse "Jones: 'Hmm. This is made of glass.'
	
	Thallium: 'Poor, sad Jones. But here's the thing. There [style2]is[style1] a real diamond in there; it's just you'll never find it before the building's defenses flood the whole floor with poisonous gas. Or maybe I'm bluffing. Maybe I'm not. Can you afford to gamble?'";
	say line break;
	say "Jones tosses the fake away.";
	remove the glass diamond from play;
	set pronouns from real diamond;
	now the glass diamond is discovered.

attacking it with is an action applying to one thing and one carried thing. Understand "attack [something] with [something]" as attacking it with.

Check attacking something with something:
	say text of the block attacking rule response (A);
	say line break instead;
	
Check attacking the array of diamonds when the glass diamond is not discovered:
	say text of the block attacking rule response (A);
	say line break instead;
	
Some glass shards are scenery. "The remains of dozens of glass diamonds litter the floor."

Instead of taking the glass shards:
	say "[We] would just cut [our] hands.";

Instead of attacking the array of diamonds with the hammer when the glass diamond is discovered for the first time:
	say "[We] commences to smash all of the diamonds. After destroying several dozen fraudulent gems, [we] finds one that won't break. [We] takes the real diamond.[paragraph break]";
	now the player carries the real diamond;
	now the real diamond is seen;
	now the real diamond is familiar;
	now the glass shards are in penthouse south;
	converse "Thallium: 'Wow, clever solution. Be careful you don't cut yourself.'
	
	Jones: 'I appreciate your concern.'";

Instead of attacking the array of diamonds with the hammer when the glass diamond is discovered:
	say "Whoa, once is enough.";
	
Instead of attacking the array of diamonds:
	if the player carries the hammer: 
		say "(with the hammer)[command clarification break]";
		try attacking the array of diamonds with the hammer;
	otherwise:
		say "You're not carrying anything sufficient to smash the diamonds.";
		
Instead of shooting the array of diamonds with something when the glass diamond is discovered:
	say "Shooting one diamond at a time would be too slow.";
	
Instead of taking the array of diamonds when the glass diamond is somewhere:
	say "[We] has already taken a diamond. Isn't one enough?";

Instead of taking the array of diamonds when the glass diamond is discovered and the glass diamond is nowhere and the real diamond is nowhere:
	say "[We] will never find the real diamond this way.".

the penthouse west has description "The purpose of this room is unclear. Instead of the black carpet that plagues the rest of the penthouse, the floor is fashioned from a striking polished red granite. Instead of windows, there are walls. [if the control panel is nowhere]Thallium's personal insignia, the ten planets in order overlaid with the motto 'Planetas Vincam', is carved into the deep red wood outer wall, and inlaid with ebony. [else]A control panel is set into the outer wall. [end if]In the center of the room is a thin metal pillar ending in a claw, which looks like it's meant to hold something. Finally, there is something that looks like an electronic eye set into the inner wall. One may leave to the northeast or southeast.". The printed name is "western corner of the penthouse".

The metal pillar is scenery in the penthouse west. "It's actually wrought iron, and it holds up the claw." Understand "column" as pillar.
The claw is part of the metal pillar. It is a container with carrying capacity 1. The description is "[if the claw contains nothing]It looks like it could grip a small object.[end if]". It is fixed in place.

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
	lb;
	converse "Thallium's voice is thick with feigned concern. 'Oh, my poor, poor Galaxy Jones. And you were so close.'";
	end the story saying "Galaxy Jones was killed by poison gas.";
	
why not is a clip with conversation "[line break]Beck: 'Why didn't you press the button that said [']Press Me[']? Maybe we should press it anyway. Please?'";

Instead of pushing the small black button for the first time:
	say "Somewhere beyond this room comes the sound of something heavy being moved.";
	now the roof access door is unlocked;
	now the roof stairs are not hidden;
	print why not;
	
Instead of pushing the small black button for the first time:
	say "Nothing further happens.";
	
The granite floor is scenery in penthouse west. "On Mars, sometimes one gets tired of red.". Understand "red/floors" as granite floor.

The penthouse-west-walls are scenery in penthouse west. "[if the penthouse control panel is in penthouse west]The outer wall has moved to expose a control panel,[else]The outer wall is all of red wood inlaid with ebony,[end if] while the inner wall, made of brushed stainless steel, is inset with an electronic eye." They are privately-named. The printed name is "walls". Understand "wall/walls/red/wood/brushed/stainless/steel" as penthouse-west-walls.

The insignia is scenery in penthouse west. "'Planetas Vincam', incidentally, means 'I will conquer the planets.'" Understand "motto/words/planets/planet" as the insignia.

The electronic eye is scenery in penthouse west. "Looks like it might be a sensor of some sort." Understand "sensor" as electronic eye.
	
The description of the roof stairs is "Thick slabs of marble lead from the hall to the west to the rooftop door above."; 

Book 7 - The Rooftop

The rooftop is a region. The cage, the penthouse roof, and the flyer pad are in the rooftop.

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
	converse as Thallium "Um, Jones -- that harlot you're so bent on freeing from captivity is over [style2]there[style1]. Now get out of the way, I'm trying to escape.'
	
	Thallium pushes past [us]. [We] attempts to grab his shoulder, but [we] is thrown back by an unseen force.
	
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

At the time when thallium screams one last time:
	if the cage is intact:
		converse as thallium "Thallium: 'Here I go, Jones! Here I go! I'm really leaving this time! Jones! Are you listening? I'm going!'"

At the time when thallium screams again:
	if the cage is intact:
		converse as thallium "Thallium: 'Jones! In a moment I shall leave you to be slaughtered by my minions!'";
		thallium screams one last time in 5 turns from now;

At the time when thallium screams:
	if the cage is intact:
		converse as thallium "Thallium's flyer is circling you not too far away. 'Give up, Jones! You'll never get through my silnium bars, haha!'";
		thallium screams again in 4 turns from now;


When Thallium ultimatum begins:
	converse as thallium "Thallium's flyer hovers over the rooftop. 'Jones!'  he bellows. 'Play time is over. I grow weary of your intransigence. In a moment this roof will be swarmed by guard robots -- of many different colors -- so many robots you couldn't possibly vandalize them all.  Say your prayers, Jones, or whatever you do when you're about to die.'
	
	Jones rolls her eyes.";
	converse "[line break]A little ways off, another flyer, small and red, aims for the rooftop and accelerates.";
	move the red flyer to the rooftop; 
	thallium screams in 3 turns from now;

Before going somewhere during Thallium ultimatum:
	say "Thallium's flyer floats after Jones.";
	
Saving Europa is a scene. Thallium ultimatum ends when Admiral Thallium's flyer is nowhere. 
Saving Europa begins when Thallium ultimatum ends.

The red flyer is a backdrop. The description is "[If saving europa is happening]Jones's little red flyer, Galaxy Two[otherwise]It's little more than a growing red speck[end if]."

When Saving Europa begins:
	converse "The red flyer, now recognizable as Galaxy's own, settles down onto the landing pad.";
	move the red flyer to the rooftop;
 
Chapter 2 - Penthouse Roof

[Check opening the roof access door when the roof access door is unlocked and the location is the roof stairs:]
Check going east when the location is the 100th floor elevator hall and the roof stairs are not hidden:
	if DEBUG is false:
		say "[line break]Are you sure you wish to face the evil Admiral Thallium? Are you ready to pass the point of no return?[line break]>";
		if the player consents:
			continue the action;
		stop the action;
	continue the action;
	
Check going up when the location is the 100th floor elevator hall and the roof stairs are not hidden:
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
	converse as thallium "Jones walks out onto the luxurious penthouse roof. Admiral Thallium turns from the railing to face [us]. He is dressed in an absurd elaboration of a Martian Admiral's uniform. He looks Jones up and down with a lecherous leer. 'Ah, Galaxy Jones, as lovely as ever. If it weren't so unbearably cliché I[']d ask you to join me in my rise to greatness. But alas, you are too habituated to the smug high of [']goodness['].' He sighs dramatically. 'We've trodden similar ground before; no need to discuss it further. Although I would challenge any of your various [style2]amoureux[style1] to conjugate [']tread['] correctly.
	
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
	
Instead of jumping during Thallium alight:
	say "[Our] jump comes up pathetically short of the Admiral's flyer.";
	
Instead of jumping during Thallium ultimatum:
	say "[Our] jump comes up pathetically short of the Admiral's flyer.";

The description of the penthouse roof is "It is an extravagant and opulent space, designed to showcase Thallium's wealth and power. Much of the rooftop is devoted to an outdoor lounge area, with comfortable seating and a fire pit, centered around a hot tub and flanked by a bar. All around is the city of New Reykjavik, and beyond that the red Martian landscape. Around the entirety of the roof is an electrostatic field designed to keep air in and particulates out. To the north is a large cage, and to the west is a landing pad[if Europa Callisto is in the cage]. Jones can distantly see a woman lying on the floor of the cage[end if][If Admiral-Thallium is in penthouse roof]. A green and black flyer sits on the landing pad[end if]."

The lounge area is scenery in the penthouse roof. "Looks like a good time, if [we] weren't already busy." Understand "fire/pit/bar/hot/tub" as the lounge area.

After looking when the location is in the rooftop and the cage is intact during Thallium alight:
	say "Admiral Thallium's flyer is hovering above you.";

After looking when the location is in the rooftop and the cage is intact during Thallium ultimatum:
	say "Admiral Thallium's flyer is hovering above you.";

The rooftop seating is scenery in the penthouse roof. "[We] has other things to focus on."

The electrostatic field is a backdrop in the rooftop. The description is "It can't be seen, but it's comforting to know it's there."

Admiral-Thallium is in penthouse roof.

Admiral Thallium's flyer is a backdrop. It is in penthouse roof, cage, and flyer pad. The description is "this is a secret message". Understand "rails/gear/landing/thallium" as Admiral Thallium's flyer.

Instead of examining Admiral Thallium's flyer during On-Rooftop:
	say "It's big and green and black. Looks like a Sirius XE."

Instead of examining Admiral Thallium's flyer during Thallium alight:
	say "Hovering above [us], it's distinctly menacing. It's not visibly armed, but it conveys the impression of a beast about to strike. It's flying low, the rails of its landing gear just a few feet above Jones's head.";

Instead of examining Admiral Thallium's flyer during Thallium ultimatum:
	say "Hovering above [us], it's distinctly menacing. It's not visibly armed, but it conveys the impression of a beast about to strike. It's flying low, the rails of its landing gear just a few feet above Jones's head.";
	
cage-scenery is a backdrop. It is in penthouse roof and flyer pad. "You can see the cage with Europa Callisto in it from here. She's lying on the floor and not moving." It is privately-named. The printed name is "cage". Understand "cage" as cage-scenery.

The description of cage is "[if the cage is not broken]The closely-set silnium bars seem to dash all hope of a rescue.[otherwise]The whole structure is tilted, leaving a hole at the eastern end.[end if] The flyer pad is to the southwest and the rest of the rooftop to the south.".

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
	
The cage-thing is a privately-named enterable supporter in the cage. It is scenery. The printed name is "cage". Understand "cage/bars/silnium" as the cage-thing. "The cage is huge for holding just one prisoner. The silnium bars are grey and iridescent. They run both horizontally and vertically, creating a lattice. The floor is hard and cold." Understand "lattice/bars/silnium" as the cage-thing.

Understand "prisoner" as Europa Callisto.

Instead of climbing the cage-thing:
	try entering the cage-thing;
	
Check going nowhere when the player is in cage:
	if noun is up:
		try entering the cage-thing;
		if the player is on the cage-thing:
			try looking;
		stop the action;
	
Check going nowhere when the player is on the cage-thing:
	if noun is down:
		try getting off the cage-thing instead;
	
Does the player mean doing something to the cage:
	it is very unlikely;
	
Does the player mean doing something to the cage-thing:
	it is very likely;
	
Chapter 3 - Hooking the flyer

Instead of going nowhere from the cage:
	if the noun is up:
		try entering the cage-thing;
	if the noun is down:
		if the player is on the cage-thing:
			try exiting;
		otherwise: 
			say "Should Jones burrow downward?";

Instead of attacking Admiral Thallium's flyer:
	say "It's just too far away.";
	
Instead of throwing something at Admiral Thallium's flyer:
	say "Throwing [the noun] would hardly be effective.";
	
Instead of throwing the screwdriver at Admiral Thallium's flyer:
	say "It would just bounce off.";
	
Instead of throwing the bottled water at Admiral Thallium's flyer:
	say "The water could be useful.";
	
Instead of throwing the hammer at Admiral Thallium's flyer:
	say "It might leave a dent, but bring down a flyer? Really?";
	
Does the player mean throwing something at the red flyer:
	it is very unlikely;

To break the cage:
	score 1;
	say line break;
	converse "[We] throws the cable up to the flyer where it hooks around the rail, and attaches the other end to the cage, then jumps off the cage to escape the aftermath. Seeing his flyer's predicament, Thallium jumps out of the craft and disappears below the edge of the roof. The flyer reaches the end of its tether and slingshots downwards, slamming into side of the building.
	
	The cage has tilted to the side, one attachment torn loose from the rooftop. Jones crawls into the cage to see to Europa Callisto. 
	
	'Europa! Can you hear me? I need you to move to get out of this cage. I can't carry you through that small opening. Europa!'
	
	Europa moans but doesn't show any signs of having understood Jones.";
	remove Admiral Thallium's flyer from play;
	remove the hook cable from play;
	now the cage is broken;
	move the player to the cage-container;

Instead of throwing the hook cable at Admiral Thallium's flyer when the player is on the cage-thing:
	break the cage;
		
Instead of tying the hook cable to the cage-thing when the player is on the cage-thing:
	break the cage;

Instead of throwing the hook cable at Admiral Thallium's flyer:
	say "[We] throws the cable, but it comes up short. [We] gathers it up again.";
	
Instead of tying the hook cable to the cage-thing:
	say "[We] can't get close enough to the flyer to tie the cable to it.";
	
Instead of tying the hook cable to the cage-thing when the player is not on the cage-thing:
	say "It doesn't seem useful to attach the cable to this part of the cage.";
	
Chapter 4 - The Flyer Pad

The description of the flyer pad is "This is what one would expect from a rooftop flyer pad: landing lights surrounding a large letter F painted in white on a red background. Europa's cage is to the northeast and the rest of the rooftop is to the east." Understand "letter/F/lights/landing/background" as the flyer pad.


	
Chapter 5 - The Water Bottle

Understand the command "lift" as "take".

The cage-container is a transparent open scenery container in the cage. It is privately-named.

Rule for clarifying the parser's choice of the cage-thing:
	do nothing;

Instead of waking Europa:
	say "Europa moans but otherwise does not respond.";

Instead of giving the bottled water to Europa when the cage is broken:
	converse "[We] opens the water bottle and brings it to Europa's lips. Even with closed eyes she drinks, first slowly and then with increasing vigor, until her eyes open.
	
	'Ga- Galaxy Jones?' she says.
	
	Jones nods, but says 'We'll have time for introductions later. We have to get out of here before the roof is full of killer robots. Can you crawl? If you can get through that hole I can carry you the rest of the way.'
	
	Europa nods. 'I think so.'
	
	Galaxy Jones helps her through the hole in the cage, then gently picks her up and jogs toward the waiting flyer. Beck's familiar face appears at the door of the aircraft, urging her on.";
	score 1;
	say line break;
	converse as thallium "Not so far away, Admiral Thallium crawls back over the edge of the roof. As he pulls himself up, he aims a pistol at Jones's back...";
	say line break;
	converse "The shot hits her full in the back and she falls sprawling on the landing pad, Europa Callisto tumbling from her arms. Beck is by Callisto's side in a moment, lifting her and carrying her into the flyer.";
	say line break;
	converse as thallium "And then the robots swarm the roof like a mechanical rainbow tide. By the time Beck returns to the door it is already too late. A group of robots surrounds Jones, while another robot carries Thallium triumphantly. Beck has no choice but to take off, leaving Jones behind, not knowing if she still lives...";
	say line break; 
	continue;
	end the story finally saying "The End, For Now..."
	
Instead of pouring the bottled water on Europa when the cage is broken:
	say "It's not elegant, but it works.[paragraph break]";
	try giving the bottled water to Europa;
	
Instead of going nowhere from the cage during Saving Europa:
	say "[We] can't leave Europa now!";
	
Instead of going south from the cage during Saving Europa:
	say "[We] can't leave Europa now!";
	
Instead of entering during Saving Europa:
	say "[We] can't leave Europa now!";
	
Instead of exiting during Saving Europa:
	say "[We] can't leave Europa now!";
	
When Saving Europa begins:
	Beck shouts in two turns from now;
	
At the time when Beck shouts:
	say "Beck sticks his head out of the door of the flyer and yells 'C'mon Jones, get Europa and get in the flyer!'";
	
Instead of pulling europa during saving europa:
	say "Jones could pull Europa up to the hole in the cage, but she'd never get her through without help."
	
Instead of taking europa during saving europa:
	say "Jones could carry Europa to the hole in the cage, but she'd never get her through without help."
	
Instead of pushing europa during saving europa:
	say "Jones could carry Europa to the hole in the cage, but she'd never get her through without help."
	
Instead of exiting during saving Europa:
	say "Jones can't leave Europa now!";
	
Volume 9 - The End, etc

To show basic credits:
	say "Extensions by:[line break]";
	say italic type;
	say the list of extension credits;
	say roman type;
	say line break;
	say "Story by Phil Riley.";
	say "Programming by Phil Riley.";
	say "Playtesting by Leon Lin, Oliver Matthias, Jade, John Ziegler, and Kenneth Pedersen.";
	say "Invaluable inspiration from Laura Taalman.";
	
To show extended credits:
	show basic credits;
	say line break;
	say "The story, all names, characters, and incidents portrayed in this production are fictitious. No identification with actual persons (living or deceased), places, buildings, and products is intended or should be inferred.";
	say line break;
	say "Promotional consideration provided by Olympus Springs of Mars, Inc.";
	say paragraph break;
	say "...";
	say paragraph break;
	
To screen print (T - a text):
	say "[italic type]<[T]>[roman type][paragraph break]";
	
After printing the player's obituary when the story has ended finally:
	say paragraph break;
	show extended credits;
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
	converse "Join Galaxy Jones next time in [style2]Galaxy Jones II: Existential Time Crisis![style1]";
	if accessible is off:
		print the galaxy banner;
	
Volume 10 - Speech
 
Book 1 - Talking to Beck

Understand "ask [someone] about [any visited room]" as quizzing it about.
Understand "ask about [any visited room]" or "a [any visited room]" as implicit-quizzing.

A thing can be interesting or dull. A thing is usually dull.

Definition: a thing is quizzable if it is interesting or it is visible.

When play begins:
	repeat through the Table of Interesting Things:
		now the item entry is interesting;
		
Rule for clarifying the parser's choice of something when quizzing and the noun is beck:
	do nothing;
	

Before quizzing beck about a room:
	say "";

Before quizzing beck about something when the second noun is not beck and the second noun is not the player:
	say "";
[	converse "Jones: 'Beck, [one of]what do you think about [the second noun]?[or]tell me about [the second noun].[or]how about [the second noun]?[at random]'[run paragraph on][line break]";]

Before quizzing beck about beck:
	lb;
	converse "Jones: 'How're you doing, Beck?'";

Before quizzing beck about the player:
	lb;
	converse "Jones: 'How's my status?'";

[Before quizzing beck about a room:
	lb;
	converse "Jones: 'Beck, [one of]what do you think about [the second noun]?[or]tell me about [the second noun].[or]how about [the second noun]?[at random]'[run paragraph on][line break]";]
		
Instead of quizzing beck about something that is not quizzable:
	converse "Beck: 'I don't have much to say about that.'";
	
Instead of quizzing beck about a room: 
	converse "Beck: 'I don't have much to say about that.'";

After deciding the scope of the player:
	place beck in scope; 
	 
Instead of doing something other than quizzing to Beck when action requires a touchable noun:
	say "Beck is just a voice in [our] ear." instead;
	
Instead of doing something when action requires a touchable second noun and the second noun is Beck:
	say "Beck is just a voice in [our] ear." instead;
	
Instead of doing something to Beck when action requires light:
	say "[We] can't see Beck.";

After asking Beck about something:
	converse "Beck: 'I'm not sure what you're asking about, Jones.'";

Instead of quizzing Beck about something:
	converse "Beck: 'Hmm. Don't have much to say about that right now.'";
	stop the action;

Instead of quizzing Beck about guard-robots when comment on energy absorption is unused during Lobby Shootout:
	converse "Beck: 'Keep your head down and keep firing.'";	

Instead of quizzing Beck about guard-robots when comment on energy absorption is used during Lobby Shootout:
	converse "Beck: 'It doesn't look like shooting the robots is doing any good. Is there another way you can hurt them?'";

Instead of quizzing Beck about guard-robots when Lobby Shootout has ended:
	converse "Beck: 'I've really come to appreciate art a lot more since then.'";
	
Instead of quizzing Beck about the hook cable:
	converse "Beck: 'Could come in handy.'";
	
Instead of quizzing Beck about the Lobby:
	converse "Beck: 'Impressive place.'";
	
Instead of quizzing Beck about the Speeder Dock:
	converse "Beck: 'It's almost empty. Guess everyone went home when Thallium went ape.'";
	
Instead of quizzing Beck about the 100th floor elevator hall:
	converse "Beck: 'This guy's got some kind of inferiority complex.'";
	
Instead of quizzing Beck about the 100th floor view of New Reykjavik:
	converse "Beck: 'Wow. Impressive.'";
	
Instead of quizzing Beck about Admiral Thallium's flyer:
	converse "Beck: 'It's a nice vehicle, I'll give him that. Have you ever noticed villains always have ugly houses and beautiful flyers?'";
	
Instead of quizzing Beck about Admiral-Thallium:
	converse "Beck: 'Wonderful man, can't get enough of him.'";
	
Instead of quizzing Beck about the air handling room:
	converse "Beck: 'Good thing this was here. Don't see why we'd hang around, though.'";
	
Instead of quizzing Beck about the Atmo-Suit when the ledge is not visited:
	converse "Beck: 'Hope we don't have to use it.'";
	
Instead of quizzing Beck about the Atmo-Suit when the ledge is visited:
	converse "Beck: 'Good thing this was around.'";
	
Instead of  quizzing Beck about the Atmo-Suit when the ledge is not visited:
	converse "Beck: 'Hope we don't have to use it.'";
	
Instead of  quizzing Beck about Beck:
	converse "Beck: 'I'm just happy to serve.'";
	
Instead of  quizzing Beck about bed:
	converse "Beck: 'No time to rest, Jones.'";
	
Instead of  quizzing Beck about black cat:
	converse "Beck: 'I'll adopt it.'
	
	'Jones: 'After it damn near took off my hand?'";
	
Instead of  quizzing Beck about building entryway:
	converse "Beck: 'Extravagant, as always.'";
	
Instead of  quizzing Beck about bottle of Electrofil quick-setting conductive polymer gel:
	converse "Beck: 'I imagine it does what it says it does.'";
	
Instead of quizzing Beck about bottled water: 
	converse "Beck: 'Say Jones, you could use an endorsement contract. How about Olympus Springs water?'
	
	Jones: 'Yeah, sure.'";
	
Instead of quizzing Beck about cage: 
	converse "Beck: 'You're going to need a lot of force to get through that.'";
	
Instead of quizzing Beck about cage-thing: 
	converse "Beck: 'You're going to need a lot of force to get through that.'";

Instead of quizzing Beck about claw: 
	converse "Beck: 'This whole place is like some weird wizard's chamber.'";
	
Instead of quizzing Beck about coin:
	converse "Beck: 'Might as well hold on to it. You're not getting paid for this job.'";
	
Instead of quizzing Beck about crystal lighting:
	converse "Beck: 'And this is just the elevator!'";
	
Instead of quizzing Beck about Cybernetica door:
	converse "Beck: 'Oh, they make the best games!'";
	
Instead of quizzing Beck about Cybernetica office:
	converse "Beck: 'Oh, they make the best games!'";
	
Instead of quizzing Beck about dead mauve robot:
	converse "Beck: 'Nice job, Jones.'";
	
[Instead of quizzing Beck about desks-microthings-2:
	converse "Beck: 'So many desks. So. many. desks.'";]
	
Instead of quizzing Beck about desks-microthings-3:
	converse "Beck: 'What do all these people even do? I mean, Consolidated Microthings, what do they do?'";
	
Instead of quizzing Beck about destroyed purple robot:
	converse "Beck: 'Just can't get a reliable guard robot these days.'";
	
Instead of quizzing Beck about disruptor pistol:
	converse "Beck: 'Uh, you know what that's for, right?'";
	
Instead of quizzing Beck about black jumpsuit:
	converse "Beck: 'That allows me to see and hear what's going on there.'";
	
Instead of quizzing Beck about drop-key-hole:
	converse "Beck: 'You insert a drop key in there and then turn it.'";
	
Instead of quizzing Beck about ductwork:
	converse "Beck: 'You can get back out through there.'";
	
Instead of quizzing Beck about electronic eye:
	converse "Beck: 'Looks like light needs to hit it or something.'";
	
Instead of quizzing Beck about elevator car-backdrop:
	converse "Beck: 'It makes me uncomfortable, it hanging above us like that.'";
	
Instead of quizzing Beck about elevator car-room:
	converse "Beck: 'You gotta admit, this is insane.'";
	
Instead of quizzing Beck about drop key:
	converse "Beck: 'I'm not sure what that is. Look closer.'";
	
Instead of quizzing Beck about drop key when the drop key is examined:
	converse "Beck: 'Huh. You learn something every day.'";
	
Instead of quizzing Beck about Europa Callisto:
	converse "Beck: '[if the cage is intact and the cage is visited]We need to break open that cage somehow[otherwise if the cage is broken]You'll need to revive her if you want to get her out of there[otherwise]I hope she's okay[end if].'";
	
Instead of quizzing Beck about filing cabinet:
	converse "Beck: 'I can't imagine there's anything in there of relevance to rescuing Europa Callisto.'";
	
Instead of quizzing Beck about flyer pad:
	converse "Beck: 'I'll be there soon.'";
	
Instead of quizzing Beck about fork:
	converse "Beck: 'Maybe you can poke Thallium with a fork until he submits?'";
	
Instead of quizzing Beck about the garish medal:
	converse "Beck: '[if safety pin is not seen]Might as well take a look at it[otherwise]It's really pretty disgraceful[end if].'";

Instead of quizzing Beck about the giant sculpture:
	converse "Beck: 'While I normally dislike Rambutan's work, this one has a certain power to it[if the giant sculpture is nowhere]. It's even better in thousands of tiny pieces[end if].'";

Instead of quizzing Beck about the glass diamond when the glass diamond is not discovered:
	converse "Beck: 'How much do you think it's worth?'";

Instead of quizzing Beck about the glass diamond when the glass diamond is discovered:
	converse "Beck: 'Don't get attached to pretty things, Jones.'";

Instead of quizzing Beck about the real diamond:
	converse "Beck: 'Ooh pretty.'";

Instead of quizzing Beck about the golden key:
	converse "Beck: 'Gold is a terrible material for keys.'";

Instead of quizzing Beck about the golden keyhole:
	converse "Beck: 'This is just silly.'";

Instead of quizzing Beck about the gym:
	converse "Beck: 'This place has great perks. Maybe I'll go work for them.'
	
	Jones: 'Beck, I'll tell you again: we don't have any place in HQ for a gym.'";

Instead of quizzing Beck about the hammer:
	converse "Beck: 'A hammer can't hurt. I mean, it can, but you know what I mean.'";

Instead of quizzing Beck about the hook cable:
	converse "Beck: 'It seems very strong. It can undergo a lot of force without breaking'";

Instead of quizzing Beck about the huge desk:
	converse "Beck: 'Why does Thallium need such a desk? It's not like he can read or write.'";

Instead of quizzing Beck about the insignia:
	converse "Beck: '[']I will conquer the planets['], eh?'";

Instead of quizzing Beck about the ivory buttons:
	converse "Beck: 'I keep thinking he can't get any worse, and then he tops himself.'";

Instead of quizzing Beck about the keypad:
	converse "Beck: 'Where might you find the code?'";

Instead of quizzing Beck about the large desk:
	converse "Beck: 'There must be a way to break into it.'";

Instead of quizzing Beck about the large red button:
	converse "Beck: '[']Press Me[']? Who makes a button that says [']Press Me[']?'";

Instead of quizzing Beck about the large relief map of Mars:
	converse "Beck: 'Well, now we know where we are at least. Other than that, this doesn't seem to help.'";

Instead of quizzing Beck about the ledge:
	converse "Beck: 'I wish you weren't out there, Jones. Steady now.'";

Instead of quizzing Beck about the lobby:
	converse "Beck: 'It's an impressive building, I'll give Thallium that.'";

Instead of quizzing Beck about the lounge area:
	converse "Beck: 'No time for banter right now, bye!'";

Instead of quizzing Beck about the maintenance items:
	converse "Beck: 'You're not planning to clean the place, are you?'";

Instead of quizzing Beck about the Martian Chemical office:
	converse "Beck: 'These guys are one of the worst polluters on Mars. People think we can just go on dumping chemicals everywhere because the place is so empty, but haven't they ever heard of exponential growth? I mean --'
	
	Jones: 'Yes! I totally agree. But let's deal with this after we've rescued Europa.'";

Instead of quizzing Beck about the mauve guard robot:
	converse "Beck: 'Maybe you can out-maneuver him.'";

Instead of quizzing Beck about the metal pillar:
	try quizzing Beck about the claw;

Instead of quizzing Beck about the military-detritus:
	converse "Beck: 'Who does this guy think he's fooling? On the other hand, maybe you can find a disguise in there and fake your way past the guards.'";

Instead of quizzing Beck about the Martian Chemical office:
	converse "Beck: 'These guys are one of the worst polluters on Mars. People think we can just go on dumping chemicals everywhere because the place is so empty, but haven't they ever heard of exponential growth? I mean --'
	
	Jones: 'Yes! I totally agree. But let's deal with this after we've rescued Europa.'";

Instead of quizzing Beck about the north-task-boards:
	converse "Beck: 'Write something on them! Something nasty about Thallium!'";

Instead of quizzing Beck about the south-task-boards:
	converse "Beck: 'Write something on them! Something nasty about Thallium!'";

Instead of quizzing Beck about the note:
	converse "Beck: 'Looks useful'";

Instead of quizzing Beck about the penthouse control panel:
	converse "Beck: 'Be careful, don't press the wrong button.'";

Instead of quizzing Beck about the poached ostrich eggs in jelly:
	converse "Beck: 'Where does he keep his ostrich farm?'";

Instead of quizzing Beck about the purple guard robot:
	converse "Beck: 'These things are pretty invulnerable from a distance. Try getting closer in.'";

Instead of quizzing Beck about the red flyer:
	converse "Beck: 'I'm flying it! No time to talk!'";

Instead of quizzing Beck about the robot vent:
	converse "Beck: 'Looks like a point of weakness, as you said.'";

Instead of quizzing Beck about the safety pin:
	converse "Beck: 'You never know when you might need something that can get in a very small space.'";

Instead of quizzing Beck about the screwdriver:
	converse "Beck: 'Always useful.'";

Instead of quizzing Beck about the shrimp tea sandwich:
	converse "Beck: 'I love shrimp, but unfortunately it makes me break out.'";

Instead of quizzing Beck about the small black button:
	converse "Beck: 'Inscrutable, but do we have any choice?'";

Instead of quizzing Beck about the speeder-vehicle:
	converse "Beck: 'I keep reminding you, but you still haven't taken it in for yearly maintenance.'";

Instead of quizzing Beck about the statue of admiral thallium:
	converse "Beck: 'We'll come back and knock it over later.'";

Instead of quizzing Beck about the tangled ruin when the hook cable is not familiar:
	converse "Beck: 'Might be something useful in there.'";

Instead of quizzing Beck about the Utopia Tower:
	converse "Beck: 'Sure is big.'";

Instead of quizzing Beck about the vanity table:
	converse "Beck: 'Here's where the magic happens.'";

Instead of quizzing Beck about the Viking 2 lander:
	converse "Beck: 'I'd heard it was stolen. I can't believe he just flaunts it like this.'";

Instead of quizzing Beck about the window washing scaffold:
	converse "Beck: 'How nice of them to put this here for us.'";

Instead of quizzing Beck about the yourself:
	converse "Beck: 'All systems look good.'";
	
Table of Interesting Things
item (a thing)
Admiral-Thallium
Atmo-Suit
Beck
bed
black cat
Electrofil quick-setting conductive polymer gel
bottled water
dead mauve robot
destroyed purple robot
Europa Callisto
garish medal
giant sculpture
real diamond
golden key
guard-robots
hook cable
ivory buttons
poached ostrich eggs in jelly
shrimp tea sandwich
speeder-vehicle
statue of admiral thallium
tangled ruin
Viking 2 lander



Chapter 2 - Pleading / Help

resetting help is an action out of world. Understand "ask beck to reset help", "reset help" as resetting help.

Carry out resetting help:
	blank out the whole of Table of Pleading Counts;
	say "Resetting all help messages.";

Pleading is an action applying to nothing. Understand "ask beck for help", "ask beck what to do", "ask for help" as pleading.

Report pleading: 
	say line break;
	converse "Beck: 'Looks like you're managing okay.'";
	
To decide what number is plead (ID - a value):
	if there is an id of ID in the Table of Pleading Counts:
		let c be the count corresponding to an id of ID in the Table of Pleading Counts;
		increment c;
		now the count corresponding to an id of ID in the Table of Pleading Counts is c;
		decide on c;
	otherwise:
		choose a blank row in the Table of Pleading Counts;
		now id entry is ID;
		now count entry is 1;
		decide on 1;

To decide what number is noplead (ID - a value):
	if there is an id of ID in the Table of Pleading Counts:
		let c be the count corresponding to an id of ID in the Table of Pleading Counts;
		decide on c;
	otherwise:
		decide on 0;
		
to setplead (ID - a value) to (N - a number):
	if there is an id of ID in the Table of Pleading Counts:
		now the count corresponding to an id of ID in the Table of Pleading Counts is N;
	otherwise:
		choose a blank row in the Table of Pleading Counts;
		now id entry is ID;
		now count entry is N;
	

Table of Pleading Counts
id (value)	count (number)
with 100 blank rows;	

Section 1 - Examples

After pleading when lobby shootout has ended and the maintenance closet is not visited and the catering table is seen:
	lb;
	if plead maintenance closet is:
		-- 1: converse "Beck: 'You saw that utility door near the catering table, right?'";
		-- 2: converse "Beck: 'It's got a numerical lock on it.'";
		-- 3: converse "Beck: 'The code should be around here somewhere.'";
		-- otherwise: 
			if the note is handled:
				converse "Beck: 'Look at the note you got from the front desk.'";
			otherwise:
				converse "Beck: 'Check the front desk.'";

After pleading when the drop key is seen and the ground floor elevator door is closed:
	lb;
	if plead drop key is:
		-- 1: converse "Beck: 'You should probably be heading up the building by now.'";
		-- 2: converse "Beck: 'Time to open the elevator door.'";
		-- otherwise: converse "Beck: 'Use the drop key you found in the elevator room.'";

After pleading when the drop key is not seen and the ground floor elevator door is closed and the red cardkey is handled:
	lb;
	converse "Beck: 'You should look for a door where you can use that cardkey.'";
	
After pleading when the location is south end of building management office and (the screwdriver is not handled or the black cat is somewhere):
	lb;
	if plead screwdriver is:
		-- 1: converse "Beck: 'If you haven't yet, get the screwdriver.'";
		-- 2: converse "Beck: 'Oops. Getting the screwdriver didn't turn out well. Look behind the cabinet to get the screwdriver.'";
		-- 3: converse "Beck: 'Looks like you'll need to get rid of the cat. What do cats like?'";
		-- 4: converse "Beck: 'Give the shrimp tea sandwich to the cat.'";
		-- otherwise: converse "Beck: 'What? You don't have a shrimp tea sandwich? Didn't you examine the catering table on the ground floor? Time to go back there.'"
		
After pleading when the location is in the ninth-floor and the black cardkey is not seen and the ninth floor north hallway is visited and the ninth floor south hallway is visited:
	lb;
	if plead ninth-floor is:
		-- 1: converse "Beck: 'You've probably noticed the two locked doors on this floor. You need to get them open.'";
		-- 2: converse "Beck: 'The cardkey for both of them is in the large desk in the building management office.'";
		-- 3: converse "Beck: 'You don't have a key for the desk. Maybe you can pick the lock?'";
		-- 4: converse "Beck: 'Pick the desk lock with the safety pin.'";
		-- 5: converse "Beck: 'You'll find it inside the medal.'";
		-- otherwise: converse "Beck: 'You'll find the medal with the other military junk on the first floor.'";

After pleading when the location is the cybernetica office and the purple guard robot is in the cybernetica office:
	lb;
	if plead cybernetica office is:
		-- 1: converse "Beck: 'The robot's got you pinned down good, yeah? And you can't get a good shot in? And even if you did, it would probably just be absorbed?'";
		-- 2: converse "Beck: 'When will you start listening to your handler? When? I've been giving you good advice, just spelling out what to do, and you don't pay attention.'";
		-- otherwise: converse "Beck: 'Sneak up on the stupid robot already!'";
		
After pleading when the location is the ledge and the window washing scaffold is not discovered:
	lb;
	if plead ledge is:
		-- 1: converse "Beck: 'Is there anything out there useful?'";
		-- 2: converse "Beck: 'Have you looked everywhere?'";
		-- 3: converse "Beck: '[style2]everywhere?[style1]'";
		-- otherwise: converse "Beck: 'Look down.'";
		
After pleading when the location is the window washing scaffold and the floor of the window washing scaffold is 10 and the exhaust vent is closed:
	lb;
	if plead exhaust vent is:
		-- 1: converse "Beck: 'You need to get into the building through the exhaust vent.'";
		-- 2: converse "Beck: 'You need to remove the cover of the exhaust vent.'";
		-- 3: converse "Beck: 'To do that you need a screwdriver.'";
		-- otherwise: converse "Beck: 'Haven't got one? Go back to the building management office.'";
		
After pleading when (the location is in the tenth-floor-region or the location is the air handling room or the location is top of the elevator car) and the mauve guard robot is somewhere:
	lb;
	if plead tenth-floor-region is:
		-- 1: converse "Beck: 'Before we begin, save your game. This could get ugly.'";
		-- 2: converse "Beck: 'There are multiple ways to get past this floor. Here's one.'";
		-- 3: converse "Beck: 'Go west from the air handling room, south once, and west into the elevator car.'";
		-- 4: converse "Beck: 'You'll notice a loose ceiling panel. Open it.'";
		-- 5: converse "Beck: 'Now lure the robot in the southwest corner to the elevator car.'";
		-- 6: converse "Beck: 'Leave the elevator to the east, go south to catch the robot's eye, then go north and west back into the elevator car. Then go up onto the top of the car.'";
		-- 7: converse "Beck: 'The robot will enter the car but not see you. Now's your chance!'";
		-- 8: converse "Beck: 'No, shooting won't work.'";
		-- 9: converse "Beck: 'When the robot leaves you'll have to lure it back again.'";
		-- 10: converse "Beck: 'Maybe pour something on the robot?'";
		-- 11: converse "Beck: 'No, don't waste your water. What else is pourable?'";
		-- 12: converse "Beck: 'Yes, the polymer gel! But you can't get close enough to pour it on the robot.'";
		-- 13: converse "Beck: 'Jump on the robot!'";
		-- otherwise: converse "Beck: 'Then pour the gel on the robot.'";
		
After pleading when the location is in the 100th-floor-region and the roof stairs is hidden and penthouse south is visited:
	lb;
	if plead 100th-floor-region is:
		-- 1: converse "Beck: 'You need to get to the roof, but there is no apparent way to get there.'";
		-- 2: converse "Beck: 'What are these diamonds?'";
		-- 3: converse "Beck: 'Have you examined one?'";
		-- 4: converse "Beck: 'It's fake!'";
		-- 5: converse "Beck: 'You can't just keep looking at the diamonds one-by-one.'";
		-- 6: converse "Beck: 'You need a faster way to distinguish real and fake.'";
		-- 7: converse "Beck: 'Smash the diamonds with the hammer.'";
		-- 8: converse "Beck: 'If you don't have the hammer, it's on the ground floor in the elevator room.'";
		-- 9: converse "Beck: 'Put the diamond in the claw in penthouse west.'";
		-- 10: converse "Beck: 'DON'T PRESS THE BIG RED BUTTON!'";
		-- 11: converse "Beck: 'Examine the panel and then press the small black button.'";
		-- otherwise: converse "Beck: 'A secret door has now opened in the elevator hall.'";
		
After pleading when the location is the roof stairs:
	lb;
	if plead roof stairs is:
		-- 1: converse "Beck: 'Be careful before going to the roof, there's no turning back.'";
		-- 2: converse "Beck: 'You need two things.'";
		-- 3: converse "Beck: 'Not the fork.'";
		-- 4: converse "Beck: 'The water bottle and the cable.'";
		-- 5: converse "Beck: 'You can buy the water bottle from the vending machine on the ninth floor.'";
		-- 6: converse "Beck: 'You can get a coin to buy the water with from the waterfall on the ground floor.'";
		-- otherwise: converse "Beck: 'You can get the cable by examining the tangled ruin left by the sculpture in the lobby.";

After pleading when the location is in the rooftop:
	lb;
	if plead rooftop is:
		-- 1: converse "Beck: 'Congratulations! You made it this far.'";
		-- 2: converse "Beck: 'You need to break Europa out of the cage and get her to a rescue flyer.'";
		-- 3: converse "Beck: 'Don't worry, the rescue flyer will show up on time.'";
		-- 4: converse "Beck: 'To break open the cage, you'll need to find some way to apply a great force to it.'";
		-- 5: converse "Beck: 'Hook the cable to the flyer and the cage by saying THROW CABLE AT FLYER.'";
		-- 6: converse "Beck: 'Come up short? Get higher.'";
		-- 7: converse "Beck: 'Climb the cage.'";
		-- 8: converse "Beck: 'Now throw the cable.'";
		-- 9: converse "Beck: 'Now you're in the cage but Europa is unresponsive. How do you revive her?'";
		-- otherwise: converse "Beck: 'The water of course!'";

Chapter 3 - Ask Beck About Game

Instead of asking Beck about "game":
	lb;
	converse "Beck: 'Well, you can ask about: [bold type]INTERACTIVE FICTION[style1], [bold type]COMMANDS[style1], or [bold type]CREDITS[style1].'";
	
abouting is an action applying to nothing. Understand "about" as abouting.
Instead of abouting:
	try asking Beck about "game";
	
crediting is an action applying to nothing. Understand "credits" as crediting.
Instead of crediting:
	try asking Beck about "credits";
	
commanding is an action applying to nothing. Understand "commands", "verbs" as commanding.
Instead of commanding:
	try asking Beck about "commands";
	
Instead of asking Beck about "interactive fiction":
	lb;
	converse "Beck: 'According to Wikipedia, [']Interactive fiction, often abbreviated IF, is software simulating environments in which players use text commands to control characters and influence the environment.['] In more plain language, in this game you'll explore places, acquire objects, and defeat enemies all by typing commands. For instance, if you found an axe, you would type [bold type]TAKE AXE[style1] to take it, and [bold type]DROP AXE[style1] to drop it again.'
	
	You can move around in the world by typing commands like [bold type]GO NORTH[style1], which can be abbreviated as [bold type]N[style1]. If you need to refresh your memory about your surroundings you can say [bold type]LOOK[style1], or just [bold type]L[style1]. To see what you're holding, use [bold type]INVENTORY[style1], or [bold type]I[style1]. You can find out more about that axe from before by typing [bold type]EXAMINE AXE[style1], or just [bold type]X AXE[style1].'
	
	Of course, any game has limitations, so you can't just enter any old sentence and expect to have it understood. [bold type]ASK BECK ABOUT COMMANDS[style1] for a partial list of commands that will work.'";

To say cmd:
	say bold type;

to say xcmd:
	say style1; 

Instead of asking Beck about "commands":
	lb;
	converse "'Here's a partial list of commands with explanations and/or examples:'[line break]
[line break]
* [cmd]TAKE[xcmd]: [cmd]TAKE GOLD COIN[xcmd][line break]
* [cmd]DROP[xcmd]: [cmd]DROP GOLD COIN[xcmd][line break]
* [cmd]I[xcmd]: list the player's possessions[line break]
* [cmd]X[xcmd]: examine something; [cmd]X GOLD COIN[xcmd][line break]
* [cmd]L[xcmd]: look around[line break]
* [cmd]CLIMB[xcmd]: [cmd]CLIMB BEANSTALK[xcmd][line break]
* [cmd]GET OFF[xcmd]: [cmd]GET OFF BEANSTALK[xcmd][line break]
* [cmd]PUT INTO[xcmd]: [cmd]PUT GOLD COIN INTO TREASURE CHEST[xcmd][line break]
* [cmd]PUSH[xcmd]: [cmd]PUSH BIG RED BUTTON[xcmd][line break]
[line break]
not to mention [cmd]POUR[xcmd], [cmd]TYPE[xcmd], [cmd]OPEN[xcmd], [cmd]CLOSE[xcmd], [cmd]UNLOCK[xcmd], [cmd]SHOOT[xcmd], and a few others you'll have to figure out for yourself.";

Instead of asking Beck about "credits":
	lb;
	converse "'The people responsible:'";
	lb;
	show basic credits;


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
ground floor elevator hall	ground floor elevator shaft	"[We] climbs into the elevator shaft."
the Cybernetica office	ledge	"[We] climbs out the window."
ledge	window washing scaffold	"[We] drops off the ledge onto the scaffold. It rocks unnervingly for a moment."
ground floor elevator  shaft	ninth floor elevator shaft	"[We] climbs up the shaft, stopping at each floor to test each door. [We] gets all the way to the ninth floor, directly below the elevator car, before finding one that opens."
ninth floor elevator shaft	ninth floor elevator hall	"[We] exits the shaft, the door sliding closed behind [us]."

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
	
Book 2 - You can't go that way

Table of Excuses
source room (a room)	dirs (a list of directions)	excuse (a text)
speeder dock	--	"[We] can't just leave Europa in the hands of Admiral Thallium!"
entry doorway	--	"Jones is already at the main entrance. She's unlikely to find another way in."
lobby	--	"Jones can go south out of the building or north to the elevator. The ground floor continues east and west."
lobby	{northeast, northwest}	"That would just get Jones lost in a maze of couches."
ground-floor-1	--	"Jones can't walk through walls. Try north or east."
ground-floor-1	{northeast}	"Jones is blocked by an impenetrable wall of philodendrons. North or east would be easier."
ground-floor-2	--	"Jones can't walk through walls. Try north or south, or the door to the east."
ground-floor-2	{northeast, southeast}	"Instead of plowing through the sea of furniture, Jones should try going north, south, or east."
ground-floor-3	--	"Jones can't walk through walls. She can go east or south from here."
ground-floor-3	{southeast}	"Jones ends up in a cul-de-sac of couches, and retreats. Clearer passages lie to the east and south."
ground-floor-4	{north}	"Right into hands of Admiral Thallium?"
ground-floor-4	--	"The building extends east or west from here. The elevator is to the south."
ground-floor-4	--	"That would lead Jones right into a wall."
ground-floor-5	--	"Jones can't walk through walls. She can go south or west from here."
ground-floor-5	{southwest}	"That way is blocked by the memorabilia display."
ground-floor-6	{east}	"Jones almost bumps into a glass wall."
ground-floor-6	--	"Jones can go south or north, or through a door to the west."
ground-floor-7	{northwest}	"That would lead directly through the Viking 2 lander."
ground-floor-7	--	"That way leads through the glass wall."
ground floor elevator hall	--	"That way leads straight into a wall."
ground floor elevator shaft	--	"Jones is constrained to a narrow shaft. She can either leave to the east, or climb the ladder up."
ninth floor elevator shaft	--	"Jones is constrained to a narrow shaft. She can either leave to the east, or climb the ladder down."
ninth floor elevator shaft	{up}	"The way further up is blocked by the elevator car."
ninth floor elevator hall	--	"The elevator is west and a stairwell is east. The hall continues north and south."
ninth floor north hallway	--	"There's an open doorway to the west, a door to the east, and a hall leading south."
ninth floor south hallway	--	"There's an open doorway to the west, a door to the east, and a hall leading north."
north end of the building management office	--	"Jones can leave through a doorway to the east, or go south to the other end of the office."
south end of the building management office	--	"Jones can leave through a doorway to the east, or go north to the other end of the office."
Martian Chemical office	--	"The only way to leave the office is through the door to the west."
Cybernetica office	--	"Jones can leave through the door to the west[if the bwindow is navigable]. She can also go east through the broken window[end if]."
Ledge	{north, south}	"The wall juts out and blocks Jones's progress."
Ledge	--	"That would send Jones plummeting to her death."
Ledge	{up}	"If only Jones could climb walls."
Ledge	{down}	"Go down? Jones doesn't even want to [italic type]look[roman type] down."
Window Washing Scaffold	{up,down}	"If you want to go up and down, use the buttons."
Window Washing Scaffold	--	"That way leads to a quick death."
air handling room	--	"Jones can go west through the door, or east back out to the scaffold."
microthings-1	--	"The elevator is north of here, and the floor extends east and west."
microthings-2	--	"The path through the desks leads north and east."
microthings-3	--	"Jones can't walk through walls. She can go north or south from here."
microthings-4	--	"The floor extends east and south from here."
microthings-5	--	"The elevator is south of here, and the floor extends west and southeast. The door to the air handling room is to the east."
microthings-7	--	"Jones can go either northwest or south from here."
microthings-8	--	"From here, one can go north or west."
tenth floor elevator hall	--	"The elevator is to the west, the stairs are to the east, and the office floor lies both north and south of here."
elevator car-room	--	"The exit is to the east."
(100th floor elevator hall)	--	"The elevator is to the west, and the hall leads into the penthouse to the north and south[if roof stairs are not hidden]. To the east stairs lead to the roof[end if]."
penthouse north	--	"The diamond-shaped penthouse bends to the southeast and southwest."
penthouse east	--	"The diamond-shaped penthouse bends to the northwest and southwest."
penthouse south	--	"The diamond-shaped penthouse bends to the northeast and northwest."
penthouse west	--	"The diamond-shaped penthouse bends to the northeast and southeast."
roof stairs	--	"Jones may go west back to the 100th floor, or up to the roof."
penthouse roof	--	"Jones would plummet to her death that way."
flyer pad	--	"Jones would plummet to her death that way."
cage	--	"Jones would plummet to her death that way."


To decide which text is the excuse for (source - a room) to (dir - a direction):
	repeat through the Table of Excuses:
		if there is a dirs entry:
			if (source room entry is source) and (dir is listed in dirs entry):
				decide on excuse entry;
	if dir is up:
		decide on "[We] [can] neither climb walls nor fly.";
	if dir is down:		
		decide on "[regarding the player][Are] [we] going to burrow downward?" in sentence case;
	if dir is inside:
		decide on "What [regarding the player][do] [we] want to enter?";
	if dir is outside:
		decide on "[text of the can't exit when not inside anything rule response (A)]";
	repeat through the Table of Excuses:		
		if there is no dirs entry:
			if source room entry is source:
				decide on excuse entry;
	decide on "[We] [can't] go that way.";
	
Instead of going nowhere:
	let ex be the excuse for location to the noun;
	say "[ex][paragraph break]";
	
Book 3 - Can't Take That

Table of Frustrated Taking
target (a thing)	message (a text)	move message (a text)
(100th floor view of New Reykjavik)	"Jones can't take that!"	"Don't be silly."
Admiral Thallium's flyer	"Jones can't even reach it."	"Don't be silly."
Admiral Thallium's clothes	"Jones would rather not touch his clothes."
Air handling door	"No taking doors."	"Aside from opening and closing [regarding the noun][them], what is there to do?"
bed	"It's too big to take."	"The frame is built into the floor here."
bwindow	"Broken glass is unlikely to be useful outside of a prison fight or a bar brawl."	"The window isn't going anywhere."
building entryway	"Not gonna happen."
cafeteria	"Not likely."
cage-thing	"It's firmly attached to the roof."
carpet-100	"It's glued down."
carpeting	"It's glued down."
catering table	"With all that food on it? I don't think so."	"Jones would rather not risk tipping it over."
central carpeted path	"Are you serious?"
chandelier	"Jones can't reach it."
chemical cabinet	"Why take the cabinet when Jones can just take what's in it?"	"Jones pushes it around a little, but doesn't find anything interesting."
chemical-desks	"No, no desks."	"Jones is not here to rearrange the furniture."
claw	"It's attached to the pillar which is attached to the floor."
closet door	"Jones can't just disassemble the building."	"Aside from opening and closing it, what is there to do?"
closet-door-inside	"Jones can't just disassemble the building."	"Aside from opening and closing it, what is there to do?"
computer parts	"There's a lot of them, none of which look terribly useful in defeating Thallium, so best leave them alone."
couches-microthings-1	"More furniture? No, just like last time."	"Jones is not here to rearrange the furniture."
crystal lighting	"Jones is likely to cut herself trying to take some."	"It's affixed to the ceiling."
Cybernetica door	"This building may belong to a bad guy, but the Cybernetica people deserve their security."	"Aside from opening and closing it, what is there to do?"
Cybernetica door-inside	"This building may belong to a bad guy, but the Cybernetica people deserve their security."	"Aside from opening and closing it, what is there to do?"
cybernetica-desks	"Now why would Jones need a desk?"	"Jones is not here to rearrange the furniture."
dead mauve robot	"It's too heavy to lift or move."
destroyed purple robot	"It's too heavy to lift or move."
[desks-microthings-2	"Jones can't take desks, and that's that."	"Jones is not here to rearrange the furniture."]
desks-microthings-3	"Jones can't take desks, and that's that."	"Jones is not here to rearrange the furniture."
ductwork	"This is part of the building."
dummies	"They'd be cumbersome to carry around."	"Jones pushes one over just for fun."
semicircular couch	"That's too big to take."	"Jones is not here to rearrange the furniture."
electronic eye	"That's installed in the wall."
elevator-control-panel	"That's part of the elevator."
elevator control panel	"That's affixed to the wall."
elevator car-backdrop	"Jones can't take that."	"That can't be moved."
elevator-car-door	"That's part of the elevator."	"Aside from opening and closing it, what is there to do?"
elevator-door-100	"Jones can't take doors."	"Aside from opening and closing [regarding the noun][them], what is there to do?"
elevator-room-door	"Jones can't just disassemble the building."	"Aside from opening and closing it, what is there to do?"
elevator-room-door-inside	"Jones can't just disassemble the building."	"Aside from opening and closing it, what is there to do?"
elevator-shaft	"I'd like to see Jones try."
elevator-walls	"Think about what you just asked."
elevators-scenery	"I mean, Jones can [italic type]take[roman type] the elevator, but not in the way you mean."	"Usually one moves an elevator by pressing a button."
elevators-scenery-2	"You have a weird sense of humor."
entry door	"That's part of the building."	"Jones pushes it a little. The revolving door spins delightfully."
Europa Callisto	"Jones could lift her, but she'd never get her through the hole in the cage. Europa needs to be awake to crawl out."
executive offices	"Don't be silly."
exhaust vent	"Jones can remove the cover, but the vent itself is part of the building."
fans	"Leave the fans alone. They are dangerous machinery."
filing cabinet	"Do you know how heavy paper is?"
First floor view of New Reykjavik	"Jones can't take that!"
ground-floor-ceiling	"Jones can't reach it."
ground-floor-floor	"Silly."
front desk	"This desk is attached to the floor."
giant sculpture	"It's way up in the air! And it's huge!"
golden keyhole	"That's part of the elevator."	"It doesn't move."
granite floor	"Jones can't take the floor!"	"Seriously?"
ground floor central pillar	"That's a structural element of the building."
ground floor elevator door	"The building needs that."	"Aside from opening and closing it, what is there to do?"
ground floor elevator door-inside	"The building needs that."	"Aside from opening and closing it, what is there to do?"
ground floor elevator shaft	"Nonsense."
ground-floor-stairwell	"Try going inside it first."
guard-robots	"Jones would only get shot."
gym	"Jones has a perfectly good setup at home."
huge desk	"This desk would take three or four people to move."
insignia	"That's carved into the wall."
ivory buttons	"It's against the law to possess ivory."
ladder	"That's attached to the wall."
large desk	"Let's leave the furniture where it is."	"Jones is not here to rearrange the furniture."
large relief map of Mars	"That's permanently attached, and it's gotta be awful heavy."
ledge-wall	"Why doesn't Jones take the whole building while she's at it?"	"Silly."
lobby-background	"Jones can't take the entire lobby!"	"Silly."
lounge area	"That's ridiculous."
maintenance items	"There are too many to lug around."	"Jones moves the maintenance items around a bit, but discovers nothing of interest."
Martian Chemical door	"Whatever for?"	"Aside from opening and closing it, what is there to do?"
Martian Chemical logo	"That's part of the door."
metal pillar	"Jones doesn't have the time it would take to detach it from the floor."
military-detritus	"They're all behind glass."	"Jones pokes around in it a bit, but discovers nothing interesting."
New Reykjavik Botanic Dome	"Taken.[paragraph break]No, sorry, that's ridiculous."
niches	"That's part of the building."
ninth floor elevator door	"If Jones took that, innocent people might fall down the elevator shaft."	"Aside from opening and closing it, what is there to do?"
ninth floor elevator shaft	"What are you even talking about?"
Ninth floor view of New Reykjavik	"Jones can't take that!"	"Jones can't move that!"
ninth-floor-stairwell	"Try going inside it first."
north-desks	"Do you know how many desks Jones would have if she took everyone she saw in this building? A [italic type]lot[roman type] of desks, that's how many."	"Jones is not here to rearrange the furniture."
North-mgmt-doorway	"Loony."
north-task-boards	"Do you think maybe Jones will have to communicate with Thallium through a sound-proof glass barrier or something?"	"Jones rearranges the task boards a little, but it's still just a mess."
open-space	"That's literally the absence of things."
parking bays	"Don't be silly."
penthouse control panel	"It's built into the wall."
Perilous view of New Reykjavik	"Jones can't take that!"	"Jones can't move that!"
purple guard robot	"The weight is too great to lift."	"It's too heavy to move."
reception	"I'm sure they'd appreciate it if Jones left it here."	"It's affixed to the floor."
red flyer	"Interesting concept."
roof access door	"Jones doesn't want a door."	"Aside from opening and closing it, what is there to do?"
rooftop seating	"Don't be silly."
scaffold control panel	"That functions best when it's part of the scaffold."
scaffold-scenery	"Jones can't take that."	"Jones can't move that."
shelf	"It's attached to the wall."
south-desks	"Desks, desks, so many desks..."	"Jones is not here to rearrange the furniture."
South-mgmt-doorway	"It's part of the building."
south-task-boards	"Do you think maybe Jones will have to communicate with Thallium through a sound-proof glass barrier or something?"	"Jones rearranges the task boards a little, but it's still just a mess."
speeder-vehicle	"Don't be silly."
statue of admiral thallium	"Don't be silly."	"It won't budge."
supports	"They are structural components of the building."
elevator-room-swipe-lock	"That's part of the door."
cybernetica-room-swipe-lock	"That's part of the door."
tangled ruin	"Jones might find something useful in the mixture of sculpture and robots, but the thing as a whole is a huge mess."
tasteful couch	"It's big, and Jones doesn't need it for anything."	"Jones is not here to rearrange the furniture."
Tenth floor view of New Reykjavik	"Jones can't take that!"	"Jones can't move that!"
tenth-floor-stairwell	"How can Jones take a stairwell?"	"Don't be silly."
upper-shaft	"Jones can't take an elevator shaft."	"Ridiculous."
Utopia Tower	"Go find a souvenir instead."
vanity table	"It's too big to carry around."	"Jones is not here to rearrange the furniture."
vending machine	"[if the bottled water is nowhere]Why not buy some water instead?[otherwise]I think the water is all Jones is going to take from the vending machine.[end if]"	"Moving the machine might cause it to topple over. Jones wisely leaves it alone."
Vent access door	"And what would Jones even use it for?"	"Aside from opening and closing it, what is there to do?"
video screens	"Those are attached to the wall."
viking 2 lander	"Although it would be nice to return it to its rightful place at the Museum of Martian History, that will have to wait."	"Really, Jones doesn't feel good about even touching such an important relic."
walls-100	"Don't be silly."
waterfall	"That's a permanent display."	"Jones splashes the water a little."
window-thing	"That's part of the building."	"It's not designed to be opened."




To decide what text is the can't take message of (T - a thing):
	if there is a message corresponding to a target of T in the Table of Frustrated Taking:
		decide on the message corresponding to a target of T in the Table of Frustrated Taking;
	decide on "Jones can't take that.";
	
To decide what text is the can't move message of (T - a thing):
	if there is a move message corresponding to a target of T in the Table of Frustrated Taking:
		decide on the move message corresponding to a target of T in the Table of Frustrated Taking;
	if there is a message corresponding to a target of T in the Table of Frustrated Taking:
		decide on the message corresponding to a target of T in the Table of Frustrated Taking;
	decide on "Jones can't move that.";

[A thing has a text called a can't take message. The can't take message of a thing is usually "Jones can't take that.".]

The can't take scenery rule response (A) is "[can't take message of the noun]".

The can't take what's fixed in place rule response (A) is "[can't take message of the noun]".

The can't pull scenery rule response (A) is "[can't move message of the noun]".

The can't pull what's fixed in place rule response (A) is "[can't move message of the noun]".

The can't push scenery rule response (A) is "[can't move message of the noun]".

The can't push what's fixed in place rule response (A) is "[can't move message of the noun]".

Volume 13 - A few extra descriptions

the description of light-meter is "no need for a description".
	
Volume 14 - Not for release

DEBUG is true. 

Understand "* [text]" as a mistake ("Noted.").

drop keying is an action applying to nothing. Understand "dk" as drop keying.
Carry out drop keying:
	now the player carries the drop key.

[Include Property Checking by Emily Short].

Volume 15 - Tests

test elevator with "n/n/z/z/shoot art/x art/e/n/type 0/w/take all/e/x table/take all/n/x medals/take medal/x medal/take pin/w/w/s/unlock door with red keycard/e/take all/w/s/x waterfall/take coin/e/n/open elevator with drop key".
test ninth with "test elevator/w/u/e".
test mgmt with "test ninth/buy water with coin/n/w/pick desk lock with pin/take black card/s/take screwdriver/look behind cabinet/drop shrimp/e".
test ledge with "test mgmt/unlock door with black cardkey/e/take gel from cabinet/w/n/n/unlock door with black cardkey/e/sneak up on robot/sneak up on robot/sneak up on robot/shoot robot/s/n/e".
test air with "test ledge/look down/look down/look down/d/press up/press up/open vent with screwdriver/w".
test robot with "test air/w/s/w/take panel/e/s/n/w/u/jump on robot/pour gel on robot".
test golden with "test robot/e/s/w/open present/e/n/w/put golden key in keyhole".
test 100 with "test golden/press 100/e/s/take diamond/x it/smash diamonds with hammer/nw/put gem in claw/x panel/press black button/ne/s".
test endgame with "test 100/e/u/n/climb cage/throw cable at flyer/give water to europa".
