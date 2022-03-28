# TODO: Modify this file to create a shell script that is able to use awk to go through a file
# formatted like pokemon.dat and provides a printed report in the following format (where your 
# script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Non-Legendary Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Defense: [VALUE]
# ======= END SUMMARY =======

# NOTE THAT YOU MUST USE AWK OR YOU WILL LOSE POINTS
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The averages must only be for non-legendary pokemon.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not
# necessarily be called pokemon.dat. However, you can assume that any file passed to this
# script will be formatted exactly the way pokemon.dat is formatted.

BEGIN{FS="\t"}
{
	# check for end of file
	if(NR!=1){
		# add hp into variable
		hp+=$6

		# add defense into variable
		defense+=$8

		# check for non-legendary pokemons
		if($(13)=="False"){
			# increment counter for non-legendary pokemon
			counter+=1
		}
	# increment counter for pokemons
	sum+=1
	}
}
END{
# print first line of report
print "======= SUMMARY OF POKEMON.DAT ======"

# print non-legendary line
print "   Total Non-Legendary Pokemon: " counter

# print average of hp line
print "   Avg. HP: " hp/sum

# print average of defense point line
print "   Avg. Defense: " defense/sum

# print end line of report
print "======= END SUMMARY ======="
}
