#' Nombre de DNF et DNS de chaque pilote
#'
#' @param data_driver_races data
#'
#' @return graphique
#' @export
#'

DNFDriver <- function(data_driver_races){

  #Récupération des pilotes qui on été DNF/DNS
  DNF <- data_driver_races$Driver[data_driver_races$Position=='DNF']
  DNS <- data_driver_races$Driver[data_driver_races$Position=='DNS']

  #data frame des DNF/DNS
  total<-data.frame(modalite=as.factor(c(DNF,DNS)))

  #Diagramme en barre des proportions de DNF/DNS par pilote
  modalite <- total$modalite
  DNF_S_pilote <- ggplot(data=total,aes(modalite))+
    geom_bar(aes(fill=modalite))+
    ggtitle("Nombre de DNF et DNS de chaque pilote")+
    labs(fill="Pilotes")+
    xlab("Pilotes")+
    ylab("Nombre de DNF et DNS")+
    theme(plot.title=element_text(hjust=0.5,size=25,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.text.x = element_text(face="bold", color="black", size=10, angle=30))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme(legend.title = element_text(size=15))

  #Conversion en plotly
  ggplotly(DNF_S_pilote)
}
