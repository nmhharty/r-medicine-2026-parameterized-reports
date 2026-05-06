library(quarto)
library(purrr)

# Single report
quarto_render(
  input = "R/example_final.qmd",
  execute_params = list(choose_continent = "Europe")
)

# For all continents
walk(
  .x = unique(gapminder$continent),
  .f = ~quarto_render(
    input = "R/example_final.qmd",
    output_file = glue("report_{.x}.html"),
    execute_params = list(
      choose_continent = .x
    )
  ),
  .progress = TRUE #tells you how much progress has been made in rendering all reports
)



### TESTING THIS ON MY OWN WITH report.qmd ##
# Single report
quarto_render(
  input = "R/report.qmd",
  execute_params = list(choose_year = "1972")
)

# For all continents
walk(
  .x = unique(gapminder$year),
  .f = ~quarto_render(
    input = "R/report.qmd",
    output_file = glue("report_{.x}.html"),
    execute_params = list(
      choose_year = .x
    )
  ),
  .progress = TRUE #tells you how much progress has been made in rendering all reports
)
