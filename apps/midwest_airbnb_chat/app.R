# apps/job_scout_chat/app.R
install.packages("querychat", dependencies = T)
library(querychat)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat::querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),
  greeting = "Ask about the 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities.",
  data_description = "data/data_desc.md",
  extra_instructions = "data/extra_instructions.md"
)

qc$app_obj()

library(bslib)

ui = bslib::page_sidebar(
  title   = "Midwest Airbnb Chat",
  theme   = bslib::bs_theme(primary = "#C3142D",
                            base_font = bslib::font_google("Lato")),
  sidebar = qc$sidebar(width = 350),
  bslib::card(bslib::card_header(textOutput("title")),
              DT::DTOutput("table")),
  bslib::accordion(open = FALSE,
                   bslib::accordion_panel("SQL", verbatimTextOutput("sql")),
                   bslib::accordion_panel("About", "Airbnb Listings in Chicago, Columbus, and the Twin Cities"))
)
shinyApp(ui = ui, server = server)