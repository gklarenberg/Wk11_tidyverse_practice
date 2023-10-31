# Reproducible Quantitative Methods
# University of Florida, Fall semester
# Geraldine Klarenberg

# More tidyverse practice
# Long vs wide data

###### 1.Load libraries #####
library(tidyverse)

###### 2.Load data #####

surveys <- read_csv("surveys.csv")

###### 3.Clean up data #####

# Remove NAs
surveys_complete <- surveys %>% 
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

# Check for species that have > 50 observations
species_count <- surveys_complete %>% 
  count(species_id) %>% 
  filter(n >= 50)

# Create a new dataset with only species > 50 observations
surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_count$species_id)

# Plot to test
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

# Save the new dataset
write_csv(surveys_complete, "surveys_complete.csv")

###### 4. Long vs wide data (Monday) ######




###### 5. Plotting (Thursday) ######