library(ggplot2)
library(tidyverse)


data <- read.csv("S&P 500 Companies - constituents-financials.csv")

wdf <- data %>%
  filter(Price > 
           200) %>%
  mutate(Name2 = fct_reorder(Name, desc(Price)))


ggplot(wdf, aes(x=Name2, y=Price, fill=Earnings.Share)) +
  geom_col() +
  theme(axis.text.x = element_text(angle=90)) +
  labs(
    title = "Stock Prices: S&P 500 Market Index and EPS",
    y = "Stock Price",
    x = "Companies with Stock Price Above $100",
    fill = "Earnings per Share"
  )

