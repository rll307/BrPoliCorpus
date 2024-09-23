# This file contains download functions for datasets


#' Download CPICovid_001_data Dataset
#'
#' Downloads the dataset from Google Drive and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_001_data()
#' @export
download_CPICovid_001_data <- function() {
  file_id <- 'https://drive.google.com/uc?id=1GCWwQ-Z7niezR45kEKcAdP7xe_vW-BK0'
  df <- download_dataset(file_id)
  return(df)
}



#' Download CPICovid_002_data Dataset
#'
#' Downloads the dataset from Google Drive and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_002_data()
#' @export
download_CPICovid_002_data <- function() {
  file_id <- 'https://drive.google.com/uc?id=1KI8-xoQreSkQD0FvKjmgbQ0BMQCp_1Zl'
  df <- download_dataset(file_id)
  return(df)
}



#' Download CPICovid_003_data Dataset
#'
#' Downloads the dataset from Google Drive and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_003_data()
#' @export
download_CPICovid_003_data <- function() {
  file_id <- 'https://drive.google.com/uc?id=141P9cWBk6gE8J92j5sh5PIDcSTZ2CCq7'
  df <- download_dataset(file_id)
  return(df)
}



