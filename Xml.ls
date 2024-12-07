
  do ->

    { double-quotes } = dependency 'String'

    regexp = -> new RegExp it, 'g'

    #

    elem-with-attr-regex = (tag-name, attribute-name, attribute-value) ->

      attribute = "#attribute-name=#{ double-quotes attribute-value }"

      opening-tag = "<#tag-name.*?#attribute.*?>"

      content = "(.*?)"

      closing-tag = "</#tag-name>"

      regex = regexp "#opening-tag#content#closing-tag"

    #

    elem-with-attr = (string, tag-name, attribute-name, attribute-value) ->

      regex = elem-with-attr-regex tag-name, attribute-name, attribute-value

      strings = []

      loop

        found = regex.exec string

        break unless found?

        strings.push found.1

      strings

    {
      elem-with-attr
    }
