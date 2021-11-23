#' Représentation des données pour les écuries
#'
#' Affichage d’un graphique sous plotly représentant le pourcentage de victoire des écuries sur une saison. Les données doivent être issues de la data frame dataTeams.
#'
#' @param data data frame
#'
#' @return donut chart
#' @export
#' @importFrom utils head
#' @import dplyr
#' @importFrom plotly layout
#' @importFrom plotly add_pie
#' @importFrom plotly plot_ly

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
  TeamWinner <- TeamWinner %>% group_by("modalite")
  fig <- TeamWinner %>% plot_ly(labels = ~modalite, values = ~frequence)
  fig <- fig %>% add_pie(hole = .5)
  fig <- fig %>% layout(showlegend = T,
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig <- fig %>% layout(legend = list(title=list(text='<b> Ecuries </b>')))
  fig
}
