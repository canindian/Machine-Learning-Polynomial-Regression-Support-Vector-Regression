# Simple Linear Regression 
# Neel Patel 
#Problem: Human resource - hiring a new employee and predict his salary based on his given information

# - 1 - Importing Dataset -
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

# View Dataset 
View(dataset)


# - 2 - Fitting Linear Regression to the dataset -
lin_reg = lm(formula = Salary ~.,
             data = dataset)
summary(lin_reg)


# - 3 - Fitting Polynomial Regression to the dataset -
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula = Salary ~.,
             data = dataset)
summary(poly_reg)


#install.packages('ggplot2')
library(ggplot2)


# - 4 - Visualization of Linear Regression Results - 

ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression Result)')+
  xlab('Level')+
  ylab('Salary')
#ggsave('Truth or Bluff (Linear Regression Result).png')


# - 5 - Visualization of Polynomial Regression Results -3th & 4th degree (level) - 

ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Linear Regression Result (4th degree))')+
  xlab('Level')+
  ylab('Salary')
#ggsave('Truth or Bluff (Polynomial Regression 4th degree Result).png')



#  - Predicting a new result with Linear Regression 
y_pred = predict(lin_reg, data.frame(Level = 6.5))


#  - Predicting a new result with Polynomial Regression 
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))
# he is trurthful, his prediction was $$158,862
