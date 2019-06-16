#' Extract hexcodes for our colours
#'
#' Returns a named vecotr of hexcodes for the specified colours.
#' Method from \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}.
#' 
#' @param \dots colour names in a comma separated or vector of strings
#'  
#' @return returns a named vector of hexcodes for the specified colours. If a colour is
#'  not in \code{our_colours_raw} will have NA in that position and returns a warning message.
#'      
#' @examples
#'  our_colours_raw
#'  our_colours()
#'  our_colours('green', 'blue', 'green')
#'  our_colours('not a colour', 'also not a colour', 'green')
#'  our_colors('blue')
#' @family access our colours
#' @export
our_colours <- function(...) {
  colours <- c(...)
  our_colours.validate(colours)

  if (is.null(colours)) {
    return(ouRstyle::our_colours_raw)
  }
  ouRstyle::our_colours_raw[colours]
}

#' @describeIn our_colours alias for \code{our_colours()}
#' @inheritParams our_colours
#'  
#' @export
our_colors <- function(...) {
  our_colours(...)
}

#' Error handling for our_colours
#' 
#' Check if the named colours are actually in our dataset, print a warning
#' if not found.
#' 
#' @param colours a vector of colour names as strings
#' 
#' @return None, will print a message if colour names aren't found in 
#' our_colours_raw.
#' 
#' @keywords internal
our_colours.validate <- function(colours) {
  invalid_cols <- unique(colours[!is.element(colours, names(ouRstyle::our_colours_raw))])
  if (length(invalid_cols) != 0) {
    message(paste('Colours not found:', paste0(invalid_cols, collapse = ', ')))
  }
}
