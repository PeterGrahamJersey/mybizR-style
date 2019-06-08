#'  Function to extract mybiz colour hexcodes
#'
#'  @source \url{https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2}
#'  @param ... colour names in a comma separated or vector of strings
#'  @export
#'  @examples
#'  \dontrun{
#'    my_bix_colours
#'    mybiz_cols('green', 'blue', 'green')
#'  }
mybiz_cols <- function(...) {
  colours <- c(...)
  mybiz_cols.validate(colours)

  if (is.null(colours)) {
    return(mybiz_colours)
  }
  mybiz_colours[colours]
}

#' Check if the named colours are actually in our dataset, print a warning
#' if not found.
mybiz_cols.validate <- function(colours) {
  invalid_cols <- unique(colours[!is.element(colours, names(mybiz_colours))])
  if (length(invalid_cols) != 0) {
    message(paste('Colours not found:', paste0(invalid_cols, collapse = ', ')))
  }
}
