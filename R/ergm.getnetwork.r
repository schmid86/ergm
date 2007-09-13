ergm.getnetwork <- function (formula) {
  current.warn <- options()$warn
  options(warn=0)
  if ((dc<-data.class(formula)) != "formula")
    stop (paste("Invalid formula of class ",dc))
  trms<-terms(formula)
  if (trms[[1]]!="~")
    stop ("Formula must be of the form 'network ~ model'.")

  nw.env<-environment(formula)
  nw <- try(as.network(eval(trms[[2]],nw.env), silent = TRUE))  
  if(inherits(nw,"try-error")){
      stop("Invalid network. Is the left-hand-side of the formula correct?")
  }
  options(warn=current.warn)
  nw
}
