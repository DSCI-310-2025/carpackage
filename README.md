
<!-- README.md is generated from README.Rmd. Please edit that file -->

# carpackage

An R package for cleaning and preparing categorical car data for machine
learning classification tasks.

<!-- badges: start -->

[![R-CMD-check](https://github.com/DSCI-310-2025/carpackage/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/carpackage/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

The `carpackage` provides a suite of utility functions designed to
support preprocessing of car evaluation datasets, specifically those
containing ordinal categorical variables. It was built as part of a DSCI
310 project on predicting vehicle safety using k-Nearest Neighbors
(kNN). The package includes tools for:

- Cleaning missing and duplicate data
- Encoding ordinal variables
- Checking dataset structure before modeling
- Perform kNN analysis

These tools were used in an analysis of the [UCI Car Evaluation
Dataset](https://archive.ics.uci.edu/dataset/19/car+evaluation), where
we attempted to predict car safety levels using buying price,
maintenance cost, number of passengers, and other factors.

## Key Features

- `check_data_quality()` – Cleans missing values and duplicate rows
- `encode_car_data()` – Converts categorical car attributes into ordinal
  numeric codes
- `summarize_car_data()` – Summarizes distributions and highlights
  potential imbalance
- `plot_encoded_distributions()` – Visualizes encoded feature
  distributions for quick EDA \| `run_knn_model()` \| Trains and
  predicts using a kNN classifier \| \| `evaluate_knn_performance()` \|
  Calculates accuracy and shows a confusion matrix \| \|
  `plot_confusion_matrix()` \| Creates a heatmap visualization of
  confusion matrix \|

All functions include **graceful error handling** and are optimized for
clean pipelines in ML tasks.

------------------------------------------------------------------------

## Where It Fits in the R Ecosystem

### Similar Packages

| Package | Purpose | How `carpackage` Differs |
|----|----|----|
| [`janitor`](https://github.com/sfirke/janitor) | General-purpose data cleaning (names, duplicates, empty rows) | `carpackage` is more **domain-specific** (cars) and includes **encoding** tools for ML |
| [`recipes`](https://tidymodels.github.io/recipes/) | Full-featured ML preprocessing pipelines | More complex; `carpackage` is **simpler**, easier to use for beginners, and **targets ordinal categorical data** |
| [`forcats`](https://forcats.tidyverse.org/) | Tools for factor manipulation | Useful but **does not handle ordinal-to-numeric encoding** as directly as `carpackage` does |
| [`caret`](https://topepo.github.io/caret/) | End-to-end ML workflows | Powerful, but often **overkill** for lightweight preprocessing or classroom projects |

------------------------------------------------------------------------

### 🧭 When to Use `carpackage`

Use this package when you’re working with **categorical car data**,
especially: - Student projects or teaching datasets like UCI’s Car
Evaluation - Conducts kNN or distance-based analysis - Needing quick
summaries and visualizations of encoded ordinal features

It’s a lightweight, easy-to-understand toolset designed for R users who
want **just enough** preprocessing without diving into full ML
pipelines.

## Installation

You can install the development version of carpackage like so:

``` r
# install.packages("devtools")
devtools::install_github("your-username/carpackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(carpackage)
## check missing and duplicate values in dataset
df <- data.frame(
  make = c("Toyota", "Honda", NA, "Toyota", "Honda"),
  year = c(2010, 2012, 2011, 2010, 2012),
  price = c(5000, 7000, 6500, 5000, 7000)
)

nan_and_duplicates_summary <- check_data_quality(df)
#> 🔍 Missing values found: 1
#> 🔁 Duplicate rows found: 2
#> ✅ Cleaning completed. Returned cleaned dataframe.
nan_and_duplicates_summary
#>     make year price
#> 1 Toyota 2010  5000
#> 2  Honda 2012  7000
```

## Future Goals

This package will update: -Newer and improved functions for car data
analysis -More comprehensive test cases for each Stay tuned!
