from BeautifulSoup import BeautifulSoup
import json
import urllib
import types
import unicodedata

json_data = open('recipeData.json')
recipeUrlJson = json.load(json_data)

i = 0

output = open("recipehtml.html", "a")

output.write('{"recipes":[');

for i in range(len(recipeUrlJson["recipes"])):

	recipeURL = recipeUrlJson["recipes"][i]["url"]
	recipeThumbnail = recipeUrlJson["recipes"][i]["thumbnail"]
	
	print "/////////////////"
	print recipeURL
	print "/////////////////"
	
	recipeHttp = urllib.urlopen(recipeURL)
	
	recipeSoup = BeautifulSoup(recipeHttp.read())
	
	recipeName = recipeSoup.find("h1", {"itemprop": "name"}).string
	
	ingredients = recipeSoup.find("div", {"id": "categorized-ingredients"})
	ingredientGroups = ingredients.findAll("ul")
	ingredientGroups.pop(0)
	
	
	output.write('{"recipeName":"'+recipeName+'", "recipeThumbnail":"'+recipeThumbnail+'", "ingredients":[')
	
	for ingGroup in ingredientGroups:
		groupName = ingGroup.find("span", {"class": "ingredient-group"})
		
		if groupName is None:
			groupName = "Other"
		else:
			groupName = groupName.string
		
		ingredients = ingGroup.findAll("li", {"itemprop": "ingredients"})
		
		for j in range(len(ingredients)):
			ingredient = ingredients[j]
			ingredientName = ingredient.find("span", {"class": "ingredient-name"})
			ingredientValue = ingredient.find("span", {"class": "ingredient-n"})
			ingredientUnit = ingredient.find("span", {"class": "ingredient-unit"})
			
			if ingredientName is not None:
				ingredientName = ingredientName.string
				ingredientName = unicodedata.normalize('NFKD', ingredientName).encode('ascii','ignore')
				
				print ingredientName
				
				if ingredientValue is None:
					ingredientValue  = '';
				else:
					ingredientValue = ingredientValue.string
				
				if ingredientUnit is None:
					ingredientUnit  = '';
				else:
					ingredientUnit = ingredientUnit.string
					
				#output ingredient
				output.write('{"ingredientName":"'+ingredientName+'", "ingredientValue":"'+ingredientValue+'", "ingredientUnit":"'+ingredientUnit+'", "group":"'+groupName+'"},')
		
	i=i+1
	print i
	
		
	output.write(']},')	
	
output.write(']}')	
	
json_data.close()
output.close()

f = open("recipehtml.html", "r")

string = f.read()

f.close()

fixedJson = string.replace(",]","]")

output = open("recipehtml.html", "w")

output.write(fixedJson)
output.close()