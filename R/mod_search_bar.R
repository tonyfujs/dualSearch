#' search_bar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_search_bar_ui <- function(id){
  ns <- NS(id)
  tagList(
    sidebarPanel(
    textInput(inputId = ns("search_input"),
              label = "Search",
              placeholder = "Enter your search here",
              value = "GDP"
    ),
    checkboxInput(inputId = ns("search_data360"),
                  label = "Search Data360",
                  value = FALSE,
                  width = NULL),
    ),
    mainPanel(
      textOutput(ns("search_output"))
    )
  )
}

#' search_bar Server Functions
#'
#' @noRd
mod_search_bar_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    search_results <- reactive({
      if (input$search_data360 == FALSE) {
        search_wdi(input$search_input)
        } else {
          "Still figuring out how to work with the EFI360 search API"
        }
      })

    output$search_output <- renderText({ search_results() })

  })
}

## To be copied in the UI
# mod_search_bar_ui("search_bar_1")

## To be copied in the server
# mod_search_bar_server("search_bar_1")
