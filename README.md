# Grimm's Fairy Tales

(Link to website: [http://grimm-tales.obdurodon.org/methodology.xhtml](http://grimm-tales.obdurodon.org/methodology.xhtml)

## Our research questions

As our project develops, we anticipate the creation of new or more specific reseach questions.
These are the questions that are currently facilitating our research:


- Are the descriptors for women generally more positive or negative compared to men? Are women or men given a more active role?
- How does the association between the fairy tales and marketing towards children 
lead to a shift in content within the stories? (Use this question when analyzing the findings of the second question)

## Our corpus
Since there are many translations and editions of the Grimm's Fairytales, 
we have decided to use one source for our research. The collection, included below,
was compiled by D. L. Ashliman, who was a professor at The University of Pittsburgh.
His site allows us to view English translations of many of the works, in addition to 
offering a comparison between the 1812 and 1857 editions.
`https://sites.pitt.edu/~dash/grimmtales.html`

## Our stories
Considering the scope and timeline of this project, we have decided to limit our research to
a subset of the stories. Included are the stories we are investigating:

- Little Red Riding Hood
- Rumplestiltskin
- The Robber Bridegroom
- Frau Holle
- Rapunzel
- Hansel and Grettle
- Sleeping Beauty
- Snow White
- The Singing Bone
- Girl Without Hands
- Hans-my-hedgehog
- Frog King

## Markup Methodology

| Elements  |  Attributes |  Attribute Values |
|---|---|---|
| Descriptor  | Type, Gender  | (Positive, Negative, Neutral) / (Female, Male)  |
| Action  | Agency, Gender, Willingness  | (Active, Passive) / (Female, Male) / (Eager, Neutral, Hesitent)  |
| Empty  | Happy ending  |  (True, False) |

`<descriptor type= "positive | negative | neutral" gender= "female | male"`

`<action agency= "active | passive" gender= "female | male" willingness= "eager | neutral | hesitent">`

`<empty happy_ending= "true | false">`

| Descriptor Example|
|---|
| `<description type="negative" gender="female">Stupid goose,"</description>`

| Action Example |
|---|
| `<action agency="active" gender="male" willingness="eager">Hansel took his little sister by the hand.</action>`

| empty happy_endings Example |
|---|
| `<empty happy_ending="true">Now all their cares were at an end, and they lived happily together.</empty>`

| Metadata Elements |
|---|
| Translator  |
| Year `1812 or 1857`  |
| Source  |
