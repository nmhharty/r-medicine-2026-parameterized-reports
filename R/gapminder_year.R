library(dplyr)
library(ggplot2)

# Median life expectancy per continent
gapminder_1952 <- gapminder |>
  filter(year == 1952) |>
  group_by(continent) |>
  summarise(
    median_lifeExp = median(lifeExp)
  )

# Bar chart
ggplot(data = gapminder_1952) +
  geom_col(
    mapping = aes(
      x = median_lifeExp,
      y = reorder(continent, median_lifeExp)
    )
  ) +
  labs(
    x = "Median Life Expectancy (years)", y = NULL,
    title = "Life Expectancy in 1952"
  )
