#' Search data360
#'
#' @param search_string character: Text string to pass to the search API
#'
#' @return character
#' @export
#'
search_data360 <- function(search_string) {
  search_url <- "https://dataexpapi1prd.ocappsase.appserviceenvironment.net/efi/searchdata"

  req <- httr2::request(search_url) |>
    httr2::req_headers("Accept" = "application/json") |>
    httr2::req_body_json(
      list(
        count = TRUE,
        search = search_string,
        skip = 0,
        top = 5,
        orderby = "search.score() desc",
        filter = "")
    )
  req <- httr2::req_perform(req)
  out <- httr2::resp_body_string(req)

  return(out)
}
