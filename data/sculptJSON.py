import json

f = open('data.json')

recipes = json.load(f)
f.close()

for recipe in recipes:
	for ingredient in recipe["ingredients"]:
		
		if " or " in ingredient["ingredientName"]:
			
			fixedIngredient = ingredient["ingredientName"].split(" or ")[0]
			
			print fixedIngredient



#print recipes

#f = open('data.json','w');
#f.write(json.dumps(recipes))
#f.close()