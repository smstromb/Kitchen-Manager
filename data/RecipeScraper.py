from BeautifulSoup import BeautifulSoup
import json
import urllib
import types
import unicodedata
import os

def getRecipeData():
	json_data = open('recipeURLS.json')
	recipeUrlJson = json.load(json_data)

	i = 0
	os.remove('recipeData.json')
	output = open("recipeData.json", "a")

	output.write('{"recipes":[');

	for i in range(len(recipeUrlJson["recipes"])):

		recipeURL = recipeUrlJson["recipes"][i]["url"]
		recipeThumbnail = recipeUrlJson["recipes"][i]["thumbnail"]

		

		recipeHttp = urllib.urlopen(recipeURL)

		recipeSoup = BeautifulSoup(recipeHttp.read())

		recipeName = recipeSoup.find("h1", {"itemprop": "name"}).string
		
		recipePrepURL = recipeSoup.find("a",{"class":"source"})['href']
		
		print recipePrepURL
		
		ingredients = recipeSoup.find("div", {"id": "categorized-ingredients"})
		ingredientGroups = ingredients.findAll("ul")
		ingredientGroups.pop(0)

		print "/////////////////"
		print recipeName
		print i
		
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

					if ingredientValue is None:
						ingredientValue  = '';
					else:
						ingredientValue = ingredientValue.string
						
					if ingredientUnit is None:
						ingredientUnit  = '';
					else:
						ingredientUnit = ingredientUnit.string

					#output ingredient
					output.write('{"ingredientName":"'+ingredientName+'", "ingredientValue":"'+ingredientValue+'", "ingredientUnit":"'+ingredientUnit+'", "group":"'+groupName+'", "source":"'+recipePrepURL+'"},')

		i=i+1
		print "/////////////////"
		
		output.write(']},')	

	output.write(']}')	
	json_data.close()
	output.close()

	f = open("recipeData.json", "r")

	string = f.read()

	f.close()

	fixedJson = string.replace(",]","]")

	output = open("recipeData.json", "w")

	output.write(fixedJson)
	output.close()


def getRecipeUrls():
	json_data = open('recipeUrlsRaw.json')
	recipeJson = json.load(json_data)
	json_data.close()
	i = 0
	os.remove('recipeURLS.json')
	output = open("recipeURLS.json", "a")

	output.write('{"recipes":[');

	for recipeHtml in recipeJson['cards']:
		print "/////////////////"
		
		recipeSoup = BeautifulSoup(recipeHtml)

		recipeURL = 'http://punchfork.com' + recipeSoup.a['href']
		
		print recipeURL
		
		recipeThumbnail = recipeSoup.img['src']
		
		if "{" in recipeURL:
			print recipeURL
			break
			
		if "{" in recipeThumbnail:
			print recipeThumbnail
			break
		
		output.write('{"url":"'+recipeURL+'","thumbnail":"'+recipeThumbnail+'"},')

		i=i+1

		print i
		print "/////////////////"

	output.write(']}')	

	output.close()
	
	f = open("recipeURLS.json", "r")

	string = f.read()

	f.close()

	fixedJson = string.replace(",]","]")

	output = open("recipeURLS.json", "w")

	output.write(fixedJson)
	output.close()

def scultRecipes():
	f = open('recipeData.json')

	recipes = json.load(f)
	f.close()
	
	
	
	print " ***** SCULPTING DATA ***** "
	
	i = len(recipes["recipes"]) - 1
	
	for recipe in reversed(recipes["recipes"]):
		
		bad = 0
				
		for ingredient in recipe["ingredients"]:
			
			if(len(ingredient["ingredientName"].split(',')) > 1):
				bad = 1
				print ingredient["ingredientName"]
			
			if " or " in ingredient["ingredientName"]:
				print ingredient["ingredientName"]
				bad = 1
		
		
		if bad == 1:
			print "removing recipe: " + recipe["recipeName"]
			recipes["recipes"].pop(i)
		
		i=i-1
		print i
	
	os.remove('data.json')
	f = open('data.json','w');
	f.write(json.dumps(recipes))
	f.close()

	print " ****** FINISHED SCULPTING ******"

def main():
	#getRecipeUrls()
	#getRecipeData()
	scultRecipes()

if __name__ == "__main__":
    main()