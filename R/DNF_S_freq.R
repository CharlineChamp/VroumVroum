#' Fréquence de DNF/DNS de chaque pilote entre 2 années sélectionnées en amont
#'
#' Affichage d’un diagramme en barre, réalisé sous plotly et ggplot2, représentant la fréquence d'abandon de chaque pilotes entre deux années choisies. Les données doivent être issues de la data frame dataDriversParRaces.
#'
#'
#' @param dataDrivers data frame
#' @param annee_inf data frame
#' @param annee_sup int
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_classic
#' @importFrom ggplot2 scale_x_discrete
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text

DNF_S_freq <- function(dataDrivers,annee_inf,annee_sup){
  #Fréquence de DNF/DNS de chaque pilote entre 2 années sélectionnées en amont.
  #Un pilote apparer seulement s'il a au moins une fois DNF/DNS.

  #On récupÃ¨re les noms des personnes qui ont DNF et DNS.
  dataDrivers<- filter(dataDrivers, dataDrivers$Year >= annee_inf)
  dataDrivers<- filter(dataDrivers, dataDrivers$Year <= annee_sup)
  DNF <- dataDrivers$Driver[dataDrivers$Position=='DNF']
  DNS <- dataDrivers$Driver[dataDrivers$Position=='DNS']

  #On crée la data frame pour le graphique
  total2 <- as.data.frame(table(c(DNF,DNS)))
  colnames(total2) <- c("modalite","frequence")

  liste_driver <- total2$modalite
  #On calcule le nombre de grands prix qu'a fait chaque pilote qui a au moins DNF/DNS.
  nbr_grandprix <- rep(0,length(liste_driver))
  for(i in 1:length(nbr_grandprix)){
    nbr_grandprix[i] <- length(dataDrivers$GrandPrix[dataDrivers$Driver==liste_driver[i]])
  }
  #On calcule la fréquence.
  total2$frequence <- total2$frequence/nbr_grandprix

  #On crée un diagramme en barres des fréquences de DNF/DNS de chaque pilote.
  modalite <- total2$modalite
  frequence <- total2$frequence
  DNF_S_pilote <- ggplot(data=total2,aes(x=modalite,y=frequence,fill=modalite))+
    geom_bar(stat="identity")+
    labs(fill="Pilotes")+
    xlab("Pilotes")+
    ylab("Nombre de DNF et DNS")+
    #On supprime l'abscisse qui contient le nom des pilotes. Ceux si sont dans la légende.
    scale_x_discrete(labels=c(rep("",length(total2$modalite))))+
    theme(plot.title=element_text(hjust=0.5,size=25,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme_classic()+
    theme(legend.title = element_text(size=15))

  #Affichage du ggplot avec ggplotly pour une interactivité avec le diagramme.
  ggplotly(DNF_S_pilote)
}
