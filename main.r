library(dplyr)      
library(tidyr)      

data <- read.csv("dataset.csv")

missing_values <- sum(is.na(data))

data <- na.omit(data)

data$numeric_var[is.na(data$numeric_var)] <- mean(data$numeric_var, na.rm = TRUE)

data <- data %>%
  mutate(new_variable = var1 + var2)

summary_data <- data %>%
  group_by(category_var) %>%
  summarise(avg_value = mean(numeric_var))

wide_data <- data %>%
  pivot_wider(names_from = variable_name, values_from = value)

write.csv(data, "cleaned_dataset.csv", row.names = FALSE)
