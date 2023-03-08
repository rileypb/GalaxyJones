Third Person Narration by Philip Riley begins here.

Use authorial modesty.

Include Gender Options by Nathanael Nerode.

Volume 1 - Player Refs

Include (-
[ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
	sline1 = score; sline2 = turns;

	while (true) {
		! Save the start of the buffer, in case "oops" needs to restore it
		for (i=0 : i<64 : i++) oops_workspace->i = a_buffer->i;
	
		! In case of an array entry corruption that shouldn't happen, but would be
		! disastrous if it did:
		#Ifdef TARGET_ZCODE;
		a_buffer->0 = INPUT_BUFFER_LEN;
		a_table->0 = 15;  ! Allow to split input into this many words
		#Endif; ! TARGET_
	
		! Print the prompt, and read in the words and dictionary addresses
		PrintPrompt();
		DrawStatusLine();
		KeyboardPrimitive(a_buffer, a_table);
	
		! Set nw to the number of words
		#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
	
		! If the line was blank, get a fresh line
		if (nw == 0) {
			@push etype; etype = BLANKLINE_PE;
			players_command = 100;
			BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
			if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) {
				PARSER_ERROR_INTERNAL_RM('X', noun); new_line;
			}
			EndActivity(PRINTING_A_PARSER_ERROR_ACT);
			@pull etype;
			continue;
		}
	
		! Unless the opening word was OOPS, return 
		! Conveniently, a_table-->1 is the first word on both the Z-machine and Glulx
	
		w = a_table-->1;
		if (w == OOPS1__WD or OOPS2__WD or OOPS3__WD) {
			if (oops_from == 0) { PARSER_COMMAND_INTERNAL_RM('A'); new_line; continue; }
			if (nw == 1) { PARSER_COMMAND_INTERNAL_RM('B'); new_line; continue; }
			if (nw > 2) { PARSER_COMMAND_INTERNAL_RM('C'); new_line; continue; }
		
			! So now we know: there was a previous mistake, and the player has
			! attempted to correct a single word of it.
		
			for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer2->i = a_buffer->i;
			#Ifdef TARGET_ZCODE;
			x1 = a_table->9;  ! Start of word following "oops"
			x2 = a_table->8;  ! Length of word following "oops"
			#Ifnot; ! TARGET_GLULX
			x1 = a_table-->6; ! Start of word following "oops"
			x2 = a_table-->5; ! Length of word following "oops"
			#Endif; ! TARGET_
		
			! Repair the buffer to the text that was in it before the "oops"
			! was typed:
			for (i=0 : i<64 : i++) a_buffer->i = oops_workspace->i;
			VM_Tokenise(a_buffer,a_table);
		
			! Work out the position in the buffer of the word to be corrected:
			#Ifdef TARGET_ZCODE;
			w = a_table->(4*oops_from + 1); ! Start of word to go
			w2 = a_table->(4*oops_from);    ! Length of word to go
			#Ifnot; ! TARGET_GLULX
			w = a_table-->(3*oops_from);      ! Start of word to go
			w2 = a_table-->(3*oops_from - 1); ! Length of word to go
			#Endif; ! TARGET_
		
			! Write spaces over the word to be corrected:
			for (i=0 : i<w2 : i++) a_buffer->(i+w) = ' ';
		
			if (w2 < x2) {
				! If the replacement is longer than the original, move up...
				for (i=INPUT_BUFFER_LEN-1 : i>=w+x2 : i = i - 1)
					a_buffer->i = a_buffer->(i-x2+w2);
		
				! ...increasing buffer size accordingly.
				#Ifdef TARGET_ZCODE;
				a_buffer->1 = (a_buffer->1) + (x2-w2);
				#Ifnot; ! TARGET_GLULX
				a_buffer-->0 = (a_buffer-->0) + (x2-w2);
				#Endif; ! TARGET_
			}
		
			! Write the correction in:
			for (i=0 : i<x2 : i++) a_buffer->(i+w) = buffer2->(i+x1);
		
			VM_Tokenise(a_buffer, a_table);
			#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
		
			return nw;
		}

		! Undo handling
	
		if ((w == UNDO1__WD or UNDO2__WD or UNDO3__WD) && (nw==1)) {
			Perform_Undo();
			continue;
		}
		i = VM_Save_Undo();
		#ifdef PREVENT_UNDO; undo_flag = 0; #endif;
		#ifndef PREVENT_UNDO; undo_flag = 2; #endif;
		if (i == -1) undo_flag = 0;
		if (i == 0) undo_flag = 1;
		if (i == 2) {
			VM_RestoreWindowColours();
			CarryOutActivity((+ naming activity +));			
			IMMEDIATELY_UNDO_RM('E'); new_line;
			continue;
		}
		return nw;
	}
];

-) instead of "Reading the Command" in "Parser.i6t".

naming is an activity. 

For naming (This is the standard naming rule):
	say "[player's titled name] is [the preposition of the location][bold type] [if the location is always-indefinite][a location][otherwise][the location][end if][roman type].";

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
	let intermediate level be the visibility-holder of the actor;
	if visibility level count > 1:
		repeat with intermediate level count running from 2 to the visibility level count:
			if the intermediate level is a supporter or the intermediate level is an animal:
				say " (on [the intermediate level])" (B);
			otherwise:
				say " (in [the intermediate level])" (C);
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
