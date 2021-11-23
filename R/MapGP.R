#' Carte des emplacements des Grands Prix
#'
#' @param data data frame
#'
#' @return map
#' @export
#' @import leaflet
#' @importFrom sp SpatialPointsDataFrame

MapGP <- function(data){
  #Création notre data frame spatiale
  df <- sp::SpatialPointsDataFrame(
    cbind((data$Lng), (data$Lat)),
    data.frame(type = factor(1:length(data$Lng))))

  Icon <- makeIcon(iconUrl = "circuit.png",iconWidth= 18,iconHeight= 18)
  #Création de la carte interactive
  leaflet(df) %>% addTiles()%>% addMarkers(icon = Icon,lng=data$Lng,lat=data$Lat,popup=data$Circuit) %>%addProviderTiles("CartoDB.DarkMatter")

}
