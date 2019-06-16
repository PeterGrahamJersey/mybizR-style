#' Access our colour palettes as hexcodes
#' 
#' @param palette which palette should be accessed, should match a name from our_palettes_raw
#' @param n number of colours to generate from palette
#' @param reverse should the order of colours be reversed?
#' 
#' @return If palette is NA, return the raw palette data. If n is NA, return 
#'     the hexcodes of colours in the data, otherwise return n colours interpolated
#'     from the chosen palette
#' @examples
#'  our_palettes()
#'  our_palettes('default')
#'  our_palettes('default', reverse = TRUE)
#'  our_palettes('default', 10)
#'  our_palettes('default', 2)
#' @family access our colours
#' @export
our_palettes <- function(palette = NA, n = NA, reverse = FALSE) {
  if (is.na(palette)) {
    return(ouRstyle::our_palettes_raw)
  } else {
    if (is.na(n)) {
      pal <- ouRstyle::our_colours(ouRstyle::our_palettes_raw[[palette]])
      if (reverse) pal <- rev(pal)
      return(pal)
    } else {
      return(our_palettes_interpolator(palette, reverse)(n))
    }
  }
}
