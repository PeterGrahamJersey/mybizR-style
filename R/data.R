#' Our colours.
#'
#' @format A named vector of colours.
#' \describe{
#'  \item{Names}{Colour names}
#'  \item{Values}{Hexcodes}
#' }
#' @examples {
#'  our_colours_raw
#' }
"our_colours_raw"

#' Our palettes.
#'
#' @format A list of colour palettes.
#' \describe{
#'  \item{Names}{Palette name}
#'  \item{Values}{Vector of colour names in this palette. Should match names in \code{our_colours_raw.}}
#' }
#' @examples {
#'  our_palettes_raw
#'  our_colours(our_palettes_raw['main'])
#' }
"our_palettes_raw"
