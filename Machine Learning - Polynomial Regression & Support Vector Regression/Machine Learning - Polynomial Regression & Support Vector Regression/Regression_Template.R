# Polynomial Regression Template 
# Neel Patel 

# - 1 - Importing Dataset -
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

# View Dataset 
View(dataset)



# - 2 - Fitting  Regression Model to the dataset -
# Create your regressor  here


#  - 3 - Predicting a new result 
y_pred = predict(regressor, data.frame(Level = 6.5))

#install.packages('ggplot2')
library(ggplot2)


# - 4 - Visualization of Regression Model Results - 

ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff  Regression Model)')+
  xlab('Level')+
  ylab('Salary')
#ggsave('Truth or Bluff ('Regression Mdoel.png')


#  - 5 - Visualization of Regression Model Results - for high resolution and smoother curve

libary(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Truth or Bluff  Regression Model)')+
  xlab('Level')+
  ylab('Salary')
#ggsave('Truth or Bluff ('Regression Model.png')
