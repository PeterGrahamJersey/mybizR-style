# ouRstyle

## Your colours and ggplot2 theme

ouRstyle provides a template allowing users to specify colours and colour palettes which are then built into a package of functions allowing them to be used in R. A plot theme is also provided that can be customised to reflect your brand / aesthetic.

* Colour palettes based on [Dr Simon Jackson's Corporate Colour Palettes'](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2).
* Horizontal plot theme approach from [ggthemes](https://github.com/jrnold/ggthemes/blob/master/R/economist.R).

## How To

* Copy/fork from this repo
* Update `./data-raw/colours.R` with your colours and desired prefix and run it
* Customise `./R/our_theme.R` to reflect how you want your plots to look
* Optional: replace every mention of 'our_' with a prefix you prefer
* Build the package (CMD + SHIFT + B)
* Share with others in your team, [Sharing Interal R Packages](https://support.rstudio.com/hc/en-us/articles/115000239587-Sharing-Internal-R-Packages)

## TO DO
* Add support for handling more fonts
* Add an easier way to configure theme elements (e.g. font sizes)