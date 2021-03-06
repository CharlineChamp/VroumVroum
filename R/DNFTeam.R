#' Pourcentage de victoires par écurrie
#'
#' Affichage d’un diagramme circulaire, réalisé sous plotly, représentant le pourcentage d'abandon pour chaque écuries lors d'une saison. Les données doivent être issues de la data frame dataDriversParRaces.
#'
#' @param data data frame
#'
#' @return graphique
#' @export
#' @importFrom utils head
#' @import dplyr
#' @importFrom plotly layout
#' @importFrom plotly add_pie
#' @importFrom plotly plot_ly

DNFTeam <-  function(data){

  #Récupération des lignes associées aux DNF/DNS
  listDNFTeam <- which(data$Position=="DNF")
  listDNSTeam <- which(data$Position=="DNS")

  #Fusion des listes
  DNFS <- sort(c(listDNFTeam,listDNSTeam))

  DNFT <- c()
  for(i in DNFS){
    DNFT <- c(DNFT,data$Car[i])
  }

  DNF <- as.factor(DNFT)
  DNFTeam <- Tri(DNF)

  #Compute the bottom of each rectangle
  DNFTeam$ymin = c(0, head(DNFTeam$ymax, n=-1))

  #Compute the cumulative percentages (top of each rectangle)
  DNFTeam$ymax = cumsum(DNFTeam$frequence)

  #Donut chart avec plotly
  DNFTeam <- DNFTeam %>% group_by("modalite")
  fig <- DNFTeam %>% plot_ly(labels = ~modalite, values = ~frequence)
  fig <- fig %>% add_pie(hole = .5)
  fig <- fig %>% layout(showlegend = T,
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig <- fig %>% layout(legend = list(title=list(text='<b> Ecuries </b>')))
  fig
}
