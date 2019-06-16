#' Create a discrete or continuous scale using our colours
#' 
#' @param palette Character name of palette in our_palettes_raw
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @examples 
#'   library(ggplot2)
#'   
#'   # Discrete Colour scale
#'   ggplot(mtcars) + 
#'     geom_point(aes(x = mpg, 
#'                    y = wt, 
#'                    color = as.character(carb))) + 
#'     our_scale_color_d('default')
#'
#'   # Continuous Colour Scale
#'   ggplot(mtcars) + 
#'     geom_point(aes(x = mpg, 
#'                    y = wt, 
#'                    color = wt)) + 
#'     our_scale_color_c('default')
#'     
#'   # Discrete Fill Scale
#'   ggplot(mtcars) + 
#'     geom_col(aes(x = reorder(rownames(mtcars), mpg), 
#'                  y = mpg, 
#'                  fill = as.character(carb))) +
#'     coord_flip() +             
#'     our_scale_fill_d('default') +
#'     facet_wrap(~as.character(carb), scales='free_y')
#'     
#'   # Continuous fill scale  
#'   ggplot(mtcars) + 
#'     geom_col(aes(x = reorder(rownames(mtcars), mpg), 
#'                  y = mpg, 
#'                  fill = mpg)) +
#'     coord_flip() +             
#'     our_scale_fill_c('default')
#' @family access our colours
#' @name our_scale
NULL

#' @describeIn our_scale discrete colour scale
#' @inheritParams our_scale
#' @export
our_scale_colour_d <- function(palette = 'default', reverse = F, ...) {
  our_scale_constructor(palette = palette, reverse = reverse, discrete = T, colour = T, ...)
}

#' @describeIn our_scale alias for discrete colour scale
#' @inheritParams our_scale
#' @export
our_scale_color_d <- function(palette = 'default', reverse = F, ...) {
  ouRstyle::our_scale_colour_d(palette = palette, reverse = reverse, ...)
}

#' @describeIn our_scale continuous colour scale
#' @inheritParams our_scale
#' @export
our_scale_colour_c <- function(palette = 'default', reverse = F, ...) {
  our_scale_constructor(palette = palette, reverse = reverse, discrete = F, colour = T, ...)
}

#' @describeIn our_scale alias for continuous colour scale
#' @inheritParams our_scale
#' @export
our_scale_color_c <- function(palette = 'default', reverse = F, ...) {
  ouRstyle::our_scale_colour_c(palette = palette, reverse = reverse, ...)
}

#' @describeIn our_scale discrete fill scale
#' @inheritParams our_scale
#' @export
our_scale_fill_d <- function(palette = 'default', reverse = F, ...) {
  our_scale_constructor(palette = palette, reverse = reverse, discrete = T, colour = F, ...)
}

#' @describeIn our_scale continuous fill scale
#' @inheritParams our_scale
#' @export
our_scale_fill_c <- function(palette = 'default', reverse = F, ...) {
  our_scale_constructor(palette = palette, reverse = reverse, discrete = F, colour = F, ...)
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
our_scale_constructor <-  function(palette = 'default', reverse = F, discrete = T, colour = T, ...) {
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
