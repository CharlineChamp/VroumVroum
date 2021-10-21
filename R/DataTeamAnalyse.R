library(plotly)
library(dplyr)
#' Fonction Analyse des données pour les écuries
#'
#' Renvoie un donut chart qui représente la fréquence des victoires
#' des écuries sur une ou plusieurs années.
#' La data frame en paramètre doit faire parti des données représentées
#'sur la page https://www.formula1.com/en/results.html/2021/races.html
#'
#' @param data data frame spécifique
#'
#' @return donut chart
#' @export
#'
DataTeamAnalyse <- function(data){
  listTeamWinner <- which(data$Position=="1")
  cars <- c()
  for(i in listTeamWinner){
    cars <- c(cars,data$Car[i])
  }
  car <- as.factor(cars)
  TeamWinner <- Tri(car)
  TeamWinner$ymin = c(0, head(TeamWinner$ymax, n=-1))
  TeamWinner$ymax = cumsum(TeamWinner$frequence)
  TeamWinner <- TeamWinner %>% group_by(modalite)
  fig <- TeamWinner %>% plot_ly(labels = ~modalite, values = ~frequence)
  fig <- fig %>% add_pie(hole = .5)
  fig <- fig %>% layout(showlegend = T,
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig <- fig %>% layout(legend = list(title=list(text='<b> Écuries </b>')))
  fig
}
