Essentials by Philip Riley begins here.

Use authorial modesty.

[Include Conversation Framework by Eric Eve.
Include Conversation Responses by Eric Eve.]

Book 1 - Debugging

[DEBUG is a truth state that varies.
	
To dbg (t - a text):
	if DEBUG is true:
		say "*** [t][line break]";
		]
Chapter 1 - Definitions 

Definition: a region is player-containing if the player is regionally in it.

[Definition: a thing is container-held if it is in a container carried by the player.

Definition: a thing is held:
	if it is carried by the player:
		decide yes;
	if it is container-held:
		decide yes;
	if it is in a container which is container-held:
		decide yes;
	decide no;	]
	
Definition: a thing is container-here if it is in a container in the location or it is on a supporter in the location.

Definition: a thing is available:
	if it is in the location:
		decide yes;
	If it is container-here:
		decide yes;
	If it is in a container which is container-here:
		decide yes;
	if it is on a supporter which is container-here:
		decide yes;
	if it is held by a person who is available:
		decide yes;
	decide no;
	
[To decide whether (T - a thing) is here:
	decide on whether or not T is available;

To decide which text is inline (T - text): (- {T} -)

[A handy tool for scripting scenes. Use "if at [Scene Name] plus [minutes into scene]:"]
To decide what time is (s - a scene) plus (n - a number):
	decide on n minutes after time when s began;
	
To decide whether at (s - a scene) plus (n - a number):
	if time of day is s plus n:
		decide yes;
	decide no;
	
To decide what room is the holding room of (T - a thing):
	decide on nothing;
	
To decide whether (t1 - a thing) is colocated with (t2 - a thing):
	if the location of t1 is the location of t2:
		decide yes;
	decide no;
	

A region can be powered. A region is usually powered.

A room has a text called a dark description.
A thing has a text called a dark description.

A room can be dimly lit or fully lit.

Definition: a room is powered if it is in a powered region.

To decide what time is (s - a scene) plus (n - a number):
	decide on n minutes after time when s began;
	
To decide whether at (s - a scene) plus (n - a number):
	if time of day is s plus n:
		decide yes;
	decide no;
	
An unenterable room is a kind of thing. An unenterable room can be enterable. An unenterable room is enterable. An unenterable room is scenery.
Instead of entering an unenterable room:
	say "You can't enter that.";]
				




[Book 2 - Subjects and Facts

[A subject, defined in Conversation Framework by Eric Eve, is an abstract notion that everyone is familiar with. A fact is something which may or may not be known by various people. 

For example, "time" is a subject, whereas "the computer password" or "The secretary is leading a double life" are facts.]

A fact is a kind of thing. A fact is seen.

[Knowledge relates various people to various things. The verb to know (he knows, they know, he knew, it is known) implies the knowledge relation.]

[We put all subjects and facts in a room so that they are in the world, so they can be referenced.]
Room of Subjects is a room. "This is where all subjects go."

When play begins:
	Repeat with S running through subjects:
		move S to the Room of Subjects;
	Repeat with F running through facts:
		move F to the Room of Subjects;

Book 3 - Help


Chapter 1 - The Help Command

		
Helping is an action out of world. Understand "help" as helping.
[Carry out helping:
	say "Welcome to [bold type][work title][roman type]. In most ways this game is similar to other works of interactive fiction but there are a few special commands you should be aware of:
	
	[bold type]Speaking[roman type]
	   - ask someone for something 
	   - ask someone about something
	   - tell someone about something
	
	[bold type]Commerce[roman type]
	   - buy something with something - asks to buy something with a particular method of payment, for instance a credit card.
	   - how much is something / how much does something cost
	
	[bold type]Help[roman type]
	   - help
	   - who is someone
	   - what is something
	   - who owns something
	"]

Chapter 2 - Who is / What is

A thing has a text called help text.

Identifying is an action applying to one thing.
Understand "who is [any person]" as identifying.
Understand "what is/are [any thing]" as identifying.
Understand "what is/are [any subject]" as identifying.

[Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
    say "I couldn't really say."]

This is the can't reach inside rooms rule:
	if the action name part of the current action is identifying action:
		decide yes;
	decide no;

Carry out identifying:
	if the noun is familiar:
		if the help text of the noun is "":
			say "I can't tell you any more than you already know.";
		otherwise:
			say "[the help text of the noun][paragraph break]";
	otherwise:
		say "I really couldn't say.";
		

Book 4 - Outdoors / Indoors

A room can be either indoors or outdoors. A room is usually indoors.
The weather is a thing. The weather can be either rainy or sunny. The weather is sunny.
A room can be outdoor-adjacent.

Book 5 - Speech

[To shout (speech text - a text) as (speaker - a person) in (R - a region):
	if player is regionally in R:
		if in darkness:
			if speaker is available:
				say "[speaker]'s voice shouts beside you, '[speech text]'";
			otherwise if speaker is in an adjacent room:
				say "You hear [speaker] shouting [best route from the location to the location of the speaker] from here, '[speech text]'";
			otherwise:
				say "You hear [speaker] shout somewhere, '[speech text]'";
		otherwise:
			if speaker is available:
				say "[speaker] shouts beside you, '[speech text]'";
			otherwise:
				say "You hear [speaker] shout somewhere, '[speech text]'";]
				
[To speak (speech text - a text) as (speaker - a person) to (target - a person):
	if speaker is available:
		say "[speaker] says, '[speech text]' to [if target is player]you[otherwise][target][end if].";
	otherwise if speaker is in an adjacent room:
		say "You can hear [speaker] speaking [best route from the location to the location of the speaker] from here."]
			
[To print (speech text - a text) as (speaker - a person):
	if speaker is available:
		if in darkness:
			say "[speaker] says, close beside you in the dark, '[speech text]'";
		otherwise:
			say speech text;
	otherwise if speaker is in an adjacent room:
		say "You can hear [speaker] speaking [best route from the location to the location of the speaker] from here."]



		
To print to (P - a person) that (T - a text):
	if P is the player:
		say T;
		
To print near (P - a person) that (T - a text):
	if P is colocated with the player:
		say T;
		
To print to (P - a person) that (T - a text) as (speaker - a person):
	print to P that T;
	if P is not player:
		say T;
		
To print in (R - a room) that (T - a text):
	if location is R:
		say T;
		
asking for identification is an action applying to nothing. Understand "who are you" as asking for identification.

Check asking for identification when current interlocutor is nothing:
	say "[text of the don't allow saying goodbye to no-one rule response (A)][paragraph break]" instead;
	
Check asking for identification:
	try quizzing current interlocutor about current interlocutor;
		

Motives are a subject.

Questioning motives is an action applying to nothing. Understand "what do you want" as questioning motives.

Check questioning motives when current interlocutor is nothing:
	say "[text of the don't allow saying goodbye to no-one rule response (A)][paragraph break]" instead;
	
Check questioning motives:
	try quizzing current interlocutor about motives;
	
promising is an action applying to nothing. Understand "I promise" as promising. Understand "promise" as promising.

Check promising when the current interlocutor is nothing:	
	say "[text of the don't allow saying goodbye to no-one rule response (A)][paragraph break]" instead;
	
Instead of promising when the current interlocutor is not nothing:
	try answering the current interlocutor that "I promise";	
]	
	


		



Essentials ends here.
