#' Représentation des points gagnes par pilote par grand prix
#'
#' @param data_driver_race data frame
#' @param data_race dataframe
#'
#' @return graphique
#' @export
#' @import plotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 ggtitle
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
  GrandPrix <- as.factor(unique(data_race$GrandPrix))
  Driver <- as.factor(data_driver_race$Driver)

  #Création de la data frame comprenant ces données
  data <- data.frame(GrandPrix,Points,Driver)

  #Plot des courbes des pilotes (nombre de ppints en fonction de chaque gp)
  DriversparRaces <- ggplot(data=data,aes(x=GrandPrix,y=Points,group=Driver,colour=Driver))+
    geom_line()+
    theme_bw()+
    scale_x_discrete(limits=unique(GrandPrix))+
    ggtitle("Representation des points gagnes par pilote par grand prix")+
    # labs(colour="Pilotes")+
    xlab("Grands Prix")+
    ylab("Nombre de points gagnes")+
    theme(plot.title=element_text(hjust=0.5,size=18,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme(legend.title = element_text(size=10))+
    theme(axis.text.x = element_text(face="bold", color="black", size=10, angle=30))
  #Conversion en plotly
  plotly::ggplotly(DriversparRaces)

}
