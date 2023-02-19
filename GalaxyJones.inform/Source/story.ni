"Galaxy Jones" by Philip Riley

Include Basic Screen Effects by Emily Short.

Include Galaxy Banner by Philip Riley.
Include Third Person Narration by Philip Riley.

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

Volume 1 - Geograpy

Book 1 - Ground Floor

the speeder dock is a room. 

the entry doorway is north of Speeder Dock.

Entry Door is a door. It is north of Entry Doorway and south of the lobby.

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

Volume 2 - The Player Character
	
[Galaxy Jones is a woman in Prison.]
Player's surname is "Jones".
Player's titled name is "Galaxy Jones".
Understand "Galaxy/Jones" as yourself.

When play begins:
	now the player is not male;
	now the player is female;
	now the story viewpoint is third person singular;
	now the third singular pronoun of the player is she-pronoun;
	
Volume 3 - Room Implementations

Book 1 - Ground Floor

Chapter 1 -  Speeder Dock

The description of the speeder dock is "A safe harbor from the periodic dust storms of Utopia Planitia, the dock features several dozen speeder bays. Only a few are filled right now. The building entryway is to the north, under a red stone façade carved into a fearsome Viking.".

The speeder-vehicle is a thing in the speeder dock. It is privately-named. The printed name is "speeder". Understand "speeder/vehicle/car/landspeeder/galaxy/one" as speeder-vehicle. "[Our] speeder, Galaxy One, sits in one of the parking bays."
The description is "Galaxy One is a Dust Runner, a top-of-the-line model from Olympus Speedworks. It's deep crimson with tinted windows. Powerful turbines adorn vestigial wings that sweep back in severe rearward arcs.".

Some windows are part of the speeder-vehicle. The description is "The tint is too dark to see through.".

Some turbines are part of the speeder-vehicle. The description is "Still hot, the engines cause [us] to recoil from the waves of heat rolling off of them." Understand "engines/thrusters/turbine/engine/thruster" as turbines.

Some wings are part of the speeder-vehicle. The description is "Not technically necessary as the speeder works via anti-gravity, the blade-like wings give the vehicle a certain flair unobtainable by any other means.".

Instead of entering the speeder-vehicle:
	say "You have a job to do here.";