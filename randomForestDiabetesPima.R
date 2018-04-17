library(randomForest)
library(plotly)
random_f_diabetes=randomForest(Outcome~Insulin+SkinThickness+BloodPressure+Glucose+Age+Pregnancies+BMI,data = diabetes_set_pima,method = "class")
predict_randomforest=predict(random_f_diabetes,testpima,type="class")
testpima$outcome_random_forest<-round(predict_randomforest)
#outcomedata=data.frame(testpima$ID,testpima$outcome_random_forest,testpima$Outcome)
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#7f7f7f"
)
x <- list(
  title = "ID's Diabetic Patients",
  titlefont = f
)
y <- list(
  title = "",
  titlefont = f
)
p<-plot_ly(outcomedata,y=~testpima$ID[testpima$Outcome==1],name='Original Data',type = "scatter",mode='lines+markers') %>%
  add_trace(y=~testpima$ID[testpima$outcome_random_forest==1],name='Predicted',mode='lines') %>%
  layout(xaxis = x, yaxis = y)
p
plot(random_f_diabetes)