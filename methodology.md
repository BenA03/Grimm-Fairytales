# Grimm Fairytales
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
`<description type="negative" gender="female">Stupid goose,"</description>`

| Action Example |
|---|
`<action agency="active" gender="male" willingness="eager">Hansel took his little sister by the hand.</action>`

| empty happy_endings Example |
|---|
`<empty happy_ending="true">Now all their cares were at an end, and they lived happily together.</empty>`

| Metadata Elements |
|---|
| Translator  |
| Year  |
| Source  |
