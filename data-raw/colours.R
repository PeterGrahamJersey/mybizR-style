# Colour and palette method: https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

mybiz_colours <- c(
  # Based on PrismJS Tomorrow Night Theme
  # Doesn't accept short-form of hexcodes
  # Name,  Hexcode
  `purple` = '#cc99cd',
  `green` = '#7ec699',
  `yellow` = '#f8c555',
  `blue` = '#67cdcc',
  `orange` = '#f08d49',
  `grey` = '#999999'
)

mybiz_palettes <- list(
  # Name, Colour names
  `main`  = c('purple', 'green', 'yellow'),
  `cool`  = c('purple', 'blue', 'green'),
  `hot`   = c('yellow', 'orange')
)

devtools::use_data(mybiz_colours, mybiz_palettes, overwrite = T)
