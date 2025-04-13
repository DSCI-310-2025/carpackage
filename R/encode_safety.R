#' Encode the safety variable.
#'
#' @param x A character vector representing safety levels.
#' @return A numeric vector representing the safety encoding.
#'
#' @importFrom dplyr case_when
#' @examples
#' encode_safety(c("low", "med", "high", "2"))
#' # Returns: 1, 2, 3, 2
#'
#' @export
encode_safety <- function(x) {
  if (!is.character(x)) {
    stop("Input must be a character vector.")
  }

  out <- dplyr::case_when(
    x == "low"  ~ 1,
    x == "med"  ~ 2,
    x == "high" ~ 3,
    TRUE        ~ suppressWarnings(as.numeric(x))
  )

  return(as.numeric(out))
}
