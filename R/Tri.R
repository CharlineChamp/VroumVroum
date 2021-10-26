#' Fonction Tri
#'
#' @param l factor
#'
#' @return data frame
#' @export
#'
#' @examples
#' Tri(c(23,45,5,43,4,1,3,4,0,0,0,6,5,23,-1))

Tri <- function (l){
  eff <- c(table(l))
  freq <- c(prop.table(table(l)))
  mod <- unique(sort(l))
  df <- data.frame(modalite = mod, effectif = eff,frequence = freq)
  rownames(df) = NULL
  df
}
