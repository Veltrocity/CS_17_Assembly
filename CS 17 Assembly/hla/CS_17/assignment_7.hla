 program binaryoutput;
 #include( "stdlib.hhf" );
 static
   zGivenNumber : int8;  // the value to inspect
 begin binaryoutput;
	//Ask for a decimal number
    stdout.put( "Gimme a decimal value to print: ");
    //Put that number in 'zGivenNumber' (Let's say 7)
    stdin.get( zGivenNumber );
	//Put 'zGivenNumber' inside 'BH' ('BH' now contains 7)
    mov( zGivenNumber, BH);

    stdout.put("Number in binary is: ", nl);

	//Shift left 1 at 'BH' (This makes 'BH' 14)
	shl(1, BH);
	//Not a clue what this is doing
	lahf();
	//Checking to see if 0000_0001 and AH match 0's and 1's
	//(I'm not sure about the % sign as well as where AH came from)
	and( %0000_0001, AH );
	//Print out 'AH' in Eight Bit form
	stdout.puti8(AH);

	shl(1, BH); //2
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);

	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);
	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);
	stdout.put("_");
	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);
	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);
	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);
	shl(1, BH); //Next
	lahf();
	and( %0000_0001, AH );
	stdout.puti8(AH);

 end binaryoutput;