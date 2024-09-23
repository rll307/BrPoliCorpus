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

#' Download Committees_016_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_016_data()
#' @export
download_Committees_016_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1gPVpSziH0LTSK5xiuP5D8t5D1pzayqhT'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_015_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_015_data()
#' @export
download_Committees_015_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1V2M9HSZxNQDGEww1F6z2SeU9Ccr9uT0Q'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_014_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_014_data()
#' @export
download_Committees_014_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=12sh2Oxe71zGPg1WVMxhdJ6IONUGXhDYB'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_013_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_013_data()
#' @export
download_Committees_013_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1pdMHPxbyNn38urRTIbUBjunyr_dJqSAM'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_012_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_012_data()
#' @export
download_Committees_012_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Ad1y2L0By5NrPb1OXKmA887iN5zs2GEO'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_011_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_011_data()
#' @export
download_Committees_011_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1LK6BGcWxuRQtqpPAZzgHNJZ2vPxmg5qd'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_010_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_010_data()
#' @export
download_Committees_010_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1bIXcYZ5EoUNE0Xq-4LmDV-dsimA3qhcg'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_009_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_009_data()
#' @export
download_Committees_009_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=10yTykx3jTH1TG01tbLS46gxrgtI6FNUy'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_008_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_008_data()
#' @export
download_Committees_008_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1A4G-QIrCK1fKSUfR5nbCe9olF-APxFui'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_007_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_007_data()
#' @export
download_Committees_007_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=17M8BcyTvOhR0eJdAg1rf0tv-_ZklJ9JP'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_006_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_006_data()
#' @export
download_Committees_006_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1XX8RA38mqKiJHRfMBxq_ZBeVwewWKHmv'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_005_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_005_data()
#' @export
download_Committees_005_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1_bDUKVgd1HbsFokUsDMKdYNCyH3uJ9Q3'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_004_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_004_data()
#' @export
download_Committees_004_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1pDxd-Y0GMHyklluUHcQAFF_yHu8DoujB'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_003_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_003_data()
#' @export
download_Committees_003_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1U-g_XX5r9uGX3Ma95H-r9uKthI6L-vAx'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_002_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_002_data()
#' @export
download_Committees_002_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1xjBW0Ann6ggRk6Kua8OMT6upnuZqYhXa'
  df <- download_dataset(url)
  return(df)
}

#' Download Committees_001_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Committees_001_data()
#' @export
download_Committees_001_data <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1DON1phWSNkCqogAI1rzy47ob3wV6egrw'
  df <- download_dataset(url)
  return(df)
}

#' Download CPICovid_001_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_001_data()
#' @export
download_CPICovid_001_data <- function() {
  url <- 'https://drive.google.com/uc?id=1GCWwQ-Z7niezR45kEKcAdP7xe_vW-BK0'
  df <- download_dataset(url)
  return(df)
}

#' Download CPICovid_002_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_002_data()
#' @export
download_CPICovid_002_data <- function() {
  url <- 'https://drive.google.com/uc?id=1KI8-xoQreSkQD0FvKjmgbQ0BMQCp_1Zl'
  df <- download_dataset(url)
  return(df)
}

#' Download CPICovid_003_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_CPICovid_003_data()
#' @export
download_CPICovid_003_data <- function() {
  url <- 'https://drive.google.com/uc?id=141P9cWBk6gE8J92j5sh5PIDcSTZ2CCq7'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_001_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_001_data()
#' @export
download_Floor_001_data <- function() {
  url <- 'https://drive.google.com/file/d/1hcq7cDr8-fOgNtLMiL_2TurZikNaMF9s/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_002_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_002_data()
#' @export
download_Floor_002_data <- function() {
  url <- 'https://drive.google.com/file/d/1A8d-zH71Q-p7zhJpeeqMLYKyPQDShVJD/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_003_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_003_data()
#' @export
download_Floor_003_data <- function() {
  url <- 'https://drive.google.com/file/d/1jcXkFKU1aAlU9vYtIAH9pKush8k48FBu/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_004_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_004_data()
#' @export
download_Floor_004_data <- function() {
  url <- 'https://drive.google.com/file/d/1LT0eg0WnqcUDHlGEf2Zn3ErEaIo59Qfj/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_005_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_005_data()
#' @export
download_Floor_005_data <- function() {
  url <- 'https://drive.google.com/file/d/1aBIBSyy56ERk5SYVVO8YAXt8FY8jEEAV/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_006_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_006_data()
#' @export
download_Floor_006_data <- function() {
  url <- 'https://drive.google.com/file/d/1elo8LQPcy7Vwudsi07HRf7pmqgOqE3bI/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_007_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_007_data()
#' @export
download_Floor_007_data <- function() {
  url <- 'https://drive.google.com/file/d/13PFEisX7qT5lvtxMZQWX2ICG6Keb3bdZ/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_008_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_008_data()
#' @export
download_Floor_008_data <- function() {
  url <- 'https://drive.google.com/file/d/1xqA91IJ5-Adhd6mNzcZSH3XQlaZ2gS36/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_009_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_009_data()
#' @export
download_Floor_009_data <- function() {
  url <- 'https://drive.google.com/file/d/1W1xvUbVMDmHzZ4cdKuMnJcPFsFbgT2X2/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_010_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_010_data()
#' @export
download_Floor_010_data <- function() {
  url <- 'https://drive.google.com/file/d/1tpg1ZWnDMEu_MWh9n5S1dbd-gKOtdFpG/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_011_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_011_data()
#' @export
download_Floor_011_data <- function() {
  url <- 'https://drive.google.com/file/d/18LuVqljUEEckTsveBdHOWeyOOQewIVMC/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_012_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_012_data()
#' @export
download_Floor_012_data <- function() {
  url <- 'https://drive.google.com/file/d/1mNPev1kA8cbNDM2biaGa1QaSt7ByGvMy/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_013_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_013_data()
#' @export
download_Floor_013_data <- function() {
  url <- 'https://drive.google.com/file/d/1Q0Mrw8WvZ26L3VJIwhag4gIXPSkFOAP5/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_014_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_014_data()
#' @export
download_Floor_014_data <- function() {
  url <- 'https://drive.google.com/file/d/18q0RFgfS3B24nK8aWEqVfTeJXP3W0L6C/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_015_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_015_data()
#' @export
download_Floor_015_data <- function() {
  url <- 'https://drive.google.com/file/d/1qvs3bX6klU9Uzc2s-pQntqAb0x6PFdfW/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_016_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_016_data()
#' @export
download_Floor_016_data <- function() {
  url <- 'https://drive.google.com/file/d/18M4MrOyJKaxDTo_8ThGCujToBWRJMVFk/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_017_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_017_data()
#' @export
download_Floor_017_data <- function() {
  url <- 'https://drive.google.com/file/d/17UBXdZvV2bTCP_2XaEGulhXE24_cJM7M/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_018_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_018_data()
#' @export
download_Floor_018_data <- function() {
  url <- 'https://drive.google.com/file/d/1mCae2HnAdLGGGy-7F9xJ40EMdRLZxTUs/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_019_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_019_data()
#' @export
download_Floor_019_data <- function() {
  url <- 'https://drive.google.com/file/d/1jx2dM51F5urxWJISXtY_LfwtrZQvu_hG/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_020_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_020_data()
#' @export
download_Floor_020_data <- function() {
  url <- 'https://drive.google.com/file/d/1AIfpeAfCnNXZUSsY2SEHxEzut4NWvn7b/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_021_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_021_data()
#' @export
download_Floor_021_data <- function() {
  url <- 'https://drive.google.com/file/d/1G49yM9qA0hmg3K4wMI_boOOi58tDzSA_/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_022_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_022_data()
#' @export
download_Floor_022_data <- function() {
  url <- 'https://drive.google.com/file/d/1CRukoj9JSbvr10Hsq06mYb177zwmkPj6/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_023_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_023_data()
#' @export
download_Floor_023_data <- function() {
  url <- 'https://drive.google.com/file/d/1HOCeLvxq4T2guWckXROET4HtAp0_RVhH/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_024_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_024_data()
#' @export
download_Floor_024_data <- function() {
  url <- 'https://drive.google.com/file/d/1iUIFGAwcUpuGqXiCz1lYD1-1wfc4ul3w/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_025_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_025_data()
#' @export
download_Floor_025_data <- function() {
  url <- 'https://drive.google.com/file/d/1QUYAbvT5oIkIx80kEQsfZ8uhV4AwgL1d/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_026_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_026_data()
#' @export
download_Floor_026_data <- function() {
  url <- 'https://drive.google.com/file/d/1GHsmG9zdvPLuCQ4Oz1CUTocPQ28sAok_/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_027_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_027_data()
#' @export
download_Floor_027_data <- function() {
  url <- 'https://drive.google.com/file/d/179Q6tsotNUwXxXibwJlWq_yyaLcrdREO/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_028_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_028_data()
#' @export
download_Floor_028_data <- function() {
  url <- 'https://drive.google.com/file/d/1bo14x_HanPmqz-wLfh66g1Sb63f5Ojbs/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_029_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_029_data()
#' @export
download_Floor_029_data <- function() {
  url <- 'https://drive.google.com/file/d/1CXWsFpTIsl2stWBmEfbl-hYVsOnMLOQN/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_030_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_030_data()
#' @export
download_Floor_030_data <- function() {
  url <- 'https://drive.google.com/file/d/1H2L_LhAygxTVMB4yyuhtKZbx8l3wNLhf/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_031_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_031_data()
#' @export
download_Floor_031_data <- function() {
  url <- 'https://drive.google.com/file/d/1beCYy7GT5qKwTVdnB0D4jZplgFApp3op/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_032_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_032_data()
#' @export
download_Floor_032_data <- function() {
  url <- 'https://drive.google.com/file/d/1WFjIEdrpv9jF1hWNthl0R34V-VXCdn9W/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_033_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_033_data()
#' @export
download_Floor_033_data <- function() {
  url <- 'https://drive.google.com/file/d/1Fug4c98H_K6k5QsC_M1IaOxZerHeEBv1/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_034_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_034_data()
#' @export
download_Floor_034_data <- function() {
  url <- 'https://drive.google.com/file/d/131qEtTHgx2HvLT9sU_L-sfJJ5RVkYHzW/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_035_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_035_data()
#' @export
download_Floor_035_data <- function() {
  url <- 'https://drive.google.com/file/d/1x5WRmVDk0luGW1dWBGeW27EAlLCynG2n/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_036_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_036_data()
#' @export
download_Floor_036_data <- function() {
  url <- 'https://drive.google.com/file/d/1GOJJqCVao3uH0AVjcAmHP68Nzt0ZmgGM/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_037_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_037_data()
#' @export
download_Floor_037_data <- function() {
  url <- 'https://drive.google.com/file/d/1ifCDAzw3iHLlCvi4DxurgH08-A9xvZWl/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_038_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_038_data()
#' @export
download_Floor_038_data <- function() {
  url <- 'https://drive.google.com/file/d/16MlADsw2_5QxmyTTIz9sgz6Sy_GRAvfL/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_039_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_039_data()
#' @export
download_Floor_039_data <- function() {
  url <- 'https://drive.google.com/file/d/1RPyInp8ErHysSxOFZrKyBP6V5E5c5d5Y/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_040_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_040_data()
#' @export
download_Floor_040_data <- function() {
  url <- 'https://drive.google.com/file/d/15ng8moTjDpC_t_m5ScJaj1fChREtkwKo/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_041_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_041_data()
#' @export
download_Floor_041_data <- function() {
  url <- 'https://drive.google.com/file/d/1AdX2GcNEfSgxyHTyo5NFmfGVdPV_ZD_e/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_042_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_042_data()
#' @export
download_Floor_042_data <- function() {
  url <- 'https://drive.google.com/file/d/1pTrI_z71AaNauytDyG4xy-L6nWusyEtZ/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_043_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_043_data()
#' @export
download_Floor_043_data <- function() {
  url <- 'https://drive.google.com/file/d/1SG2Sn82Hhs6qh1OqgwQT_eSxNJ8LnnpZ/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_044_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_044_data()
#' @export
download_Floor_044_data <- function() {
  url <- 'https://drive.google.com/file/d/1nn-MZHBrq6sg-CPIlIfmaBFR3wbnP7AN/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_045_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_045_data()
#' @export
download_Floor_045_data <- function() {
  url <- 'https://drive.google.com/file/d/130N4bj3Z_yLogH31jQcUmWmJiti_E_un/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_046_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_046_data()
#' @export
download_Floor_046_data <- function() {
  url <- 'https://drive.google.com/file/d/1s3UUY-_HmDGAR2slVNW84KK8y0VWviGV/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_047_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_047_data()
#' @export
download_Floor_047_data <- function() {
  url <- 'https://drive.google.com/file/d/1Cn0jyX9MAZ415i9fkEDWV-ZXfaXnvruP/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_048_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_048_data()
#' @export
download_Floor_048_data <- function() {
  url <- 'https://drive.google.com/file/d/1q0a90E7Eo-TsJazntmPJFUnX0UR-qNSw/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_049_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_049_data()
#' @export
download_Floor_049_data <- function() {
  url <- 'https://drive.google.com/file/d/1o-dMm98zWfYaGn6BX9Poot8C32myFT9d/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_050_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_050_data()
#' @export
download_Floor_050_data <- function() {
  url <- 'https://drive.google.com/file/d/1lG2eif03wuFcOZxJsvrsVyo9rcAIJPFz/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_051_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_051_data()
#' @export
download_Floor_051_data <- function() {
  url <- 'https://drive.google.com/file/d/1SKfgRxZTvPZm34DuBA4yPF6U10t-nJd1/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_052_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_052_data()
#' @export
download_Floor_052_data <- function() {
  url <- 'https://drive.google.com/file/d/1bI3zVqK3eVFdJScdCWC4h3h2ParYB3EL/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_053_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_053_data()
#' @export
download_Floor_053_data <- function() {
  url <- 'https://drive.google.com/file/d/1AWFKgG9zUJUvzX1T9j2K2x5nJt24svaq/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_054_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_054_data()
#' @export
download_Floor_054_data <- function() {
  url <- 'https://drive.google.com/file/d/1oUu5ATj-gOa-XrjhpOibyuRWIaTZFSkN/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_055_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_055_data()
#' @export
download_Floor_055_data <- function() {
  url <- 'https://drive.google.com/file/d/1xLYJyuRFsp5bEW8f5FhJWZr5movi2R-I/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_056_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_056_data()
#' @export
download_Floor_056_data <- function() {
  url <- 'https://drive.google.com/file/d/14XhvBFOe-p56CI4zN9qgG76RDc6zkxoB/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_057_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_057_data()
#' @export
download_Floor_057_data <- function() {
  url <- 'https://drive.google.com/file/d/1va4wPTHvzDApob8oqoDPcE0jCg8r-Mbe/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_058_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_058_data()
#' @export
download_Floor_058_data <- function() {
  url <- 'https://drive.google.com/file/d/1u7SsiUD7hH60Nww4jX-u1PfskbKSrK6r/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_059_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_059_data()
#' @export
download_Floor_059_data <- function() {
  url <- 'https://drive.google.com/file/d/1HKAt9AZGdVNa7Zk-2rZGon3uPVd_fyMw/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_060_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_060_data()
#' @export
download_Floor_060_data <- function() {
  url <- 'https://drive.google.com/file/d/1L8BgZ9_Tt6muiGyRCERf7SPuGdw_rDD-/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_061_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_061_data()
#' @export
download_Floor_061_data <- function() {
  url <- 'https://drive.google.com/file/d/1GymewF1JfI6N6s4TJ867qA7KbWHfmjsQ/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_062_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_062_data()
#' @export
download_Floor_062_data <- function() {
  url <- 'https://drive.google.com/file/d/1gcSRNQpF7M8Ex9Nm7OhfF8vs8r7LTh6H/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_063_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_063_data()
#' @export
download_Floor_063_data <- function() {
  url <- 'https://drive.google.com/file/d/1xVwhPrWGe7sQqKS4lTt2jK2o1OjkvDMW/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_064_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_064_data()
#' @export
download_Floor_064_data <- function() {
  url <- 'https://drive.google.com/file/d/1fBYr_k8-A6WCyz3SjkvofjFHu4BzbLel/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_065_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_065_data()
#' @export
download_Floor_065_data <- function() {
  url <- 'https://drive.google.com/file/d/1Xc7y12RH5LL2EOBu8NeZxepZvVI5P9r3/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_066_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_066_data()
#' @export
download_Floor_066_data <- function() {
  url <- 'https://drive.google.com/file/d/1jJdmed8ral5ZyRrhp8-ruaMMeM-NbgeQ/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_067_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_067_data()
#' @export
download_Floor_067_data <- function() {
  url <- 'https://drive.google.com/file/d/1yaIGYkw0kliZIMATc7CaCt1n3rzcMJNd/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_068_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_068_data()
#' @export
download_Floor_068_data <- function() {
  url <- 'https://drive.google.com/file/d/11Nep9sXMqGHtoPLUOBaUjorJrPNWvjDA/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_069_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_069_data()
#' @export
download_Floor_069_data <- function() {
  url <- 'https://drive.google.com/file/d/12KfuwnPsIgIdmg1hUSvqDmH_7_WYHzWR/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_070_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_070_data()
#' @export
download_Floor_070_data <- function() {
  url <- 'https://drive.google.com/file/d/1pkKZoH8DItYl6ozRgcni_XP3FiwkH6E2/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_071_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_071_data()
#' @export
download_Floor_071_data <- function() {
  url <- 'https://drive.google.com/file/d/10Kr3gWGOTU8uayysveJLoG31HdnI6nOd/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_072_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_072_data()
#' @export
download_Floor_072_data <- function() {
  url <- 'https://drive.google.com/file/d/1XAG1h8BVJcq2uZL-S_S9chUV7yM2ZGS4/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_073_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_073_data()
#' @export
download_Floor_073_data <- function() {
  url <- 'https://drive.google.com/file/d/1Aqt2ErjgwWHi6lPPOU19hWuy7Y4M1l7F/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_074_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_074_data()
#' @export
download_Floor_074_data <- function() {
  url <- 'https://drive.google.com/file/d/1m136eyYKO8nYHdew4Y6eqPzjfKjIurz4/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_075_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_075_data()
#' @export
download_Floor_075_data <- function() {
  url <- 'https://drive.google.com/file/d/1h_RS5wA1Zq0txDWBBbTuWr4JwytJQ4N_/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_076_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_076_data()
#' @export
download_Floor_076_data <- function() {
  url <- 'https://drive.google.com/file/d/16Td2simV3n6nRdBRWO0ePsXcp5LjQDvE/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_077_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_077_data()
#' @export
download_Floor_077_data <- function() {
  url <- 'https://drive.google.com/file/d/1qNlhcGTM_nBTwJFXd9yEISwUc3nftEv-/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_078_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_078_data()
#' @export
download_Floor_078_data <- function() {
  url <- 'https://drive.google.com/file/d/1kPnGtnlIZ8GuDdwB9_XBkP-WJ8aUAFr3/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_079_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_079_data()
#' @export
download_Floor_079_data <- function() {
  url <- 'https://drive.google.com/file/d/1Ww2h9c03AD74MuhJ1MGgJESezn1n-zJ0/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_080_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_080_data()
#' @export
download_Floor_080_data <- function() {
  url <- 'https://drive.google.com/file/d/1_Lj6rk9l5EZuXvwUslzx7Z1zHIzp_1vk/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_081_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_081_data()
#' @export
download_Floor_081_data <- function() {
  url <- 'https://drive.google.com/file/d/1ZunAdKBzwiQs2_nZ6QJi2JoJV2rhUYD0/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_082_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_082_data()
#' @export
download_Floor_082_data <- function() {
  url <- 'https://drive.google.com/file/d/1-VAqV-qhrbTuPUXbRNjc0u1TV-8K26nS/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_083_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_083_data()
#' @export
download_Floor_083_data <- function() {
  url <- 'https://drive.google.com/file/d/1_oLSLCwQk5dMzbmjpHe8Wrb--9iIy1Pb/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_084_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_084_data()
#' @export
download_Floor_084_data <- function() {
  url <- 'https://drive.google.com/file/d/12r0uMxfMQXfC3UcZgvEMFnl9cuDQlzIh/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_085_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_085_data()
#' @export
download_Floor_085_data <- function() {
  url <- 'https://drive.google.com/file/d/1EjOxGypRh2gjvCbcaJdob4yh60AhmyjI/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_086_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_086_data()
#' @export
download_Floor_086_data <- function() {
  url <- 'https://drive.google.com/file/d/19fhoQPq1zTD_4DfDhVlPwBvaXBbnnw1V/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_087_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_087_data()
#' @export
download_Floor_087_data <- function() {
  url <- 'https://drive.google.com/file/d/1Ra8HVEtmCAN_WHif-D2IL6lUA6E9fcAm/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_088_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_088_data()
#' @export
download_Floor_088_data <- function() {
  url <- 'https://drive.google.com/file/d/1Jrd2quc60Ll9RTKPovNJ97F-DoFdPtGk/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_089_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_089_data()
#' @export
download_Floor_089_data <- function() {
  url <- 'https://drive.google.com/file/d/110YWpwWMrCBVpXQW-mczQFEtdPUjqZUl/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_090_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_090_data()
#' @export
download_Floor_090_data <- function() {
  url <- 'https://drive.google.com/file/d/1JpXi24wHYcfUNaTkQWc73ovGjM7dM0Tp/view'
  df <- download_dataset(url)
  return(df)
}

#' Download Floor_091_data Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Floor_091_data()
#' @export
download_Floor_091_data <- function() {
  url <- 'https://drive.google.com/file/d/175jbCBVAwBnOSPpmZ4bC5PW53PHe4LCV/view'
  df <- download_dataset(url)
  return(df)
}


#' Download InauguralSpeeches Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_InauguralSpeeches()
#' @export
download_InauguralSpeeches <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=12xwXqB4nvhJH0d9YmrtV4yU1K3_ieNwV'
  df <- download_dataset(url)
  return(df)
}


#' Download Brasil_president_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Brasil_president_2014()
#' @export
download_Brasil_president_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1vc8wg9WfaWt2bDCl7oHr3qHhby2MJ-uh'
  df <- download_dataset(url)
  return(df)
}

#' Download Brasil_president_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Brasil_president_2018()
#' @export
download_Brasil_president_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=15YSZYNQbC_LrwAhkrO5CZWoI7HtU0VPn'
  df <- download_dataset(url)
  return(df)
}

#' Download Brasil_president_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Brasil_president_2022()
#' @export
download_Brasil_president_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1bk5zPXhmuE_SsI6w-ukWB1Cge4mHcbDj'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AC_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AC_2014()
#' @export
download_Governador_AC_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1W4Xhn7x7V7USH4vEQ5NoeMvGAgnJHN7i'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AC_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AC_2018()
#' @export
download_Governador_AC_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1KWRtwBWTljl6ebLIlom2hOiHh4RilnGE'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AC_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AC_2022()
#' @export
download_Governador_AC_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=18mMZS0Sqm9EH1Kpmm6-MM6ahccNAyAqd'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AL_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AL_2018()
#' @export
download_Governador_AL_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1nJMU0FlWP0hiSeU6wkdJMCBb43wJpM2T'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AL_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AL_2022()
#' @export
download_Governador_AL_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1M95kgB2fgETL7lAJvagaRVkVA29ofwj2'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AM_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AM_2014()
#' @export
download_Governador_AM_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Z2eUuiLEvXdW2uhDcBCrAgsc2l8S5PUL'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AM_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AM_2018()
#' @export
download_Governador_AM_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1OVfCtWZuxxrEnTg4AXWGbISHGOZocb2j'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AM_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AM_2022()
#' @export
download_Governador_AM_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1p0G6_phtJhh7_KIb18-bk-xK02aPCX1w'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AP_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AP_2014()
#' @export
download_Governador_AP_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Vr4ZDo92ueZ8GjLaKMOFg5Gxs3t3SjVh'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AP_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AP_2018()
#' @export
download_Governador_AP_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1HGL9ZomwekyFn-_DSjzel9UOlO56ukL3'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_AP_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_AP_2022()
#' @export
download_Governador_AP_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1E-5pxipCfMzZL3A65A9sCQVOQ5yLgNo4'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_BA_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_BA_2014()
#' @export
download_Governador_BA_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=18N_m4XYCLIv5EWp3gsEsE6HCjiCnMWWQ'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_BA_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_BA_2018()
#' @export
download_Governador_BA_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1LtfVM55Dk8YJGBGTDkLdtlAXIRqzyVLz'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_BA_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_BA_2022()
#' @export
download_Governador_BA_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1S1uEtRE2LsAa81F3C5U6KbUbMcaKR97l'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_CE_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_CE_2014()
#' @export
download_Governador_CE_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1veNS5vlHma3m1_JY-VMKuZFkwoB2h4X3'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_CE_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_CE_2018()
#' @export
download_Governador_CE_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1EATKUeH-X2gisrbMhfin5sczq3D2_ip1'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_CE_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_CE_2022()
#' @export
download_Governador_CE_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1y3OOoswu-ZH5jojSc8EUGCyff3GD2sDw'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_DF_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_DF_2014()
#' @export
download_Governador_DF_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1R9_NC1etGAi3AVxad4pHB4jgOCB2St-L'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_DF_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_DF_2018()
#' @export
download_Governador_DF_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1qpGtDtAzBWJxWsk_v2Eib16PcEa_q75i'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_DF_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_DF_2022()
#' @export
download_Governador_DF_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1RKt2Ih4QOqbDjHqYNBatlMIHTtmIKFxX'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_ES_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_ES_2014()
#' @export
download_Governador_ES_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1-oFtYnPz1YlqxOjlyX04uqmznl5Kdfz8'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_ES_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_ES_2018()
#' @export
download_Governador_ES_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1cS5isTP_DzFkWtN8L5YNzifLWQxIfNf5'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_ES_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_ES_2022()
#' @export
download_Governador_ES_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1CgRcnCt7CbgDDMBv6v304ipsFnMJbq9E'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_GO_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_GO_2014()
#' @export
download_Governador_GO_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1elMhw7OChZTooyJo_IBKqSC54zBM28hE'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_GO_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_GO_2018()
#' @export
download_Governador_GO_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1mk2ajZ0Yb3hnaPrKz7_ufzoqgkw2fSYN'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_GO_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_GO_2022()
#' @export
download_Governador_GO_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1cz-Z9sOxO4CVDrwok798opsYPaVOl2ic'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MA_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MA_2014()
#' @export
download_Governador_MA_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1RuXp5ve4OnUpxAIojM8vlSB2DJnRwUbr'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MA_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MA_2018()
#' @export
download_Governador_MA_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1JSnjBxhYvRD7iQe_BZVIOAzQFbIAf7xb'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MA_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MA_2022()
#' @export
download_Governador_MA_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=11elKQxViELDYRAIcSq51ox-wrzREiRB3'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MG_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MG_2014()
#' @export
download_Governador_MG_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1LbdI45-qi95g32reLMGWXS-GQxxIm_cd'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MG_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MG_2018()
#' @export
download_Governador_MG_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1ZMPbD-7ZK08qVc4br0I7tf7nz3Vw1b1j'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MG_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MG_2022()
#' @export
download_Governador_MG_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Hba5d8PmCX7-gbdFjBdNqql7YrVh8Its'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MS_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MS_2014()
#' @export
download_Governador_MS_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1o-I90fe_hCaLhvEJ-GY5DyDgflwr-6IB'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MS_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MS_2018()
#' @export
download_Governador_MS_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1xLGiukzFQOzV74mHr4JvNZRr3xUrj82P'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MS_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MS_2022()
#' @export
download_Governador_MS_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1T6_7TcUFMGZrNyfckkyl0ZYtRyg4kAPn'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MT_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MT_2014()
#' @export
download_Governador_MT_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1fv0NHIjR3tKUZ1pC7av6RQNEdRBJ9A0U'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MT_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MT_2018()
#' @export
download_Governador_MT_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1RaI3J25vI4TIRvOu_qUVZXIfstq3F7Kw'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_MT_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_MT_2022()
#' @export
download_Governador_MT_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1ozprSF1AS-vubS9bfUCwV-FqVwhRPGWo'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PA_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PA_2014()
#' @export
download_Governador_PA_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1WZ95T9cD9XTDhKGhS5Ea3bMdJLBXA-Me'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PA_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PA_2018()
#' @export
download_Governador_PA_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1LmCjKWe_24oYWnHVELAAtrjM4aCO-k3A'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PA_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PA_2022()
#' @export
download_Governador_PA_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1IJ52uJGOmzyH8Y4QE53T_rI6uZ4URG2W'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PB_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PB_2014()
#' @export
download_Governador_PB_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1X8gaEZK915sj773AnuiMtUD1w5ohJtcJ'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PB_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PB_2018()
#' @export
download_Governador_PB_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1jaDOmy_a14PTmIWntpb47rcRQioRbhJ6'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PB_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PB_2022()
#' @export
download_Governador_PB_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1OSDqR-V3tRRu0DStCBuIRaxpE6ydcjBl'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PE_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PE_2014()
#' @export
download_Governador_PE_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1C6Ef0w8T43D4SeTqtn6iut8Xzf0ALD1w'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PE_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PE_2022()
#' @export
download_Governador_PE_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1YDaSyQoEejwXmENYE4qyFRYhAFnauedp'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PI_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PI_2014()
#' @export
download_Governador_PI_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1vW5W2XS_NLzJe-ea-Wer7BOv8t7G4YGG'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PI_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PI_2018()
#' @export
download_Governador_PI_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1iLRz1zfKdALKekBCq9DrsTpunzRfXjYC'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PI_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PI_2022()
#' @export
download_Governador_PI_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1f4sRU0Qg-abTJPJMUpRtZYzPsUTWlFMQ'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PR_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PR_2014()
#' @export
download_Governador_PR_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1zN5javu_-mca3dXvUhs4YwzqF70nLkP1'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PR_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PR_2018()
#' @export
download_Governador_PR_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Q3r_7ucU-o51OTvgABya2Ra609i929WN'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_PR_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_PR_2022()
#' @export
download_Governador_PR_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1zRIHA5dQPz1xtG_V28iVQrE7DcDoYOrj'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RJ_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RJ_2014()
#' @export
download_Governador_RJ_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1NR34QR0ffuTUaH5I_s4x5pYJB6edJ84u'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RJ_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RJ_2018()
#' @export
download_Governador_RJ_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1cvqaPqsgp6w3LHVLFbF89dWJVFhKim1x'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RJ_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RJ_2022()
#' @export
download_Governador_RJ_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=12tf7W8oFf2OuBoqSi1R2oXQ9VISskio8'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RN_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RN_2014()
#' @export
download_Governador_RN_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1OTyPc8MIxK2quMN2BgLh9_nd5ICs_nlE'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RN_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RN_2018()
#' @export
download_Governador_RN_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1je25ZWqsF9IhLlgt-pZVgx_nHl0sa1Rw'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RN_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RN_2022()
#' @export
download_Governador_RN_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1hrp9rTzoLUCFuNksBZghLr69QblJkpQz'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RO_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RO_2014()
#' @export
download_Governador_RO_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1YQk1NaTlVVMfwixXufgBVw1X4LGbYIyf'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RO_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RO_2018()
#' @export
download_Governador_RO_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1vJDMnsRZaLWDq-U1_FvNoQkklLTApwUx'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RO_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RO_2022()
#' @export
download_Governador_RO_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Uf11FY8ZyztPLIjkNl_zVfa3gkGEPc0o'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RR_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RR_2018()
#' @export
download_Governador_RR_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1rN_mLnkFVR47UpB_xYJIS5dhi-nlLZOg'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RR_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RR_2022()
#' @export
download_Governador_RR_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1kSQxnnfD_fd9DNcjKB5W2rzQcS1b2rWD'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RS_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RS_2014()
#' @export
download_Governador_RS_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1Ek1hWkwyncGjr-vFFwfgEc4p2lgeKa1h'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RS_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RS_2018()
#' @export
download_Governador_RS_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=14uOTT5yYBd7AU0iDJ5OaFk8i7KIVXZ6f'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_RS_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_RS_2022()
#' @export
download_Governador_RS_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1S9acCN1gNIwT74FoaK-3d5pJCKDXg8wQ'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SC_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SC_2014()
#' @export
download_Governador_SC_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1HSYKUMkdvzVN3NZ4whjHpbuvegJ4oXdf'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SC_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SC_2018()
#' @export
download_Governador_SC_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1fVQZC1-Srm0JHnqWArcQ7Oo3YIAt4b0W'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SC_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SC_2022()
#' @export
download_Governador_SC_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1qif6oB8lXasczcOZThtPeG32G9DWUGOz'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SE_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SE_2014()
#' @export
download_Governador_SE_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1KF4A3ZzvuyborAiCWcJXwvg8tpFCMWif'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SE_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SE_2018()
#' @export
download_Governador_SE_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1eNleqKDz_922ZCwwPpNZSlxh4423uyiN'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SE_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SE_2022()
#' @export
download_Governador_SE_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1PTAkmDepYLTeGQM2IIWu6wlh6oyBT1EW'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SP_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SP_2014()
#' @export
download_Governador_SP_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1pcYPqoi1Gygc0J1amGNNGujJFKik0s8v'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SP_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SP_2018()
#' @export
download_Governador_SP_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1TVvMnx16SllBQCtkkwvwQdIG3nrEyfZA'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_SP_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_SP_2022()
#' @export
download_Governador_SP_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1yUfFfeqOjOcmXArdA8VAtOZb-DkDlPbS'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_TO_2014 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_TO_2014()
#' @export
download_Governador_TO_2014 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=11CKCQAUm3_ELqZuCRQVK2VgamPk8ksAq'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_TO_2018 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_TO_2018()
#' @export
download_Governador_TO_2018 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1m4dTHApTovuXG7yUFbJE-pO0Qlp4DLip'
  df <- download_dataset(url)
  return(df)
}

#' Download Governador_TO_2022 Dataset
#'
#' Downloads the dataset from the specified URL and imports it as a data frame.
#'
#' @return A data frame containing the dataset.
#' @examples
#' df <- download_Governador_TO_2022()
#' @export
download_Governador_TO_2022 <- function() {
  url <- 'https://drive.google.com/uc?export=download&id=1CNa9-Hew3QHxrmFlByFJV6JX-aQLOc6y'
  df <- download_dataset(url)
  return(df)
}

