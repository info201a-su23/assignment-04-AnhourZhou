library(dplyr)
library(ggplot2)
library(tidyr)


data_prison <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

prison_pop <- data_prison %>%
  filter(year == "2016")


total_per_state <- prison_pop%>% 
  group_by(state) %>%
  summarise(black_prison_pop = sum(black_prison_pop, na.rm = TRUE))


state_mapping <- setNames(state.name, state.abb)


total_per_state$full_state_name <- state_mapping[total_per_state$state]
state_shape <- map_data("state")


total_per_state <- total_per_state %>% 
  mutate(full_state_name = tolower(full_state_name))
prison_state_shape <- left_join(total_per_state, state_shape, by = c("full_state_name" = "region"))


prison_pop_map <- ggplot(data = prison_state_shape) +
  geom_polygon(mapping = aes(x = long,
                             y = lat,
                             group = group,
                             fill = black_prison_pop)) +
  scale_fill_continuous(low = "grey",
                        high = "purple",
                        limits = c(0, 4000),
                        labels = label_number_si()) +
  labs(title="Total Black Prison Population by State in 2016",
       fill="Total Black Prison Population") + 
  coord_map()

prison_pop_map
