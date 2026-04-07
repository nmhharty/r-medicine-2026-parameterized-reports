library(gapminder)
library(dplyr)
library(ggplot2)

# Filter code
gapminder_asia <- gapminder |>
  filter(continent == "Asia")

# Plot boxplot
ggplot(data = gapminder_asia) +
  geom_boxplot(
    mapping = aes(x = factor(year), y = lifeExp)
  ) +
  labs(
    x = NULL, y = "Life Expectancy (years)",
    title = "Life Expectancy in Asia"
  )
