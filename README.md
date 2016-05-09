# PanScoPapers

*What's here?*

A ruby script that finds addresses in Scotland from the PanamaPapers dataset (https://offshoreleaks.icij.org/pages/database)

*What did I learn?*

I couldn't just use postcodes to filter addresses as that was too permissive, I had to use the country codes too. 

The data is decent, but it could still do with some cleaning. I found there were a fair few addresses that were definitely in the UK but were coming up as being in Poland. 

It would be worthwhile modifying the script to find these disrepancies, ie, addresses in the UK but with the wrong country code.
