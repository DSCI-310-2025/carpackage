#' Count Unique Values
#'
#' Counts occurrences of each unique value in each column of the data frame.
#'
#' @param data A data frame.
#' @return A data frame with columns: Variable, Value, Count.
#'
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr group_by summarise arrange desc n
#' @importFrom rlang .data
#' @importFrom dplyr %>%
#'
#' @export
#'
#' @examples
#' df <- data.frame(
#'   A = c("x", "y", "x"),
#'   B = c("a", "a", "b")
#' )
#' count_unique_values(df)
count_unique_values <- function(data) {
  if (!is.data.frame(data)) {
    stop("❌ Input must be a data frame.")
  }

  data[] <- lapply(data, as.character)

  data %>%
    tidyr::pivot_longer(cols = dplyr::everything(), names_to = "Variable", values_to = "Value") %>%
    dplyr::group_by(.data$Variable, .data$Value) %>%
    dplyr::summarise(Count = dplyr::n(), .groups = "drop") %>%
    dplyr::arrange(.data$Variable, dplyr::desc(.data$Count))
}
