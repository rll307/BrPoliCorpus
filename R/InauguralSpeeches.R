#' Data of all Inaugural Speeches delivered by Brazilian Presidents
#'
#' Traditionally all Brazilians presidents delivers a speech to the nation at the first day in office. I a few occasions, speeches were not delivered due to
#' 
#' 1. Death of the president (Tancredo Neves is an example)
#' 2. Coup the state
#' 
#' In the case of 1, the Vice president José Sarney took office and delivered the speech. In the case of 2, the speeches were not included. 
#' 
#'
#' @format A Data frame  34 rows and 14 columns
#' \describe{
#'   \item{`Discourse_Number`}{dbl ordering number}
#'   \item{`President_Terms` }{dbl Which term this diuscourse is about. Some presidents served more than one time} 
#'   \item{`Full_Name`}{chr President's full name}
#'   \item{`Political_Name`}{chr President's name on the ballot}
#'   \item{`Term_Begins`}{Date denoting the frist day in office}
#'   \item{`Term_ends`}{Date denoting the last day in office}
#'   \item{`Party`}{crh denoting the name of the party the president was. Absent in coups the stat. }
#'   \item{`Party_abbreviation`}{chr  denoting the party abbreviation. Due to the many changes in the Brazilian Political system, an year after the name means an old and exting party}
#'   \item{`Raise_to_power`}{chr denoting how each president came to power}
#'   \item{`Democratically_elected`}{logi denoting if the president was Democratically_elected}
#'   \item{`Military`}{logi denoting if the president was civil or militar.}
#'   \item{`Period`}{dbl denoting the historical period of the presidents, according to the coup or demicratic system at the time}
#'   \item{`text`}{chr denoting the speech itself}
#'   
#' }
#' @source \url{https://www12.senado.leg.br/} and \url{https://www.gov.br/planalto/pt-br}
"InauguralSpeeches"