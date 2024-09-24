# Este arquivo contém funções para baixar datasets


#' Baixar Dataset InauguralSpeeches
#'
#' Baixa o dataset do Google Drive e o importa como um dataframe.
#'
#' @return Um dataframe contendo o dataset.
#' @examples
#' df <- download_InauguralSpeeches()
#' @export
download_InauguralSpeeches <- function() {
  file_id <- 'https://drive.google.com/uc?export=download&id=12xwXqB4nvhJH0d9YmrtV4yU1K3_ieNwV'
  df <- download_dataset(file_id)
  return(df)
}



