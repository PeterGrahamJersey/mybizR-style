#' Discrete colour scale constructor for mybiz colours
#'
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @export
scale_color_mybiz_d <- function(palette = 'main', reverse = F, ...) {
  scale_mybiz(palette = palette, reverse = reverse, discrete = T, colour = T, ...)
}

#' Alias for discrete colour scale constructor for mybiz colours
#'
#' @inheritParams scale_color_mybiz_d
#' @export
scale_colour_mybiz_d <- function(palette = 'main', reverse = F, ...) {
  scale_color_mybiz_d(palette = palette, reverse = reverse, ...)
}

#' Continuous colour scale constructor for mybiz colours
#'
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @export
#' @examples
#' \dontrun {
#'   library(ggplot2)
#'   ggplot(mtcars) + 
#'     geom_point(aes(x = mpg, 
#'                    y = wt, 
#'                    color = wt)) + 
#'     scale_color_mybiz_c('hot')
#' }
scale_color_mybiz_c <- function(palette = 'main', reverse = F, ...) {
  scale_mybiz(palette = palette, reverse = reverse, discrete = F, colour = T, ...)
}

#' Alias for continuous colour scale constructor for mybiz colours
#'
#' @inheritParams scale_color_mybiz_c
#' @export
scale_colour_mybiz_c <- function(palette = 'main', reverse = F, ...) {
  scale_color_mybiz_c(palette = palette, reverse = reverse, ...)
}

#' Discrete fill scale constructor for mybiz colours
#'
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @export
scale_fill_mybiz_d <- function(palette = 'main', reverse = F, ...) {
  scale_mybiz(palette = palette, reverse = reverse, discrete = T, colour = F, ...)
}

#' Continuous fill scale constructor for mybiz colours
#'
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to the scale constructor
#' @export
scale_fill_mybiz_c <- function(palette = 'main', reverse = F, ...) {
  scale_mybiz(palette = palette, reverse = reverse, discrete = F, colour = F, ...)
}

#' Scale constructor for mybiz colors
#'
#' @source Adapted from: \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#' @param palette Character name of palette in mybiz_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param colour Boolean indicating whether this is a colour or fill scale
#' @param ... Additional arguments passed to discrete_scale(),
#'            scale_fill_gradientn(), or scale_colour_gradientn() used
#'            based on discrete and colour_or_fill
#'
scale_mybiz <-  function(palette = 'main', reverse = F, discrete = T, colour = T, ...) {
  pal <- mybiz_pal(palette = palette, reverse = reverse)
  if (discrete) {
    ggplot2::discrete_scale(ifelse(colour, 'colour', 'fill'), paste0('mybiz_', palette), palette = pal, ...)
  } else {
    if (colour) {
      ggplot2::scale_color_gradientn(colours = pal(256), paste0('mybiz_', palette), ...)
    } else {
      ggplot2::scale_fill_gradientn(colours = pal(256), paste0('mybiz_', palette), ...)
    }
  }
}
