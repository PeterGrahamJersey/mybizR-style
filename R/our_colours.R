#'  Extract hexcodes for our colours
#'
#'  @param ... colour names in a comma separated or vector of strings
#'  @examples {
#'    our_colours_raw
#'    our_colours('green', 'blue', 'green')
#'  }
#'  @source \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#'  @export
our_colours <- function(...) {
  colours <- c(...)
  our_cols.validate(colours)

  if (is.null(colours)) {
    return(our_colours_data)
  }
  mybiz_colours[colours]
}

#' @describeIn our_colours Alias for \code{our_colours()}
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
our_cols.validate <- function(colours) {
  invalid_cols <- unique(colours[!is.element(colours, names(our_colours_raw))])
  if (length(invalid_cols) != 0) {
    message(paste('Colours not found:', paste0(invalid_cols, collapse = ', ')))
  }
}
