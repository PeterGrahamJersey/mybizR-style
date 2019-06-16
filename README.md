# ouRstyle

## Your colours and ggplot2 theme

ouRstyle provides a template allowing users to specify colours and colour palettes which are then built into a package of functions allowing them to be used in R. A plot theme is also provided that can be customised to reflect your brand / aesthetic.

* Colour palettes based on [Dr Simon Jackson's Corporate Colour Palettes'](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2).
* ggplot themes inspired by the [Storytelling With Data] (http://www.storytellingwithdata.com/) stlyle and a burning desire to get font sizes consistent in my plots.

## How To

* Fork from the repo
* Update `./data-raw/colours.R` with your colours and desired prefix and run it
* Optional: replace every mention of 'our_' in `./R/` with your desired prefix
* Build the package (CMD + SHIFT + B)
* Share with others + build on it!

## TO DO

* Expand `our_theme`
* Test functions and documentation
* v0.1 -> v1.0