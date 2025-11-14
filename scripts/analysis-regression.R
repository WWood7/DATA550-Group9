here::i_am(
  "DATA550-Group9/scripts/analysis-regression.R"
)

# load necessary libraries
library(gtsummary)

# read the data
dat <- read.csv(
  here::here("DATA550-Group9/covid_sub.csv")
)

# create the outcome variable
dat$death <- ifelse(is.na(dat$DATE_DIED) == T, 0, 1)

# fit the regression model
fit <- glm(death ~ AGE + SEX, data = dat, family = binomial)

primary_regression_table <- 
  tbl_regression(fit) |>
  add_global_p()

# save the results as RDS file in /output
saveRDS(fit, here::here("DATA550-Group9/output/regression-model.rds"))
saveRDS(primary_regression_table, here::here("DATA550-Group9/output/regression-model-table.rds"))