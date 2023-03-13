Pseudocontainers by Philip Riley begins here.

Use authorial modesty.

Include Epistemology by Eric Eve.

A pseudocontainer is a kind of opaque closed container. 
A pseudocontainer has a text called the contents description. The contents description of a pseudocontainer is usually "".
A pseudocontainer can be auto-take.

Carry out examining a pseudocontainer when something is in the noun:
	If the noun is closed, now the noun is open;
	if the contents description of the noun is not empty:
		say "[contents description][paragraph break]";
	otherwise:
		say "[description][paragraph break]";
	repeat with X running through the things contained in the noun:
		now the X is seen;
		now the X is familiar;
	if the noun is auto-take:
		repeat with X running through the things contained in the noun:
			silently try taking X;
			now the X is seen;
			now the X is handled;
			now the X is familiar;
	stop the action;
	
[Instead of taking something inside a closed pseudocontainer (called PC):
	try examining PC;]
	
Instead of searching a pseudocontainer:
	try examining the noun;

Check inserting something into a pseudocontainer:
	say "That can't contain things." instead;	
	
Before taking something when the noun is contained in a pseudocontainer:
	now the noun is seen;
	now the noun is handled;
	now the noun is familiar;
	
[[Rule for deciding whether all includes a thing contained in a pseudocontainer:
	it does not.]
	
Rule for deciding whether all includes an unseen thing:
	It does not.]
	
Rule for reaching inside a pseudocontainer:
	allow access;	

Pseudocontainers ends here.
