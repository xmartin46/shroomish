import React, { Component } from 'react'
import './main.css';
// import Mushroom from './Mushroom'
import PropTypes from 'prop-types';
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'

const API_URL = "http://localhost:9000/api"



export const mushrooms = [
{"name_latin": "Agaricus arvensis", "name_eng": "Horse Mushroom", "url": "http://www.mushroom.world/show?n=Agaricus-arvensis", "img_urls": ["http://www.mushroom.world/data/fungi/Agaricusarvensis1.JPG"], "desc": "Cap 8-20 cm diameter, stem 8-10 cm tall * 2-3 cm diameter", "edibility": "edible and good "},
{"name_latin": "Amanita muscaria", "name_eng": "Fly Amanita", "url": "http://www.mushroom.world/show?n=Amanita-muscaria", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitamuscaria1.JPG"], "desc": "Cap 8-10 cm diameter; stem 8-18 cm tall * 1-2 cm diameter", "edibility": "poisonous"},
{"name_latin": "Amanita fulva", "name_eng": "Tawny grisette", "url": "http://www.mushroom.world/show?n=Amanita-fulva", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitafulva1.JPG"], "desc": "Cap 4-9 cm diameter, stem 7-12 cm tall * 0.8-1.2 cm diameter", "edibility": "inedible"},
{"name_latin": "Amanita ceciliae", "name_eng": "Snakeskin Grisette", "url": "http://www.mushroom.world/show?n=Amanita-ceciliae", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitaceciliae1.JPG"], "desc": "Cap 7-12 cm diameter, stem 8-13 cm tall * 1.5-2 cm diameter", "edibility": "inedible"},
{"name_latin": "Albatrellus ovinus", "name_eng": "Sheep Polypore", "url": "http://www.mushroom.world/show?n=Albatrellus-ovinus", "img_urls": ["http://www.mushroom.world/data/fungi/Albatrellusovinus1.JPG"], "desc": "Cap 7-18 cm diameter, stem 3-7 cm tall * 1-3 cm thick", "edibility": "edible "}
]


const CardList = ({ mushrooms }) => {
  const cardsArray = mushrooms.map(mushroom => (
    <Mushroom
      name={mushroom.name_eng}
      name_latin={mushroom.name_latin}
      img={mushroom.img_urls[0]}
      desc= {mushroom.desc}
      edibility={mushroom.edibility}
 />
  ));

  return (
    <div>
      {cardsArray}
    </div>
  );
};

const Mushroom = ({name,name_latin,img,desc,edibility}) => {
  return(
      <div style={{ display:'flex', justifyContent:'center' }}>
              <Card style={{maxWidth: 405}} >
                  <CardMedia style={{height: 0, paddingTop: '56.25%', paddingBottom:'56.25%'}}
                  image={img}
                  title={name}
                  />
                  <CardContent>
                  <Typography gutterBottom variant="headline" component="h3">
                      {name}
                  </Typography>
      <Typography gutterBottom variant='headline' component="subtitle1">
                      {name_latin}
                  </Typography>
                   <Typography component="p">
                      {desc}
                  </Typography> 
                  </CardContent>
                  <CardActions>
                  <Button size="small" color="primary" href={name} target="_blank">
                      Know more...
                  </Button>
                  </CardActions>
              </Card>
      </div>
  );
}

Mushroom.propTypes = {
  name: PropTypes.string.isRequired,
  name_latin: PropTypes.string.isRequired,
  img: PropTypes.string.isRequired,
  desc: PropTypes.string.isRequired,
  edibility: PropTypes.string.isRequired
};

CardList.propTypes = {
  mushrooms: PropTypes.array.isRequired
};

class Gallery extends Component {
  render() {
    return (
    <div className="main-class">
     <CardList mushrooms ={mushrooms}></CardList>
    </div>
      
    );
  }
}

export default Gallery