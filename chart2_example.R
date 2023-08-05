library(ggplot2)
data_prison <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

prison_pop_2016 <- data_prison %>%
  filter(state == "WA", year == 2016, total_prison_pop >= 1000)

comparison <- ggplot(data = prison_pop_2016, mapping = aes(x = county_name)) +
  geom_bar(aes(y = black_female_prison_pop,
          fill = "Black Female Prison Population"), 
          stat = "identity"
          ) +
    geom_bar(aes(y = black_male_prison_pop, 
          fill = "Black Male Prison Population"),
          stat = "identity"
          ) +
  labs(
    title = "Black Prison in WA by County in 2016",
    x = "County",
    y = "Prison Population",
  ) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

comparison

