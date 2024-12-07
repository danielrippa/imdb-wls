
  { argc, argv } = dependency 'Args'
  { writeln } = dependency 'IO'
  { get } = dependency 'Http'
  { elem-with-attr } = dependency 'Xml'

  if argc > 1

    section = argv.0
    id = argv.1

    if argc > 2

      path = "#section/#id/#{ argv.2 }"

      attribute-type = 'id'
      attribute-value = '__NEXT_DATA__'

    else

      path = "#section/#id"

      attribute-type = 'type'
      attribute-value = 'application\\/ld\\+json'

    { status, response } = get "https://www.imdb.com/#path/"

    if status is 200

      for json in elem-with-attr response, 'script', attribute-type, attribute-value

        writeln json