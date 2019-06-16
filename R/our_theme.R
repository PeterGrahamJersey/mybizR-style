#' Accessing our custom ggplot2 theme
#' 
#' @param base_size passed to base theme (e.g. \code{theme_minimal()})
#' @param base_family passed to base theme
#' @param horizontal boolean, if true then we leave only vertical grid lines,
#'   or vice versa
#' @examples
#'   library(ggplot2)
#'   
#'   ggplot(mtcars) +
#'   geom_point(aes(x = mpg,
#'                  y = wt)) +
#'   facet_grid(vs~cyl) +
#'   labs(title = 'This is the Title',
#'        subtitle = 'This is the Subtitle',
#'        caption = 'This is the caption') +
#'   our_theme()
#' @export
our_theme <- function(base_size = 11, base_family = 'sans', horizontal = T) {
  thm <- our_custom_theme(base_size = base_size, base_family = base_family)
  # Show only the y grid if it's a horizontal plot and vice versa
  # Horizontal idea from:
  # https://github.com/jrnold/ggthemes/blob/master/R/economist.R
  if (horizontal) {
    thm <- thm + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
  } else {
    thm <- thm + ggplot2::theme(panel.grid.major.y = ggplot2::element_blank())
  }
  # Return the theme:
  thm
}

#' Out custom ggplot 2 theme.
#' 
#' Choose a base theme from \url{https://ggplot2.tidyverse.org/reference/ggtheme.html}
#' that's as close as possible to your desired look. Then adjust the custom
#' elements as required to 
#' 
#' @param base_size passed to the selected base theme
#' @param base_family passed to the selected base theme
#' @keywords internal
our_custom_theme <- function(base_size = 11, base_family = 'sans') {
    # Base Theme - choose the closest ggplot2 theme to your style and work from that.
    ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    # Custom Elements -----------------------
    # for an idea of what you can customise run: theme_grey
    # or: ?theme
    ggplot2::theme(axis.title.x = ggplot2::element_text(hjust = 0),
          axis.title.y = ggplot2::element_text(hjust = 1),
          panel.grid.minor = ggplot2::element_blank(),
          plot.caption = ggplot2::element_text(hjust = 0),
          strip.text = ggplot2::element_text(hjust = 0))
    # -------------------------------------------
}