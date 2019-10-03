## Main functionality of the service
The goal of our service is to offer a web page where people can obtain more knowledge about mushrooms or check about the mushrooms obtained.
Hence, our site will be divided between a gallery containing mushrooms where the user will be able to access for more knowledge about specific mushrooms or general interesting information. It will also have another space where the user, by pictures and questions, will be able to identify the mushrooms taken.
> Shouldn't we consider the option of just taking a picture? probably it would be easier
> Besides (probably), we could also implement an on live geolocation of the mushrooms. That is, create a heat map for each mushroom on the map. Then, a user that want to take a specific mushroom only has to look at the map and go to the more heated zones. Cons: Permission to know where the user has taken any mushroom.
> Maybe also a page to meet some people to go for mushrooms?
> Maybe say where can you buy any of the mushrooms?

## Existing competitors / predecessor of the service
	- Tons of apps for mushroom description
	- Rogers Mushrooms App (pin the location)
	- https://champignouf.com/ (identifier +1000 species)
	- Mushroom Identificator (App Store): appart from all our features, it also has a quizz game

## User groups
	### Personas
		- Marie (16): uses iPad, PC and mobile phone; goes to school
		- Manolo (45): researcher in mushrooms; uses PC and mobile phone; works with a lot of mushrooms
		- David (30): goes to find mushrooms as a hobby; uses mobile phone; loves reading anything related to mushrooms
		- Claire (35): appasionate for forest trips; uses iPad and mobile phone; every week goes to the forest
		- Nathan (45): works for a company that sells mushrooms
		- Rose (60): cannot walk a lot of time; wants to buy an specific type of mushroom

	### Scenarios
		- Marie (16): has a homework about mushrooms, and needs information about some types of mushrooms => she uses the app, finds the mushroom type she wants and reads information about that mushroom.
		- Marie (16): has gone to a trip with their parents and have founded some mushrooms => she identifies them and, if eatable, takes them
		- Manolo (45): has been researching about 1 specific type of mushroom but needs more instances of that mushroom => he uses the app, sees the heat map of the mushroom and goes for them
		- David (30): he has just seen one type of mushroom he has not seen ever => he uses the app to first identify the mushroom and then read all the information about it
		- David (30):
		- Claire (35): she has gone to a trip in the forest and suddenly has found some mushrooms, and does not know wheter taking them or not because she does not know if they are eatable or not => she uses the app to identify the mushrooms and know if they are eatable or not
		- Nathan (45): he needs more mushrooms of one type because they run out of them => he uses the map to look for the heat map of that mushroom
		- Nathan (45): he wants to sell more mushrooms => uses the app so that all the clients of our app know where each mushroom can be bought
		- Rose (60): needs to know if she can buy a mushroom nearby her house or if any company can bring it to her house => uses the app to know which comapnies sell that mushroom

## Technologies selected
	- HTML, CSS, JavaScript + React
	- NodeJS (Express)
	- Some SQL database (PostreSQL?) + Algolia (deliver the right content instantly whenever  the user enters a letter (for the search field))
	- Keras (for the classifier/identifier)
	- Docker (maybe)
	- Kubernetes (maybe)
	- Git
	- Scraper
	- Figma
	
## Dynamic functionality
The main dynamic functionality is to provide to the users information about any type of mushroom. We take all the information of mushrooms (and photos) from the database. Then it sorts them alphabetically? After, a script limits the number of mushrooms that are initially displayed. If they use the search field, there will only appear the mushrooms that contain that String. If there are a lot, it will only display the first X mushrooms (ordered alphabetically).
Moreover, they can use the classifier/identifier. Then , they will take a photo, that photo will be sent to our classifier, the classifier will output the class. We will return the class name and if it is eatable or not. Besides, there will also be a button for "More information" about the mushroom, which will bring the user to the information page of that mushroom.
If the user wants to know where is one specific type of mushroom, he will go to the map page. Then he will select the mushroom he want. This will create a request to the database, which will give all the locations where it has been founded recently (max time not accorded yet). Later, it will create a heat map of that locations and will show them in the map.


### project plan draft (project structure, tasks divided among group members, time to be used, preliminary schedule)



## Focus area
Since our aim is to make something useful and easy to use, we will focus our project mainly in UX and functionality.
