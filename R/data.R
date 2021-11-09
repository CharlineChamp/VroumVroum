#' Data Drivers par Races
#'
#' Donne le résultat de toutes les courses de F1 de 1950 à 2020
#'
#' @format Une data frame avec sept variables :
#' \describe{
#' \item{\code{Indice}}{Indice des lignes}
#' \item{\code{Driver}}{Nom des pilotes}
#' \item{\code{GrandPrix}}{Nom des Grand Prix}
#' \item{\code{Year}}{Années}
#' \item{\code{Car}}{Nom des écuries}
#' \item{\code{Position}}{Positions finales des pilotes}
#' \item{\code{Points}}{Points gagnés par les pilotes}
#' }
"dataDriversParRaces"

#' Data Drivers
#'
#' Classement final des pilotes de 1950 à 2020
#'
#' @format Une data frame avec cinq variables:
#' \describe{
#' \item{\code{Year}}{Années}
#' \item{\code{Postion}}{Position finale des pilotes par année}
#' \item{\code{Driver}}{Nom des pilotes}
#' \item{\code{Car}}{Nom des écuries}
#' \item{\code{Points}}{Nombre de points gagnés par les pilotes par année}
#' }
"dataDrivers"

#' Data Teams
#'
#' Classement des écuries de 1958 à 2020
#'
#' @format Une data frame avec quatre variables:
#' \describe{
#' \item{\code{Year}}{Années}
#' \item{\code{Position}}{Position finale des écuries par année}
#' \item{\code{Team}}{Nom des écuries}
#' \item{\code{Points}}{Nombres de points gagnés par les écuries par année}
#' }
"dataTeams"

#' Data Starting Grid
#'
#' Position de départ de chaque pilotes pour chaque Grand Prix de 1950 à 2020
#'
#' @format Une data frame avec cinq variables :
#' \describe{
#' \item{\code{Year}}{Années}
#' \item{\code{GrandPrix}}{Nom de Grand Prix}
#' \item{\code{Position}}{Positions de départ}
#' \item{\code{Driver}}{Nom des pilotes}
#' \item{\code{Car}}{Nom des écuries}
#' }
"dataStartingGrid"

#' Data Fastest Lap (DataFL)
#'
#' Tour le plus rapide pour chaque Grand Prix de 1950-2020
#'
#' @format Une data frame avec cinq variables :
#' \describe{
#' \item{\code{Year}}{Années}
#' \item{\code{GrandPrix}}{Nom de Grand Prix}
#' \item{\code{Driver}}{Nom des pilotes}
#' \item{\code{Car}}{Nom des écuries}
#' \item{\code{Time}}{Temps du tour le plus rapide}
#' }
"dataFL"

#' Data Races
#'
#' Données sur chaque Grand Prix de 1950 à 2020
#'
#' @format Une data frame avec sept variables :
#' \describe{
#' \item{\code{GrandPrix}}{Nom des Grand Prix}
#' \item{\code{Date}}{Date des Grand Prix}
#' \item{\code{Year}}{Année}
#' \item{\code{Winner}}{Vainqueur du Grand Prix}
#' \item{\code{Car}}{Nom des écuries}
#' \item{\code{Laps}}{Nombre de tours}
#' \item{\code{Time}}{Temps du vainqueur}
#' }
"dataRaces"


