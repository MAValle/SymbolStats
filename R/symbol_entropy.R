#' Estimate symbol entropy.
#'
#' Performs the estimation of symbol entropy, for symbols of predefined length `L` on a binary sequence data`.
#'
#' @param data A sequence of binary vector of 0s and 1s.
#' @param L The length of the symbol.
#' @param overlap A number with the length of the overlap. The overlap has to be grater than 0 and less or equal than L. If overlap is L, then there is no overlapping. If overlap is 1, then the starting value to compute the next variation will be p(t+1).
#'
# Add returning value description and tag
#' @returns A list with 1. table with all symbols, 2. the entropy, and 3. maximum theoretical entropy.
# Export this function
#' @export
#' @importFrom stats complete.cases
#' @examples
#' # Estimate the entropy of symbols of length L=3, over a binary sequence of
#' # 99 bits, with overlapping of 1.
#' rs <- symbol_entropy(data = sample(c(0,1), 99, replace=TRUE), L = 3, overlap=1)
#'

symbol_entropy <-
function(data, L=3, overlap) {
  try(if ( !is.vector(data) ) stop('Data to by computed is not a vector.', call. = FALSE) )
  try(if ( L <= 1 ) stop('The length "L" of the symbol should be greater or equal than 2.', call. = FALSE) )
  try(if ( overlap < 1 ) stop('The argument "overlap" must be greater or equal than 1.', call. = FALSE) )
  try(if ( overlap > L ) stop('The argument "overlap" cannot be grater than the lenght of the symbol!!', call. = FALSE) )

  # encontrar los sumbolos
  symbols <- data.frame(matrix(nrow = 0, ncol = 0))
  cont = 1
  ini = 1
  fin = cont + L - 1
  while ( fin <= length(data) ) {
    temp <- as.data.frame(   t( as.matrix( data[ini:fin] ) )  )
    symbols <- rbind(symbols, temp)
    cont = cont + 1
    ini = ini + overlap
    fin = ini + L - 1
  }
  symbols <- symbols[complete.cases(symbols), ]

  # ahora contemos los estados
  Xcollapsed <- apply(symbols,1,paste,collapse='')
  # luego contar cuantos hay de cada uno.
  sort(table(Xcollapsed), decreasing=TRUE)
  table(Xcollapsed)
  freqs <- as.numeric(table(Xcollapsed))/sum(as.numeric(table(Xcollapsed)))

  # Entropias
  Hs <- -sum(freqs*log(freqs))
  # calculo de entropia maxima:
  Hmax <- -log(1/(2**L))
  cat('\n The symbol entropy H(s) is: ', Hs, ' H(s) theorical max is : ', Hmax)

  return(list(table = table(Xcollapsed), Hs=Hs, Hmax=Hmax ))


}
