#' Nombre de points moyens par grand prix de chaque pilote
#'
#' @param datadrivers data frame
#' @param dataraces data frame
#'
#' @return graphique
#' @export
#' @importFrom plotly ggplotly
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 ggtitle
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 theme_classic
#' @importFrom ggplot2 scale_x_discrete
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 element_text

Pts_moyens_Driver_GP <-function(datadrivers,dataraces){

  #On récupère les années.
  year<-unique(dataraces$Year)
  GP_annee<-rep(0,length(year))

  for(i in (1:length(year))){
    #GP_annee stocke le nombre de grand prix par année
    GP_annee[i]<-length(dataraces$Year[dataraces$Year==year[i]])
  }
  #On crée notre data frame où on associe au Driver l'année.
  data_driver_pts <-data.frame(Driver=paste0(datadrivers$Driver," ",datadrivers$Year),Points=datadrivers$Points)
  freq<-c()
  for(i in 1:length(year)){
    #On crée un vecteur freq de la même taille que le nombre de lignes de la data.frame.
    freq<-c(freq,rep(GP_annee[i],length(datadrivers$Year[datadrivers$Year==year[i]])))
  }
  #On divise le nombre de pts par le nombre de grand prix pour obtenir les points moyens.
  data_driver_pts$Points<-data_driver_pts$Points/freq

  Driver <- data_driver_pts$Driver
  Points <- data_driver_pts$Points
  driver_pts_gp <- ggplot(data=data_driver_pts,aes(x=Driver,y=Points,fill=Driver))+
    geom_bar(stat="identity")+
    ggtitle("Nombre de points moyens par grand prix de chaque pilote")+
    labs(fill="Pilotes")+
    xlab("Pilotes")+
    ylab("Nombre de points moyens")+
    #On supprime l'abscisse qui contient le nom des pilotes. Ceux si sont dans la légende.
    scale_x_discrete(labels=c(rep("",length(data_driver_pts$Driver))))+
    theme(plot.title=element_text(hjust=0.5,size=25,face="bold"))+
    theme(axis.title.x = element_text(hjust=0.5,size=15))+
    theme(axis.title.y=element_text(hjust=0.5,size=15))+
    theme_classic()+
    theme(legend.title = element_text(size=15))

  ggplotly(driver_pts_gp)
}
