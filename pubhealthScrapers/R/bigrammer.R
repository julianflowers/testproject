
## bigram maker

#' Generate bigrams without stopwords from any text
#'
#' @param df A dataframe containing text to be processed
#' @param text The text variable to be processed
#'
#' @return A dataframe of bigrams
#'
#'
#' @examples
#' url <- "https://fingertips.phe.org.uk/documents/PHDS%20Guidance%20-%20Funnel%20Plots.pdf"
#' doc <- readtext(url)
#' head(create_bigrams(doc, text))
#'
#
#'
#'
create_bigrams <- function(df, text){
  require(tidytext)
  require(dplyr)
  require(Matrix)
 text <- enquo(text)
  df %>%
    unnest_tokens(bigram, !!text, token = "ngrams", n = 2) %>%
    separate(bigram, c("w1", "w2"), sep = " ") %>%
    dplyr::filter(!w1 %in% stop_words$word) %>%
    dplyr::filter(!w2 %in% stop_words$word) %>%
    unite(bigram, c("w1", "w2"), sep = " ")
}




