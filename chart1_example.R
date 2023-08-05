library(ggplot2)
prison_population <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

trend_chart <- ggplot(prison_population, aes(x = year)) +
  geom_line(aes(y = black_prison_pop, color = "Black")) +
  labs(title = "Trending of Prison Population of Black", x = "Year", y = "Prison Population", color = "Race")

trend_chart
