#' Représentation de la position finale des pilotes ayant fait le tour le plus rapide
#'
#'Les datas frames en paramètre doit faire parti des données représentées
#'sur la page https://www.formula1.com/en/results.html/2021/races.html
#'
#' @param data_driver_race data frame
#' @param data_fl data frame
#' @param data_races data frame
#' @param data_driver data frame
#'
#' @return diagramme en barre
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 scale_x_continuous
#' @importFrom ggplot2 scale_y_continuous
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text

PosFinalePilote <- function(data_driver_race,data_fl,data_races,data_driver){

  #Total du nombre de circuits
  total_circuit <- length(data_races$GrandPrix)

  #Total du nombre de pilotes
  total_pilote <- length(data_driver$Driver)

  #Liste de toutes les positions finales des pilotes ayant fait le tour le plus rapide
  liste_position <- c()
  for (i in (1:total_circuit)){
    grandprix <- data_fl$GrandPrix[i]
    driver <- data_fl$Driver[i]
    position <- which((data_driver_race$GrandPrix == grandprix) & (data_driver_race$Driver == driver))
    position_driver <- data_driver_race$Position[position]
    position_driver <- as.numeric(position_driver)
    liste_position <- c(liste_position,position_driver)
  }

  #On convertit les NA en 0
  liste_position[is.na(liste_position)] <- 0

  #data frame comprenant les fréquences des positions d'arrivées
  g <- Tri(liste_position)

  #Diagramme en barre des fréquences
  frequence <- g$frequence
  position_pilote <- g$modalite
  diagramme <- ggplot(g, aes(x=position_pilote, y=frequence,fill = position_pilote)) +
    geom_bar(stat = "identity",show.legend= F) +
    scale_x_continuous(name="Position finale des pilotes", breaks = c(1:total_pilote)) +
    scale_y_continuous(name="Frequence") +
    viridis::scale_fill_viridis(discrete=F,begin=0,end=1,option = "plasma") +
    theme(plot.title = element_text(face = "bold",hjust = 0.5))

 ggplotly(diagramme)
}
