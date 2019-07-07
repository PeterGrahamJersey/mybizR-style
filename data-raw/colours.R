# Colour and palette method: https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

our_colours_raw <- c(
  # Based on PrismJS Tomorrow Night Theme
  # Doesn't accept short-form hexcodes.
  # Name,  Hexcode
  `purple` = '#cc99cd',
  `green` = '#7ec699',
  `yellow` = '#f8c555',
  `blue` = '#67cdcc',
  `orange` = '#f08d49',
  `grey` = '#999999'
)

our_palettes_raw <- list(
  # Name, Colour names
  # Colour names should match names from `our_colours_raw`
  # 'default' is used as the default in our functions, so don't change the 
  # name unless you're updating this throughout!
  `default`  = c('purple', 'green', 'yellow'),
  # Other palettes, go wild:
  `cool`  = c('purple', 'blue', 'green'),
  `hot`   = c('yellow', 'orange')
)

usethis::use_data(our_colours_raw, our_palettes_raw, overwrite = T)
