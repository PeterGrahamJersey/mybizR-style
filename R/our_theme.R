#' Our ggplot2 theme
#' 
#' @param base_size passed to base theme (e.g. \code{theme_minimal()})
#' @param base_family passed to base theme
#' @param horizontal boolean
#' @export
#' @examples {
#'   ggplot(mtcars) +
#'   geom_point(aes(x = mpg,
#'                  y = wt)) +
#'   facet_grid(vs~cyl) +
#'   labs(title = 'This is the Title',
#'        subtitle = 'This is the Subtitle',
#'        caption = 'This is the caption') +
#'   our_theme()
#' }
our_theme <- function(base_size = 11, base_family = 'sans', horizontal = T) {
  thm <- 
    # Base Theme - choose the closest ggplot2 theme to your style and work from that.
    theme_minimal(base_size = base_size, base_family = base_family) +
    
    # Customised Elements -----------------------
    # for an idea of what you can customise run: theme_grey
    # or: ?theme
    theme(axis.title.x = element_text(hjust = 0),
          axis.title.y = element_text(hjust = 1),
          panel.grid.minor = element_blank(),
          plot.caption = element_text(hjust = 0),
          strip.text = element_text(hjust = 0))
    # -------------------------------------------
  
  
  # Show only the y grid if it's a horizontal plot and vice versa
  # Horizontal idea from:
  # https://github.com/jrnold/ggthemes/blob/master/R/economist.R
  if (horizontal) {
    thm <- thm + theme(panel.grid.major.x = element_blank())
  } else {
    thm <- thm + theme(panel.grid.major.y = element_blank())
  }
  
  # Return the theme:
  thm
}