#' Search WDI
#'
#' @param search_string character: Text string to pass to the search API
#'
#' @return character
#' @export
#'
search_wdi <- function(search_string) {
  search_string <- glue::glue("https://data.worldbank.org/token-search?q={search_string}&exclude=&locale=en&maxComposites=100")

  req <- httr2::request(search_string)
  req <- httr2::req_perform(req)
  out <- httr2::resp_body_string(req)

  return(out)
}
