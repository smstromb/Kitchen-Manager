from BeautifulSoup import BeautifulSoup
import json

json_data = open('recipeUrls.json')
recipeJson = json.load(json_data)

i = 0

output = open("recipeData.json", "a")

output.write('{"recipes":[');

for recipeHtml in recipeJson['cards']:
	recipeSoup = BeautifulSoup(recipeHtml)
	
	recipeURL = 'http://punchfork.com' + recipeSoup.a['href']
	recipeThumbnail = recipeSoup.img['src']

	output.write('{"url":"'+recipeURL+'","thumbnail":"'+recipeThumbnail+'"},')

	i=i+1
	
	print i
	
output.write(']}')	
	
json_data.close()

