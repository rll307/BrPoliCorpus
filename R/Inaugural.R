# This file contains download functions for datasets


#' Download InauguralSpeeches Dataset
#'
#' Downloads the dataset from Google Drive and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_InauguralSpeeches()
#' @export
download_InauguralSpeeches <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=12xwXqB4nvhJH0d9YmrtV4yU1K3_ieNwV'
  df <- download_dataset(file_id)
  return(df)
}



