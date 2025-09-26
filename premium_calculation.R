
head(life_table)
sum_assured <- 100000
i <- 0.05
v <- 1/(1+i)
# Extract lower bound (everything before "-")
life_table$age_start <- as.numeric(sub("-.*", "", life_table$age))

# Extract upper bound (everything after "-")
life_table$age_end <- as.numeric(sub(".*-", "", life_table$age))

life_table$age_mid <- (life_table$age_start + life_table$age_end) / 2
head(life_table[, c("age", "age_start", "age_end", "age_mid")])

life_table$premium_1yr <- v * life_table$qx * sum_assured
life_plot <- subset(life_table, age_mid >= 20)
plot(life_plot$age_mid, life_plot$premium_1yr,
     type = "o", pch = 16, lwd = 1,
     xlab = "Age (midpoint of interval)",
     ylab = "Net single premium (₹)",
     main = "1-Year Net Single Premium vs Age (per ₹100000 SA)")

life_plot <- subset(life_table)
plot(life_plot$age_mid, life_plot$premium_1yr,
     type = "o", pch = 16, lwd = 1,
     xlab = "Age (midpoint of interval)",
     ylab = "Net single premium (₹)",
     main = "1-Year Net Single Premium vs Age (per ₹100000 SA)")


