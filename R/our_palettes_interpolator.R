#' Generates a function to interpolate our color palette.
#'
#' @source \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @return Returns a function that takes argument n where n is the number of colours to interpolate.
#' @examples \dontrun{
#'  our_palettes_interpolator('default')
#'  our_palettes_interpolator('default')(10)
#'  }
#' @keywords internal
our_palettes_interpolator <- function(palette = "main", reverse = FALSE, ...) {
  our_palettes_interpolator.validate(palette)
  pal <- ouRstyle::our_colors(ouRstyle::our_palettes_raw[[palette]])
  if (reverse) pal <- rev(pal)
  grDevices::colorRampPalette(pal, ...)
}

#' Error handling for our_palettes_interpolator
#' 
#' Check if the named palette is actually in our dataset, print a warning
#' if not found.
#' @param palette string, should match the name of a palette from \code{our_palettes_raw}
#' 
#' @return None, will print a message if palette not found.
#' 
#' @keywords internal
our_palettes_interpolator.validate <- function(palette) {
  if (!is.element(palette, names(ouRstyle::our_palettes_raw))) {
    message(paste('Palette not found:', palette))
  }
}