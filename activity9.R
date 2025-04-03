library(ggplot2)
data(diamonds)

ggplot(
  data = diamonds,
  mapping = aes(
    x = table,
    y = depth,
    color = color,
    shape = cut,
  )
) +
  geom_point(size = 1) +
  labs(
    x = "table (width relative to the widest point)",
    y = "depth (the tallest part of the diamond)",
    color = "color",
    shape = "cut of the diamond",
    title = "Diamond color and cut by size of diamond"
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom"
  )
