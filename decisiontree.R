library(rpart)
library(plotly)
library(rpart.plot)
library(RColorBrewer)
regression_tree=rpart(Outcome~Insulin+SkinThickness+BloodPressure+Glucose+Age+Pregnancies+BMI,data = diabetes_set_pima,method = "class")
prp(regression_tree)
testpima$outcome1<-predict(regression_tree,testpima,type = "class")
outcomedata=data.frame(testpima$ID,testpima$Outcome,testpima$Outcome1)
print(outcomedata)
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#7f7f7f"
)
x <- list(
  title = "ID's of Diabetic patients",
  titlefont = f
)
y <- list(
  title = "",
  titlefont = f
)
p<-plot_ly(testpima,y=~testpima$ID[testpima$Outcome==1],name='Original Data',type = "scatter",mode='lines') %>%
  add_trace(y=~testpima$ID[testpima$Outcome1==1],name='Predicted',mode='lines') %>%
  layout(xaxis = x, yaxis = y)
p