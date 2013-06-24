Just a basic webapp using Shiny.

A few key points first:
  You'll have to change the directory of the csv in line 4 of both ui.R and server.R to match where the yelp_ads_new.csv
  file ends up.
  
Ordinarily you could simply deploy it locally by cloning this repo and run: R -e "shiny::runApp('yelp')", but it uses 
the csv which is outside of R.

After that though, you may either run the above command or enter R yourself, and enter: runApp('~/yelp')

You'll find this app running at http://localhost:8100/
  
To do any of this:you need to have R installed, and Shiny (you can do that via install.packages('shiny') )
