import React, { Component } from 'react'
import './main.css';
import PropTypes from 'prop-types';
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import { API } from '../../consts';
import axios from 'axios'

export const local_mushrooms = [
  {"name_latin": "Agaricus arvensis", "name_eng": "Horse Mushroom", "url": "http://www.mushroom.world/show?n=Agaricus-arvensis", "img_urls": ["http://www.mushroom.world/data/fungi/Agaricusarvensis1.JPG"], "description": "Cap 8-20 cm diameter, stem 8-10 cm tall * 2-3 cm diameter", "edibility": "edible and good "},
  {"name_latin": "Amanita muscaria", "name_eng": "Fly Amanita", "url": "http://www.mushroom.world/show?n=Amanita-muscaria", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitamuscaria1.JPG"], "description": "Cap 8-10 cm diameter; stem 8-18 cm tall * 1-2 cm diameter", "edibility": "poisonous"},
  {"name_latin": "Amanita fulva", "name_eng": "Tawny grisette", "url": "http://www.mushroom.world/show?n=Amanita-fulva", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitafulva1.JPG"], "description": "Cap 4-9 cm diameter, stem 7-12 cm tall * 0.8-1.2 cm diameter", "edibility": "inedible"},
  {"name_latin": "Amanita ceciliae", "name_eng": "Snakeskin Grisette", "url": "http://www.mushroom.world/show?n=Amanita-ceciliae", "img_urls": ["http://www.mushroom.world/data/fungi/Amanitaceciliae1.JPG"], "description": "Cap 7-12 cm diameter, stem 8-13 cm tall * 1.5-2 cm diameter", "edibility": "inedible"},
  {"name_latin": "Cortinarius caperatus", "name_eng": "Gypsy Mushroom", "url": "http://www.mushroom.world/show?n=Cortinarius-caperatus", "img_urls": ["http://www.mushroom.world/data/fungi/Cortinariuscaperatus1.JPG"], "description": "Cap 5-12 cm diameter, stem 4-10 cm tall * 1-1.5 cm thick", "edibility": "edible and good "},
  {"name_latin": "Cortinarius armillatus", "name_eng": "Red-banded Cort", "url": "http://www.mushroom.world/show?n=Cortinarius-armillatus", "img_urls": ["http://www.mushroom.world/data/fungi/Cortinariusarmillatus1.JPG"], "description": "Cap 4-12 cm diameter, stem 6-12 cm tall * 1-3 cm thick", "edibility": "inedible"},
  {"name_latin": "Cortinarius alboviolaceus", "name_eng": "Silvery Violet Cort", "url": "http://www.mushroom.world/show?n=Cortinarius-alboviolaceus", "img_urls": ["http://www.mushroom.world/data/fungi/Cortinariusalboviolaceus1.JPG"], "description": "Cap 5-8 cm diameter, stem 5-12 cm tall * 1-2 cm thick", "edibility": "inedible"},
  {"name_latin": "Coprinus plicatilis", "name_eng": "Umbrella Inky Cap", "url": "http://www.mushroom.world/show?n=Coprinus-plicatilis", "img_urls": ["http://www.mushroom.world/data/fungi/Coprinusplicatilis1.JPG"], "description": "Cap 0.8\u20132 cm; stem 4-8 cm tall * 1-2 mm diameter", "edibility": "inedible"},
  {"name_latin": "Coprinus comatus", "name_eng": "Shaggy-mane Inky Cap", "url": "http://www.mushroom.world/show?n=Coprinus-comatus", "img_urls": ["http://www.mushroom.world/data/fungi/Coprinuscomatus1.JPG"], "description": "Cap 5-15 cm tall * variable diameter, stem 10-30 cm tall * 1.5-2.5 cm thick", "edibility": "edible and good "},
  {"name_latin": "Coprinopsis atramentaria", "name_eng": "Common Ink Cap", "url": "http://www.mushroom.world/show?n=Coprinopsis-atramentaria", "img_urls": ["http://www.mushroom.world/data/fungi/Coprinopsisatramentaria1.JPG"], "description": "Cap 3-7 cm tall * variable diameter, stem 7-14 cm tall * 1-1.5 cm thick", "edibility": "poisonous"},
  {"name_latin": "Coltricia perennis", "name_eng": "Tiger's Eye", "url": "http://www.mushroom.world/show?n=Coltricia-perennis", "img_urls": ["http://www.mushroom.world/data/fungi/Coltriciaperennis1.JPG"], "description": "Cap 2-8 cm diameter, stem 0.2-1 cm thick * 1.3-3.5 cm tall", "edibility": "inedible"},
  {"name_latin": "Collybia dryophila", "name_eng": "Russet Toughshank", "url": "http://www.mushroom.world/show?n=Collybia-dryophila", "img_urls": ["http://www.mushroom.world/data/fungi/Collybiadryophila1.JPG"], "description": "Cap 2-6 cm diameter, stem 2-6 cm tall * 0.2-0.5 cm diameter", "edibility": "inedible"},
  {"name_latin": "Clitopilus prunulus", "name_eng": "Dread Dough Clitopilus", "url": "http://www.mushroom.world/show?n=Clitopilus-prunulus", "img_urls": ["http://www.mushroom.world/data/fungi/Clitopilusprunulus1.JPG"], "description": "2-3 cm diameter * 2-3 cm tall", "edibility": "edible "},
  {"name_latin": "Clitocybe nebularis", "name_eng": "Clouded Funnel Cap", "url": "http://www.mushroom.world/show?n=Clitocybe-nebularis", "img_urls": ["http://www.mushroom.world/data/fungi/Clitocybenebularis1.JPG"], "description": "Cap 8-20 cm diameter, stem 5-10 cm tall * 1.4-4 cm diameter", "edibility": "inedible"},
  {"name_latin": "Clitocybe gibba", "name_eng": "Common Funnel Cap", "url": "http://www.mushroom.world/show?n=Clitocybe-gibba", "img_urls": ["http://www.mushroom.world/data/fungi/Clitocybegibba1.JPG"], "description": "Cap 3-8 cm diameter, stem 3-8 cm tall * 0.5-1 cm thick", "edibility": "inedible"},
  {"name_latin": "Albatrellus ovinus", "name_eng": "Sheep Polypore", "url": "http://www.mushroom.world/show?n=Albatrellus-ovinus", "img_urls": ["http://www.mushroom.world/data/fungi/Albatrellusovinus1.JPG"], "description": "Cap 7-18 cm diameter, stem 3-7 cm tall * 1-3 cm thick", "edibility": "edible "}
]



const CardList = ({ mushrooms }) => {
  const cardsArray = mushrooms.map(mushroom => (
    <Mushroom
    name={mushroom.name_eng}
    name_latin={mushroom.name_latin}
    img={mushroom.img_urls} 
    edibility={mushroom.edibility}
    />
    ));
    
    return (
      <div className="cardlist" style={{display:'flex',flexGrow:'1',flexShrink:"1",flexBasis:"100%" ,justifyContent:"space-around", flexWrap:"wrap", flexDirection:"row", alignContent:"stretch"}}>
      {cardsArray}
      </div>
      );
    };
    

  const sendQuery = name => {
    return axios({
      method: 'GET',
      url: API + '/search/'+ name
    })
    .then(res => {
      console.log(res.data)
      return res.data
    })
    .catch(err => {
      console.error(err)
    })
  }
  
  
    const handleSearch = () => {
      return sendQuery("");
    }
  
    
    
    const Mushroom = ({name,name_latin,img,edibility}) => {
      return(
        <a href={"/info/" + name_latin} style={{textDecoration:"none"}}>
        <div style={{ display:'block', margin:'1vh' }} >
        <Card style={{   display: 'block',
        width: '20vw', 
        transitionDuration: '0.3s'
        }}>
        <CardMedia style={{height: 0, paddingTop: '90%'}}
        image={img}
        title={name}
        />
        <CardContent>
        <Typography gutterBottom variant="headline" component="h3">
        {name}
        </Typography>
        <Typography gutterBottom variant='headline' component="h4">
        {name_latin}
        </Typography>
        <Typography component="p">
        {edibility}
        </Typography>  
        </CardContent>
        <CardActions>
        <Button size="small" color="primary" href={"/info/" + name_latin} target="_blank">
        Know more...
        </Button>
        </CardActions>
        </Card>
        </div>
        </a>
        );
      }
      
      Mushroom.propTypes = {
        name: PropTypes.string.isRequired,
        name_latin: PropTypes.string.isRequired,
        img: PropTypes.string.isRequired,
        description: PropTypes.string.isRequired,
        edibility: PropTypes.string.isRequired
      };
      
      CardList.propTypes = {
        mushrooms: PropTypes.array.isRequired
      };
      
      function getMushrooms(mushrooms){
        if(!mushrooms){
          return handleSearch("")
        }
        else {
          return mushrooms
        }
      }
    
      class Gallery extends Component {
        render() {
          console.log(this.props) 
          let params = new URLSearchParams(this.props.location.search);
          let llista = params.get("list") 
          console.log(llista);
          llista = getMushrooms(llista);
          console.log(llista);
          if (!llista) llista = local_mushrooms
          console.log(llista)
          return (
            <div className="main-class">
            <CardList mushrooms ={local_mushrooms}></CardList>
            </div>
            
            );
          }
        }
        
        export default Gallery