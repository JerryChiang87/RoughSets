% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FeatureSelection.Experimental.R
\name{BC.discernibility.positive.mat.RST}
\alias{BC.discernibility.positive.mat.RST}
\title{Computation of a positive decision-relative discernibility matrix based on the rough set theory}
\usage{
BC.discernibility.positive.mat.RST(
  decision.table,
  return.matrix = FALSE,
  attach.data = FALSE
)
}
\arguments{
\item{decision.table}{an object inheriting from the \code{DecisionTable} class, which represents a decision system. 
See \code{\link{SF.asDecisionTable}}.}

\item{return.matrix}{a logical value determining whether the discernibility matrix should be retunred in the output. 
If it is set to FALSE (the default) only a list containing unique clauses from the CNF representation 
of the discernibility function is returned.}

\item{attach.data}{a logical indicating whether the original decision table should be attached as 
an additional element of the resulting list named as \code{dec.table}.}
}
\value{
An object of a class \code{DiscernibilityMatrix} which has the following components: 
\itemize{
\item \code{disc.mat}: the decision-relative discernibility matrix which for pairs of objects from different 
      decision classes stores names of attributes which can be used to discern between them. Only pairs of 
      objects from different decision classes are considered. For other pairs the \code{disc.mat} contains
      \code{NA} values. Moreover, since the classical discernibility matrix is symmetric only the pairs 
      from the lower triangular part are considered.
\item \code{disc.list}: a list containing unique clauses from the CNF representation of the discernibility 
      function,
\item \code{dec.table}: an object of a class \code{DecisionTable}, which was used to compute the
      discernibility matrix,
\item \code{discernibility.type}: a type of discernibility relation used in the computations,
\item \code{type.model}: a character vector identifying the type of model which was used. 
               In this case, it is \code{"RST"} which means the rough set theory.
}
}
\description{
This function implements a positive decision-relative discernibility matrix. This notion
was proposed by (Sikora et al.) as a middle-step in many RST algorithms for computaion of reducts, 
discretization and rule induction in a case when the discernibility of objects from the positive class 
by positive attribute values is more desirable than by the negative ones. The implementation currently 
works only for binary decision system (all attributes, including the decision must be binary
and the positive value is marked by "1").
}
\examples{
###############################################################################
## Example 1: Constructing the positive decision-relative discernibility matrix
###############################################################################
data(RoughSetData)
binary.dt <- RoughSetData$binary.dt

## building the decision-relation discernibility matrix
disc.matrix <- BC.discernibility.positive.mat.RST(binary.dt, return.matrix = TRUE)
disc.matrix$disc.mat

## compute all classical reducts
classic.reducts <- FS.all.reducts.computation(BC.discernibility.mat.RST(binary.dt))
head(classic.reducts$decision.reduct)
cat("A total number of reducts found: ", 
    length(classic.reducts$decision.reduct), "\n", sep = "")
classic.reducts$core

## compute all positive reducts
positive.reducts <- FS.all.reducts.computation(disc.matrix)
head(positive.reducts$decision.reduct)
cat("A total number of positive reducts found: ", 
    length(positive.reducts$decision.reduct), "\n", sep = "")
print("The core:")
positive.reducts$core

}
\references{
TO BE ADDED
}
\seealso{
\code{\link{BC.IND.relation.RST}}, \code{\link{BC.LU.approximation.RST}}, \code{\link{BC.LU.approximation.FRST}}
         and \code{\link{BC.discernibility.mat.FRST}}
}
\author{
Andrzej Janusz and Dominik Slezak
}
