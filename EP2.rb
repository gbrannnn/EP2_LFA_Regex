entrada = "Agendar com José e João reunião às 10:00 amanhã #trabalho, email: jose.da-silva@sp.senac.br, https://sp.senac.br/pag1#teste?aula=1&teste=4"

data = /([0-3]\d\sde\s[A-z]+(\sde\s\d{4})?)|([0-3]\d\/[0-3]\d(\/\d{4})?)|(hoje|amanhã|depois de amanhã)/.match(entrada)

horario = /([0-2]?[0-9](\s|:)[0-9]{2}\s?(horas|hora|h)?)|([0-9]{1,2}\s?(horas|hora|h))|(ás\s[0-9]{1,2})/.match(entrada)

hashtag = /#\w+/.match(entrada)

url = /(https?:\/\/([A-Za-z0-9-]+\.?)+\.[a-z]+)(\/([a-z0-9-]+#)?([a-z0-9-]+\??)((?<=\?)([a-z0-9-]+=[a-z0-9-]+&?)*)?)?/.match(entrada)

email = /(\w+(\.|\-|\_)*)+\@([A-z]+\.)+([A-z])+/.match(entrada)

nomes = entrada.scan(/(?:com\s|e\s|para\s)([[:alpha:]]+)/i)

verbos = /(([A-z])+r|reunião)(?=\s)/.match(entrada)

saida = ""
saida = !data.nil? ? "Data: #{data}\n" : ""
saida += !horario.nil? ? "Horário: #{horario}\n" : ""
saida += !nomes.nil? ? "Pessoa: #{nomes.flatten}\n" : ""
saida += !email.nil? ? "Email: #{email}\n" : ""
saida += !verbos.nil? ? "Ação: #{verbos}\n" : ""
saida += !url.nil? ? "Url: #{url}\n" : ""
saida += !hashtag.nil? ? "Hashtag: #{hashtag}": ""

puts saida