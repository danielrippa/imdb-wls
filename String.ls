
  do ->

    affix = (stem, prefix = '', suffix = prefix) -> "#prefix#stem#suffix"

    prepend = (stem, prefix) -> affix stem, prefix, ''
    append  = (stem, suffix) -> affix stem, '', suffix

    #

    single-quotes = -> it `affix` "'"
    double-quotes = -> it `affix` '"'

    circumfix = (stem, [ prefix, suffix ]) -> affix stem, prefix, suffix

    parens = -> it `circumfix` <[ ( ) ]>
    braces = -> it `circumfix` <[ { } ]>

    square-brackets = -> it `circumfix` <[ [ ] ]>
    angle-brackets  = -> it `circumfix` <[ < > ]>

    {
      affix, prepend, append,
      single-quotes, double-quotes,
      circumfix,
      parens, braces,
      square-brackets, angle-brackets
    }