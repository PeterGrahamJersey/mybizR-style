#' Customisable ggplot2 theme
#' 
#' @param base_size
#' @param base_family
#' @param horizontal Boolean
#' @export
#' @examples {
#'   ggplot(mtcars) +
#'   geom_point(aes(x = mpg,
#'                  y = wt)) +
#'   facet_grid(vs~cyl) +
#'   theme_mybiz() +
#'   labs(title = 'This is the Title',
#'        subtitle = 'This is the Subtitle',
#'        caption = 'This is the caption')
#' }
theme_mybiz <- function(base_size = 11, base_family = 'sans', horizontal = T) {
  thm <- 
    # Base Theme
    theme_minimal(base_size = base_size, base_family = base_family) +
    # Customised Elements
    theme(axis.title.x = element_text(hjust = 0),
          axis.title.y = element_text(hjust = 1),
          panel.grid.minor = element_blank(),
          plot.caption = element_text(hjust = 0),
          strip.text = element_text(hjust = 0))

  # Horizontal idea taken from:
  # https://github.com/jrnold/ggthemes/blob/master/R/economist.R
  if (horizontal) {
    thm <- thm + theme(panel.grid.major.x = element_blank())
  } else {
    thm <- thm + theme(panel.grid.major.y = element_blank())
  }
  
  thm
}