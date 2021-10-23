#' Nombre de DNF et DNS de chaque grand prix
#'
#' @param data_race_driver data frame
#' @param data_race data frame
#'
#' @return graphique
#' @export
#'

DNFGrandPrix <- function(data_race_driver,data_race){

  #Récupération des DNF/DNS
  DNF <- data_race_driver$GrandPrix[data_race_driver$Position=='DNF']
  DNS <- data_race_driver$GrandPrix[data_race_driver$Position=='DNS']


  #Data frame comportant la proportion de DNF/DNS par grands prix
  total <- data.frame(modalite=as.factor(c(DNF,DNS)))

  #Diagramme en barre des DNF/DNS par grand prix
  DNF_S <- ggplot(data=total,aes("modalite"))+
    geom_bar(aes(fill="modalite"))+
    scale_x_discrete(limits=unique(data_race$GrandPrix))+
    ggtitle("Nombre de DNF et DNS de chaque grand prix")+
    labs(fill="Grands prix")+
    xlab("Grands Prix")+
    ylab("Nombre de DNF et DNS")+
    theme(plot.title=element_text(hjust=0.5,size=25,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme(legend.title = element_text(size=15))+
    theme(axis.text.x = element_text(face="bold", color="black", size=10, angle=30))

  #Conversion en plotly
  ggplotly(DNF_S)

}
