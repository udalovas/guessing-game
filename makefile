README.md: guessinggame.sh
	touch README.md
	echo "# Guessing Game" > README.md
	echo "A simple guessing game implemented as a part of graduation work for one of the online courses, this time around bash scripting." >> README.md
	echo "## Metrics" >> README.md
	echo "Number of lines in the source file(s):" >> README.md
	wc -l guessinggame.sh | egrep --only-matching "[0-9]+" >> README.md
	echo >> README.md
	echo "File generated at: `date`" >> README.md

clean:
	rm README.md  
