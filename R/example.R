library(quarto)
library(purrr)

# Single report
quarto_render(
  input = "R/example_final.qmd",
  execute_params = list(
    choose_continent = "Europe"
  )
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
  )
)
