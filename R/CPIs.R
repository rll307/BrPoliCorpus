# Este arquivo contém funções para baixar datasets


#' Baixar Dataset IndexFilesFloor
#'
#' Baixa o dataset do Google Drive e o importa como um dataframe.
#'
#' @return Um dataframe contendo o dataset.
#' @examples
#' df <- download_IndexFilesFloor()
#' @export
download_IndexFilesFloor <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=1unJzW1UaJwcn5YYhZ197hSF0YAOO3LR3'
  df <- download_dataset(file_id)
  return(df)
}



#' Baixar Dataset CPICovid_003_data
#'
#' Baixa o dataset do Google Drive e o importa como um dataframe.
#'
#' @return Um dataframe contendo o dataset.
#' @examples
#' df <- download_CPICovid_003_data()
#' @export
download_CPICovid_003_data <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=141P9cWBk6gE8J92j5sh5PIDcSTZ2CCq7'
  df <- download_dataset(file_id)
  return(df)
}



#' Baixar Dataset CPICovid_002_data
#'
#' Baixa o dataset do Google Drive e o importa como um dataframe.
#'
#' @return Um dataframe contendo o dataset.
#' @examples
#' df <- download_CPICovid_002_data()
#' @export
download_CPICovid_002_data <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=1KI8-xoQreSkQD0FvKjmgbQ0BMQCp_1Zl'
  df <- download_dataset(file_id)
  return(df)
}



#' Baixar Dataset CPICovid_001_data
#'
#' Baixa o dataset do Google Drive e o importa como um dataframe.
#'
#' @return Um dataframe contendo o dataset.
#' @examples
#' df <- download_CPICovid_001_data()
#' @export
download_CPICovid_001_data <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=1GCWwQ-Z7niezR45kEKcAdP7xe_vW-BK0'
  df <- download_dataset(file_id)
  return(df)
}



