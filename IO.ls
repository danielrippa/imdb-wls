
  do ->

    write = -> WScript.StdOut.Write [ ("#arg") for arg in arguments ] * ' '

    writeln = -> write ... ; write '\n'

    {
      writeln
    }