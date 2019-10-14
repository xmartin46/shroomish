import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API } from '../../consts';

export const img = "http://www.mushroom.world/data/fungi/Albatrellusovinus1.JPG";
export const description = "Cap 3-15 cm diameter, stem 6-15 cm tall * 0.5-1.5 cm thick. This large agaric has a convex, flattened, or wavy, olive-tinged, pale yellow-brown cap with a darker center and sparse pale scales. It grows in dense clusters on and around the stumps of leaf and coniferous trees.\n\nCap convex at first but becoming flattened, often with a central raised umbo, later becoming somewhat dish-shaped. The margins are often arched at maturity and the surface is sticky when wet. Though typically ochraceous, this fungus is rather variable in appearance and sometimes has a few dark, hairy scales near the centre somewhat radially arranged. The flesh white, thin and firm. Gills at first white, sometimes becoming pinkish-yellow or discoloured with age, broad and fairly distant, attached to the stipe at right angles or are slightly decurrent, crowded. The spore print is white. Stem at first whitish, becoming yellowish or reddish brown, more or less equal or tapering towards the base, finely wholly. The ring is yellowish, cottony or woolly, superior and fairly persistent.\n\nSimilar species The mushroom can be mistaken with Galerina marginata, which is deadly poisonous.\n\nArmillaria mellea on the First Nature Web site.\n";
export const edibility= "edible";
export const name="Pollazo"


const sendQuery = name => {
  return axios({
    method: 'GET',
    url: API + '/info/'+ name
  })
  .then(res => {
    return res.data
  })
  .catch(err => {
    console.error(err)
  })
}



class Information extends Component {
    render() {
    const name_latin = this.props.match.params.id
    const information = sendQuery(name_latin)
    // const name = information.name_eng
    // const edibility = information.edibility
    // const description = information.description
    return (
      <div className='main-class' style={{margin:"0", padding:"0"}}>
        <div className="image_container" style={{maxHeight:"50vh", maxWidth:"100%", overflow:"hidden"}}>
          <img src={img} style={{width:"100%",objectPosition:"center",height:"100%", objectFit:"contain"}}></img>
        </div>
        <div className="content-wrapper" style={{padding:"3em"}}>
                      <Typography variant="headline" component="h2">
                       {name}
                    </Typography>
                    <Typography variant="headline" component="h3">
                       {name_latin}
                    </Typography>
                      <Typography variant="headline" component="h3" style={{marginTop:"2%"}}>
                       Edibility: {edibility}
                    </Typography>
                    <Typography component="p" style={{marginTop:"0.5%"}}> 
                      {description}
                    </Typography>

        </div>
      </div>
    
    );
  }
}

export default Information;