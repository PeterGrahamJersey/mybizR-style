#' Return function to interpolate a mybiz color palette
#'
#' @source \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @examples
#' \dontrun {
#'  mybiz_pal('hot')
#'  mybiz_pal('hot')(10)
#' }
mybiz_pal <- function(palette = "main", reverse = FALSE, ...) {
  mybiz_pal.validate(palette)
  pal <- mybiz_cols(mybiz_palettes[[palette]])
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}

#' Check if the named palette is actually in our dataset, print a warning
#' if not found.
mybiz_pal.validate <- function(palette) {
  if (!is.element(palette, names(mybiz_palettes))) {
    message(paste('Palette not found:', palette))
  }
}
