#' Représentation de la somme des points gagnés par écurie par grand prix
#'
#' La data frame en paramètre doit faire parti des données représentées
#'sur la page https://www.formula1.com/en/results.html/2021/races.html
#'
#' @param data_race_driver data frame
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 theme_bw
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 guides
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 guide_legend

PointEcurieGP <- function(data_race_driver){

  #Récupération des écuries et des grands prix
  Ecurie <- unique(data_race_driver$Car)
  gp <- unique(data_race_driver$GrandPrix)

  #Initialisation des vecteurs
  somme <- c()
  ecurie <- c()
  GP <- c()

  #Somme des points des ecuries par Grand Prix
  for(i in gp){
    tmp_gp <- data_race_driver[data_race_driver$GrandPrix==i,c(7,9)]
    for(j in Ecurie){
      tmp_ecurie <- tmp_gp$Points[tmp_gp$Car==j]
      somme <- c(somme,sum(tmp_ecurie))
      ecurie <- c(ecurie,j)
      GP <- c(GP,i)
    }
  }

  #Data frame comportant les écuries, les grands prix et la somme des points gagnés par les écuries
  position_ecurie <- data.frame(Ecurie=ecurie,GrandPrix=GP,Points=somme)

  #Graphe de la sommes des points des écuries par Grand Prix
  gp <- position_ecurie$GrandPrix
  p <- position_ecurie$Points
  position_ecurie_graph <- ggplot(data = position_ecurie,aes(x=gp,y=p,group=Ecurie,colour=Ecurie))+
    geom_line()+
    theme_bw()+
    guides(fill=guide_legend("Ecuries"))+
    xlab("Grands Prix")+
    ylab("Nombre de points gagnes")+
    theme(plot.title=element_text(hjust=0.5,size=18,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme(legend.title = element_text(size=10))+
    theme(axis.text.x = element_text(face="bold", color="black", size=10, angle=30))

  #Conversion en plotly
  ggplotly(position_ecurie_graph)

}
