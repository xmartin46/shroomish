# Design Report
> Xavier Martín Ballesteros, Ricardo Milos, Adrià Cabeza Sant'Anna

## Main functionality of the service
The goal of our service is to offer a web page where people can obtain more knowledge about mushrooms or check about the mushrooms obtained.
Hence, our site will be divided between a gallery containing mushrooms where the user will be able to access for more knowledge about specific mushrooms or general interesting information. It will also have another space where the user, by pictures and questions, will be able to identify the mushrooms taken.

- Shouldn't we consider the option of just taking a picture? probably it would be easier
- Besides (probably), we could also implement an on live geolocation of the mushrooms. That is, create a heat map for each mushroom on the map. Then, a user that want to take a specific mushroom only has to look at the map and go to the more heated zones. Cons: Permission to know where the user has taken any mushroom.
- Maybe also a page to meet some people to go for mushrooms?
- Maybe say where can you buy any of the mushrooms?

## Existing competitors / predecessor of the service
- Tons of apps for mushroom description
- Rogers Mushrooms App (pin the location)
- https://champignouf.com/ (identifier +1000 species)
- Mushroom Identificator (App Store): apart from all our features, it also has a quizz game

## User groups
### Personas
- Marie (16): uses iPad, PC and mobile phone; goes to school
- Manolo (45): researcher in mushrooms; uses PC and mobile phone; works with a lot of mushrooms
- David (30): goes to find mushrooms as a hobby; uses mobile phone; loves reading anything related to mushrooms
- Claire (35): passionate for forest trips; uses iPad and mobile phone; every week goes to the forest
- Nathan (45): works for a company that sells mushrooms
- Rose (60): cannot walk a lot of time; wants to buy an specific type of mushroom

### Scenarios
- Marie (16): has a homework about mushrooms, and needs information about some types of mushrooms => she uses the app, finds the mushroom type she wants and reads information about that mushroom.
- Marie (16): has gone to a trip with their parents and have founded some mushrooms => she identifies them and, if edible, takes them
- Manolo (45): has been researching about 1 specific type of mushroom but needs more instances of that mushroom => he uses the app, sees the heat map of the mushroom and goes for them
- David (30): he has just seen one type of mushroom he has not seen ever => he uses the app to first identify the mushroom and then read all the information about it
- David (30):
- Claire (35): she has gone to a trip in the forest and suddenly has found some mushrooms, and does not know whether taking them or not because she does not know if they are edible or not => she uses the app to identify the mushrooms and know if they are edible or not
- Nathan (45): he needs more mushrooms of one type because they run out of them => he uses the map to look for the heat map of that mushroom
- Nathan (45): he wants to sell more mushrooms => uses the app so that all the clients of our app know where each mushroom can be bought
- Rose (60): needs to know if she can buy a mushroom nearby her house or if any company can bring it to her house => uses the app to know which companies sell that mushroom

## Technologies selected
### React
<p align=center>
<img src="https://www.import.io/wp-content/uploads/2017/10/React-logo-1.png" width=300>
</p>


React is a frontend library based on JavaScript for building interfaces. It is a really good option if we want to keep the implementation maintainable since it works with the so called "components", small and isolated pieces of code. Moreover it efficiently updates and renders the right components when the data changes.

Even though we do not have any experience with React, we have talked with several people that know a lot about web development and it was heavily recommended. So we will try to make the effort to learn it and develop our frontend with it.

### Docker
<p align=center>
<img src="https://www.docker.com/sites/default/files/social/docker_facebook_share.png" width=300>
</p>


Docker is a tool designed to make it easier to create, deploy and run application by using containers. Containers allow a developer to package up an application with all of the parts it needs. So, in order to make it more scalable and easy to maintain, our purpose is to segment our website into different chunks: frontend, backend and classifier.

### NodeJS (Express)
<p align=center>
<img src="https://icon-library.net/images/node-js-icon/node-js-icon-28.jpg" width=250>
</p>

//TODO

### Algolia
<p align=center>
<img src="https://static.wixstatic.com/media/30af28_2d72ca4afbe14237b1d271062ccf15ee~mv2.png/v1/fill/w_576,h_324,al_c,q_90/file.jpg" width=300>
</p>


Algolia is an API that makes it easier and faster to do queries in your database. We would like to use it for our dynamic functionality of searching in the gallery of mushrooms.  

### PostgreSQL
<p align=center>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/800px-Postgresql_elephant.svg.png" width=200>
</p>



When it comes to design a database, two main questions can be done (if we skip the new GraphQL technology): SQL or NoSQL. We will be working with PostgreSQL, a database management system that uses SQL, because it much faster (compared to one using NoSQL i.e. MongoDB) and one of the most famous relational database management systems.


###  Keras
<p align=center>
<img src="https://s3.amazonaws.com/keras.io/img/keras-logo-2018-large-1200.png" width=300>
</p>



The problem of classifying correctly mushrooms is not easy. Using basic computer vision techniques is not an option since we need a really good precision. So to solve it we will use a Convolutional Neural Network (CNN). 

Building a CNN from scratch can be a really difficult job so we will use Keras, one of the most popular deep learning frameworks. 


###  Github
<p align=center>
<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" width=200>
</p>

GitHub is a Git repository hosting service and we will use it as a version control tool to collaborate together.  It will help us with stuff like working together with the same files, keeping different versions of the project and restoring modifications whenever we want to.


### Scrapy
<p align=center>
<img src="https://www.imagescape.com/media/uploads/zinnia/2018/08/24/scrapy-logo-big_2.png.1132x452_q85_crop.png" width=300>
</p> 

There are some datasets of mushrooms out there in the Internet. However they are not as huge or as informative as we would liked to. So, to solve it we decided to create our dataset scraping the Internet.

To do so we have developed a crawler that scrapes information in the Internet (more concretely from mushroom.world) and creates the dataset we need for our website.

We have used Scrapy for that, an open source framework for extracting data from websites based on Python.

### Figma
<p align=center>
<img src="https://images.ctfassets.net/1khq4uysbvty/2MbBsf9yEw40SMw6gK0Mmg/35f39d41f167b6615bd80517b4b67bcd/1_6XgfDCVn81AYX68Xvd2I-g_2x.png?w=670" width=200>
</p>

Figma is a cloud-based design tool. We have used it to design sketches of UI and UX of our web service. 


## Dynamic functionality
The main dynamic functionality is to provide to the users information about any type of mushroom. We take all the information of mushrooms (and photos) from the database. Then it sorts them alphabetically? After, a script limits the number of mushrooms that are initially displayed. If they use the search field, there will only appear the mushrooms that contain that String. If there are a lot, it will only display the first X mushrooms (ordered alphabetically).

Moreover, they can use the classifier/identifier. Then , they will take a photo, that photo will be sent to our classifier, the classifier will output the class. We will return the class name and if it is eatable or not. Besides, there will also be a button for "More information" about the mushroom, which will bring the user to the information page of that mushroom.

If the user wants to know where is one specific type of mushroom, he will go to the map page. Then he will select the mushroom he want. This will create a request to the database, which will give all the locations where it has been founded recently (max time not accorded yet). Later, it will create a heat map of that locations and will show them in the map.


### Project plan draft (project structure, tasks divided among group members, time to be used, preliminary schedule)


## Focus area

Since our aim is to make something useful, we will focus our project mainly in functionality. We need to focus on that because the main attraction of our website, besides of the mushroom gallery and its information is the ability to tell you the type of mushroom and whether a mushroom is edible or not.

Also, we have never done something similar as the idea stated so we will need more effort and time to develop it. 
