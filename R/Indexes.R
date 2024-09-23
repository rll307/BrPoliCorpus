#' Download and Import Dataset
#'
#' Downloads a dataset from a specified URL and imports it as a data frame.
#'
#' @param url The URL of the dataset.
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_dataset("https://example.com/data.csv")
#' @export
download_dataset <- function(url) {
  temp_file <- tempfile(fileext = ".csv")
  if (grepl("drive.google.com", url)) {
    url <- gsub("file/d/", "uc?export=download&id=", url)
    url <- gsub("/view.*", "", url)
  }
  httr::GET(url, httr::write_disk(temp_file, overwrite = TRUE))
  df <- readr::read_csv(temp_file)
  return(df)
}
#'
#'#' Download and Import Multiple CSV Files
#'
#' Downloads six CSV files from specified Google Drive URLs and imports them as data frames into the specified environment.
#'
#' @param url1 The URL of the first dataset.
#' @param url2 The URL of the second dataset.
#' @param url3 The URL of the third dataset.
#' @param url4 The URL of the fourth dataset.
#' @param url5 The URL of the fifth dataset.
#' @param url6 The URL of the sixth dataset.
#' @param names A vector of names for the data frames.
#' @param env The environment where the data frames will be created. Defaults to the global environment.
#' @examples
#' download_index(
#'   "https://drive.google.com/uc?export=download&id=1FKdY0fQLyClxFALYuBl-t-JU7PPojX0u",
#'   "https://drive.google.com/uc?export=download&id=13ZhnyjZv_vfy20i_z7Mlgj30NkOOZF-a",
#'   "https://drive.google.com/uc?export=download&id=1LGxgtABI01PcWhgCqbOucb-PV6jJSSWA",
#'   "https://drive.google.com/uc?export=download&id=1O0g1iN1dH-mx9mStFNmPtjn1tFZh5uxi",
#'   "https://drive.google.com/uc?export=download&id=1E09VqeMx6eRVUwfJHI06cxiyxvZbvCo1",
#'   "https://drive.google.com/uc?export=download&id=1dhpEzzUNm4Eufs2v3XIbG8sv6AwPXonm",
#'   names = c(
#' "IndexFunctions", 
#' "IndexCommittees",
#'  "IndexCPI", 
#' "IndexFilesFloor", 
#' "IndexInaugural",
#' "IndexProposals")
#' )
#' @export
download_index <- function(
    url1, url2, url3, url4, url5, url6,
    names = c("IndexFunctions", 
              "IndexCommittees",
              "IndexCPI", 
              "IndexFilesFloor", 
              "IndexInaugural", 
              "IndexProposals"),
    env = .GlobalEnv) {
  
  # Define the URLs and names
  urls <- c(
    "https://drive.google.com/uc?export=download&id=1FKdY0fQLyClxFALYuBl-t-JU7PPojX0u",
    "https://drive.google.com/uc?export=download&id=13ZhnyjZv_vfy20i_z7Mlgj30NkOOZF-a",
    "https://drive.google.com/uc?export=download&id=1LGxgtABI01PcWhgCqbOucb-PV6jJSSWA",
    "https://drive.google.com/uc?export=download&id=1O0g1iN1dH-mx9mStFNmPtjn1tFZh5uxi",
    "https://drive.google.com/uc?export=download&id=1E09VqeMx6eRVUwfJHI06cxiyxvZbvCo1",
    "https://drive.google.com/uc?export=download&id=1dhpEzzUNm4Eufs2v3XIbG8sv6AwPXonm")
  
  # Check if the number of names matches the number of URLs
  if (length(urls) != length(names)) {
    stop("The number of URLs and names must be the same.")
  }
  
  # Download and import datasets
  dfs <- lapply(urls, download_dataset)
  
  # Assign names to the data frames
  names(dfs) <- names
  
  # Place data frames into the specified environment
  list2env(dfs, envir = env)
}
