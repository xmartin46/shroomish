import React from 'react'
import skull from '../../skull.png';
import warning from '../../warning.png';
import accept from '../../green_tick.png';
import PropTypes from 'prop-types';
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';


const Mushroom = ({name,name_latin,img,edibility}) => {
    function getPoisonousImage(){
        return <img src={skull} alt={{"poisonous"}} style={{marginRight:"5px", marginBottom:"20px"}}></img>
    };
    function getWarningImage(){
        return <img src={warning} alt={{"warning"}} }style={{marginRight:"5px", marginBottom:"20px"}}></img>
    };
    function getAcceptImage(){
        return <img src={accept} alt={{"accept"}} style={{marginRight:"5px", marginBottom:"20px"}}></img>
    };
    return(
        <a href={"/info/" + name_latin} style={{textDecoration:"none"}}>
        <div style={{ display:'block', margin:'1vh' }} >
        <Card style={{   display: 'block',
        width: 'auto', 
        transitionDuration: '0.3s'
    }}>
    <CardMedia style={{height: 0, paddingTop: '90%'}}
    image={img}
    title={name}
    />
    <CardContent>
    <div style={{display:"flex"}}>
    {edibility === "poisonous" || edibility === "lethally poisonous" ? getPoisonousImage():null}
    {edibility === "inedible" ? getWarningImage():null}
    {edibility === "edible " || edibility === "edible and good " || edibility === "edible and excellent " ||
        edibility === "edible when boiled " ? getAcceptImage():null}
    <Typography gutterBottom variant="headline" component="h3">
    {name}
    </Typography>
    </div>
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


export default Mushroom
