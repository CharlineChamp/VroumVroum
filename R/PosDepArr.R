#' Comparaison des positions de depart et d'arrivee des pilotes
#'
#' Affichage d’un nuage de points, réalisé sous plotly et ggplot2, représentant la position d'arrivée d'un pilote en fonction de sa position de départ sur un grand prix. Les données doivent être issues des data frames dataStartingGrid et dataDriversParRaces.
#'
#' @param data_sg data frame
#' @param data_driver_race data frame
#' @param grand_prix data frame
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 ggtitle
#' @importFrom ggplot2 scale_x_continuous
#' @importFrom ggplot2 scale_y_continuous
#' @importFrom ggplot2 geom_segment
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text

PosDepArr <- function(data_sg, data_driver_race, grand_prix){

  #Récupération du grand prix
  l <- data_sg[data_sg$GrandPrix == grand_prix,]

  #Récupération des positions de départ du grand prix
  position_depart <- as.numeric(l$Position)
  pilote_depart <- l$Driver
  depart <- data.frame(position_depart,pilote_depart)

  #Récupération du grand prix
  lbis <- data_driver_race[data_driver_race$GrandPrix == grand_prix,]

  #Récupération des positions d'arrivée du grand prix
  position_arrivee <- as.numeric(lbis$Position)
  pilote_arrivee <- lbis$Driver
  arrivee <- data.frame(position_arrivee,pilote_arrivee)

  #Data frame finales comportant les positions de départ et d'arrivée associées Ã  chaque pilote
  g <- data.frame(depart[order(pilote_depart),],position_arrivee=arrivee[order(pilote_arrivee),]$position_arrivee)

  #Graphe des position de départ et d'arrivée
  graphique <- ggplot(g, aes(x=position_depart, y=position_arrivee, color=pilote_depart)) +
    geom_point() +
    geom_segment(aes(x = 0, y = 0, xend = length(position_depart), yend = length(position_depart)),color="black") +
    labs(color = "Pilotes") +
    theme(plot.title = element_text(face = "bold",hjust = 0.5))

  #Conversion en plotly
  ggplotly(graphique)

}
