#' Représentation des points gagnés par pilote par grand prix
#'
#'Affichage d’un graphique réalisé avec plotly et ggplot2 représentant le nombre de points gagnés de chaque pilote par grand prix sur une saison. Les données doivent être issues des data frames dataDriversParRaces et dataRaces.
#'
#' @param data_driver_race data frame
#' @param data_race dataframe
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_bw
#' @importFrom ggplot2 scale_x_discrete
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text

PointDriverGP <- function(data_driver_race, data_race){

  #Récupération des points, des Grands Prix et des pilotes
  Points <- as.numeric(data_driver_race$Points)
  GrandPrix <- data_driver_race$GrandPrix
  Driver <- data_driver_race$Driver

  #Création de la data frame comprenant ces données
  data <- data.frame(GrandPrix,Points,Driver)

  #Plot des courbes des pilotes (nombre de ppints en fonction de chaque gp)
  DriversparRaces <- ggplot(data=data,aes(x=GrandPrix,y=Points,group=Driver,colour=Driver))+
    geom_line()+
    theme_bw()+
    scale_x_discrete(limits=unique(data_race$GrandPrix))+
    labs(colour="Pilotes")+
    xlab("Grands Prix")+
    ylab("Nombre de points gagnes")+
    theme(plot.title=element_text(hjust=0.5,size=18,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme(legend.title = element_text(size=10))+
    theme(axis.text.x = element_text(face="bold", color="black", size=10, angle=30))
  #Conversion en plotly
  ggplotly(DriversparRaces)

}
