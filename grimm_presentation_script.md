# Grimm Project Presentation – Script

## Introduction - About 
- Our team came together to explore gender portrayal across multiple editions of the classic Grimm’s Fairytales (primarily comparing the 1812-1815 and 1819-1857 editions) 
- This was not our original focus! As we worked through the texts in the few weeks, we allowed our research questions to evolve or be dropped until we reached a final consensus in asking: 
     - Are the descriptors for women generally more positive or negative compared to men? Are women or men given a more active role? 
     - How does the association between fairy tales and marketing towards children lead to a shift in content within the stories, especially in regards to gender portrayal? 
## Our Research
- There are many translations of the original German collection, so deciding on what editions we wanted to use was our first big concern. Provided by Dr. Birnbaum, we used the collection translated and transcribed by Professor D.L. Ashliman from our very own University of Pittsburgh. 
- Ashliman’s corpus is extensive (if not slightly overwhelming) and the website is definitely dated, so our next big task was choosing which stories out of the 210 we wanted to tackle for this project. If one were to continue this project without the constraints of this course, a more appropriate approach would be to markup and analyze the entire corpus, but obviously we were NOT going to be doing THAT 
- Initially, our research focused on how-well-grimm the fairytales were (when we realized this topic would be going nowhere with the limited number of stories we could handle, we scrapped it). Nonetheless, we chose our 12 tales under the criteria of: 
     - Having possible dark undertones or themes 
     - Two translated editions were available 
- This is what led us to the stories we’ve analyzed! (as shown here) 
## Methodology 
- If you’ve followed our GitHub, you’ve likely seen our markup methodology schema. 
- We wanted to mark both actions and descriptors, but those two elements would have different attributes that marked them accordingly 
     - Both were marked for gender (duh)
     - Descriptors: type (positive, negative, neutral) 
     - Actions: agency (active, passive) and willingness (eager, neutral, hesitant) 
- Early on, Dr. Birnbaum mentioned the caveat of having multiple taggers and maintaining consistency. Analytical markup is inherently interpretive and therefore partially subjective, but we wanted to ensure that the markup was consistent above all else. Each person was given 3 tales to read and markup (both editions, 6 files overall) and another person would check their markup for any errors, inconsistencies, or if we wanted to argue about whether or not ‘old’ is a negative or neutral descriptor. 
## The Reading View 
- Our stories have been marked up and checked rigorously (apologies to Mason for the grief we caused him in ignoring his reminders to do so…for some time…) 
- Now that our stories were marked up and validated against the schema I created, our next big task was deciding how we wanted to display our stories on the website. 
- The reading view is officially unofficially Ben’s baby, but unfortunately he is under lockdown far away in Zoom land, so I will do the best of my abilities to explain how the heck he got our big ole collection of stories into this reading view. 
- The page uses AJAX, which allows us to load new information onto the page without refreshing it so users can choose their stories from the selection box; we mirrored the linguistic style of the Ellipse site because we liked how user friendly it felt! 
= All of the stories are stored on the web server, and when you click the corresponding button, AJAX retrieves and loads them 
- Both single and dual display is actually just one flexbox with stretch and shrink upon the button presses via JavaScript 
- The actual highlights of the markup were done by Ben and I creating a XSLT stylesheet that used hover elements so that we could showcase each of our attributes per element without having overlapping colors (instead of having colors for attributes and elements, we were able to narrow it down to just the elements divided by gender!) (Ben and I were very proud of this hover feature, and he cleaned it up on the actual site so that it doesn’t disturb the text too much) 
- Hopefully I’ve done all of Ben’s work justice in my explanation! 
## Analysis 
- The dreaded SVG…we were fortunate enough to have gotten this far ahead with our project that the last little bits we needed to do for this presentation aligned perfectly with our final unit. 
- We were all…tired…to say the least 
!!!Wait for the updated SVG!!!

