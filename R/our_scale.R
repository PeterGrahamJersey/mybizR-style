#' Discrete colour scale constructor for our colours
#'
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' 
#' @examples
#' \dontrun{
#'   ggplot(mtcars) + 
#'     geom_point(aes(x = mpg, 
#'                    y = wt, 
#'                    color = as.character(carb))) + 
#'     our_scale_color_d('hot')
#' }
#' 
#' @export
our_scale_colour_d <- function(palette = 'default', reverse = F, ...) {
  our_scale(palette = palette, reverse = reverse, discrete = T, colour = T, ...)
}

#' @inheritParams our_scale_colour_d
#' @describeIn our_scale_colour_d Alias for \code{our_scale_colour_d()}
#' @export
our_scale_color_d <- function(palette = 'default', reverse = F, ...) {
  our_scale_colour_d(palette = palette, reverse = reverse, ...)
}

#' Continuous colour scale constructor for our colours
#'
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @export
#' @examples
#' \dontrun{
#'   ggplot(mtcars) + 
#'     geom_point(aes(x = mpg, 
#'                    y = wt, 
#'                    color = wt)) + 
#'     our_scale_color_c('hot')
#' }
our_scale_colour_c <- function(palette = 'default', reverse = F, ...) {
  our_scale(palette = palette, reverse = reverse, discrete = F, colour = T, ...)
}

#' @describeIn our_scale_colour_c alias for \code{our_scale_colour_c()}
#' @inheritParams our_scale_colour_c
#' @export
our_scale_color_c <- function(palette = 'default', reverse = F, ...) {
  our_scale_colour_c(palette = palette, reverse = reverse, ...)
}

#' Discrete fill scale constructor for our colours
#'
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' 
#' @examples
#' \dontrun{
#'   ggplot(mtcars) + 
#'     geom_col(aes(x = reorder(rownames(mtcars), mpg), 
#'                  y = mpg, 
#'                  fill = as.character(carb))) +
#'     coord_flip() +             
#'     our_scale_fill_d('hot') +
#' }
#' 
#' @export
our_scale_fill_d <- function(palette = 'default', reverse = F, ...) {
  our_scale(palette = palette, reverse = reverse, discrete = T, colour = F, ...)
}

#' Continuous fill scale constructor for our colours
#'
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' 
#' @examples
#' \dontrun{
#'   ggplot(mtcars) + 
#'     geom_col(aes(x = reorder(rownames(mtcars), mpg), 
#'                  y = mpg, 
#'                  fill = mpg)) +
#'     coord_flip() +             
#'     our_scale_fill_c('hot') +
#' }
#' 
#' @export
our_scale_fill_c <- function(palette = 'default', reverse = F, ...) {
  our_scale(palette = palette, reverse = reverse, discrete = F, colour = F, ...)
}

#' Scale constructor for our colors
#'
#' @source Adapted from: \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param colour Boolean indicating whether this is a colour or fill scale
#' @param ... Additional arguments passed to discrete_scale(),
#'            scale_fill_gradientn(), or scale_colour_gradientn() used
#'            based on discrete and colour_or_fill
#' @keywords internal
our_scale <-  function(palette = 'default', reverse = F, discrete = T, colour = T, ...) {
  pal <- our_palettes_interpolator(palette = palette, reverse = reverse)
  pal_name <- paste0('our_', palette)
  if (discrete) {
    ggplot2::discrete_scale(ifelse(colour, 'colour', 'fill'), pal_name, palette = pal, ...)
  } else {
    if (colour) {
      ggplot2::scale_color_gradientn(colours = pal(256), pal_name, ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), pal_name, ...)
    }
  }
}
