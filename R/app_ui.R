#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    shinyjs::useShinyjs(),
    shinyUI(
      navbarPage(title = "Dual Search",
                 id = "data_search",
                 windowTitle = "Dual Search",
                 theme = shinythemes::shinytheme("flatly"),
                 tabPanel("Demo", value = "Demo",
                          sidebarPanel(mod_search_bar_ui("search_bar_1")),
                          mainPanel(
                            # mod_search_bar_server("search_bar_1")
                          )
                 )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "dual-search"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
