#' Comparaison des positions de depart et d'arrivee des pilotes
#'
#' @param data_sg data frame
#' @param data_driver_race data frame
#' @param grand_prix data frame
#'
#' @return graphique
#' @export
#'
PosDepArr <- function(data_sg, data_driver_race, grand_prix){

  #Récupération du grand prix
  l <- which(data_sg$GrandPrix == grand_prix)

  position_depart <- c()
  pilote_depart <- c()

  #Récupération des positions de départ du grand prix
  for (i in l){
    position_depart <- c(position_depart,data_sg$Position[i])
    pilote_depart <- c(pilote_depart,data_sg$Driver[i])
  }

  #Recodage des données en numeric
  position_depart <- as.numeric(position_depart)
  depart <- data.frame(position_depart,pilote_depart)

  #Récupération du grand prix
  lbis <- which(data_driver_race$GrandPrix == grand_prix)

  position_arrivee <- c()
  pilote_arrivee <- c()

  #Récupération des positions d'arrivée du grand prix
  for (i in lbis){
    position_arrivee <- c(position_arrivee,data_driver_race$Position[i])
    pilote_arrivee <- c(pilote_arrivee ,data_driver_race$Driver[i])
  }

  #Recodage des données en numeric
  position_arrivee <- as.numeric(position_arrivee)
  arrivee <- data.frame(position_arrivee,pilote_arrivee)

  #Data frame finales comportant les positions de départ et d'arrivée associées à chaque pilote
  g <- data.frame(depart,arrivee)

  #Graphe des position de départ et d'arrivée
  graphique <- ggplot(g, aes(x=position_depart, y=position_arrivee, color=pilote_depart)) +
    geom_point() +
    scale_x_continuous(name="Position de depart", breaks = c(1:20)) +
    scale_y_continuous(name="Position d'arrivee",breaks = c(1:20)) +
    geom_segment(aes(x = 0, y = 0, xend = 20, yend = 20),color="black") +
    labs(color = "Pilotes") +
    theme(plot.title = element_text(face = "bold",hjust = 0.5)) +
    ggtitle("Comparaison des positions de depart et \n d'arrivee des pilotes")
  graphique
  #Conversion en plotly
 ggplotly(graphique)

}
