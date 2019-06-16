#' Access our colour palettes as hexcodes
#' 
#' @param palette which palette should be accessed
#' @param n number of colours to generate from palette
#' @param reverse should the order of colours be reversed?
#' 
#' @return If palette is NA, return the raw palette data. If n is NA, return 
#'     the hexcodes of colours in the data, otherwise return n colours interpolated
#'     from the chosen palette
#'
#' @export
our_palettes <- function(palette = NA, n = NA, reverse = F) {
  if (is.na(palette)) {
    return(our_palettes_raw)
  } else {
    if (is.na(n)) {
      pal <- our_colors(our_palettes_raw[[palette]])
      if (reverse) pal <- rev(pal)
      return(pal)
    } else {
      return(our_palettes_interpolator(palette, reverse)(n))
    }
  }
}
