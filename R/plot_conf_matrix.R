# Register global vars for R CMD check
utils::globalVariables(c("Predicted_Label", "True_Label", "Count"))

#' Plot Confusion Matrix
#'
#' Generates a heatmap of the confusion matrix from actual and predicted labels.
#'
#' @param true_labels A factor vector of actual labels.
#' @param predicted_labels A factor vector of predicted labels.
#' @param title Optional title for the plot.
#'
#' @return A ggplot object representing the confusion matrix heatmap.
#' @importFrom ggplot2 ggplot aes geom_tile geom_text scale_fill_gradient labs theme_minimal
#' @importFrom caret confusionMatrix
#' @export
#'
#' @examples
#' true <- factor(c("yes", "no", "yes", "no", "yes"))
#' predicted <- factor(c("yes", "no", "no", "no", "yes"))
#' plot_conf_matrix(true, predicted)
plot_conf_matrix <- function(true_labels, predicted_labels, title = "Confusion Matrix") {
  # Ensure both are factors with the same levels
  common_levels <- union(levels(factor(true_labels)), levels(factor(predicted_labels)))
  true_labels <- factor(true_labels, levels = common_levels)
  predicted_labels <- factor(predicted_labels, levels = common_levels)
  
  cm <- caret::confusionMatrix(predicted_labels, true_labels)
  cm_df <- as.data.frame(cm$table)
  colnames(cm_df) <- c("True_Label", "Predicted_Label", "Count")
  
  ggplot2::ggplot(cm_df, ggplot2::aes(x = Predicted_Label, y = True_Label, fill = Count)) +
    ggplot2::geom_tile() +
    ggplot2::geom_text(ggplot2::aes(label = Count), color = "white", size = 5) +
    ggplot2::scale_fill_gradient(low = "lightblue", high = "blue") +
    ggplot2::labs(title = title, x = "Predicted Label", y = "True Label", fill = "Count") +
    ggplot2::theme_minimal()
}
