#' Nombre de DNF et DNS de chaque grand prix
#'
#' Affichage d’un diagramme en barre, réalisé sous plotly et ggplot2, représentant le nombre d'abandons par grand prix sur une saison. Les données doivent être issues de la data frame dataDriversParRaces.
#'
#' @param data_race_driver data frame
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text


DNFGrandPrix <- function(data_race_driver){

  #Récupération des DNF/DNS
  DNF <- data_race_driver$GrandPrix[data_race_driver$Position=='DNF']
  DNS <- data_race_driver$GrandPrix[data_race_driver$Position=='DNS']


  #Data frame comportant la proportion de DNF/DNS par grands prix
  total <- data.frame(modalite=table(as.factor(c(DNF,DNS))))
  colnames(total) <- c("modalite","frequence")

  #Diagramme en barre des DNF/DNS par grand prix
  modalite <- total$modalite
  frequence <- total$frequence
  DNF_S <- ggplot(data=total,aes(x = modalite,y = frequence,fill=modalite))+
    geom_bar(stat="identity")+
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
