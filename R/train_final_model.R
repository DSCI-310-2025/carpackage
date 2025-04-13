#' Train final kNN model using caret
#'
#' Trains a k-Nearest Neighbors (kNN) classification model with the specified number of neighbors (`k`)
#' using the `caret` package.
#'
#' @param train_x A data frame or matrix of predictor variables.
#' @param train_y A factor vector of class labels for training.
#' @param best_k An integer specifying the optimal number of neighbors to use.
#'
#' @return A `caret` model object of class `train`.
#' @export
#' @importFrom caret train trainControl
#' @examples
#' \dontrun{
#' library(caret)
#' library(kknn)  # Needed because caret uses knn3 internally
#' set.seed(123)
#' df <- data.frame(x1 = rnorm(50), x2 = rnorm(50))
#' y <- factor(sample(c("yes", "no"), 50, replace = TRUE))
#' model <- train_final_model(df, y, best_k = 5)
#' }
train_final_model <- function(train_x, train_y, best_k) {
  if (!is.numeric(best_k) || is.na(best_k) || length(best_k) != 1) {
    stop("best_k must be a single numeric value.")
  }

  model <- caret::train(
    train_x, train_y, method = "knn",
    trControl = caret::trainControl(method = "none"),
    tuneGrid = data.frame(k = best_k)
  )
  return(model)
}
