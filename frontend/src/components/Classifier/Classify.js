import React, { Component } from 'react'
import axios from 'axios'
import './main.css';
import {Box} from 'grommet';
import { API } from '../../consts';
import Typography from '@material-ui/core/Typography'
import skull from '../../skull.png'
import PropTypes from 'prop-types';
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'


const Mushroom = ({name,name_latin,img,edibility}) => {
  function getPoisonousImage(){
    return <img src={skull} style={{marginRight:"5px", marginBottom:"20px"}}></img>
  };
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
      <div style={{display:"flex", alignItems:"center"}}>
    {edibility == "poisonous" || edibility == "lethally poisonous" ? getPoisonousImage():null}
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

class Classify extends Component {
  
  state = {
    form: undefined,
    prediction: undefined,
    error: '',
    data: []
  }
  
  async fetchLocalFile(fileName) {
    return fetch(window.location.origin + fileName)
    .then(res => res.blob())
    .then(blob => new File([blob], fileName))
  }
  
  sendImage(form) {
    return axios({
      method: 'GET',
      url: API + '/predict',
      data: form
    })
    .then(res => {
      this.setState({
        error: ''
      })
      return res.data.prediction
    })
    .catch(err => {
      console.error(err)
      this.setState({
        error: err.response
      })
    })
  }
  
  handleFileChange = (e) => {
    const file = e.target.files[0]
    const form = new FormData()
    form.append('file', file)
    this.setState({ form })
  }
  
  handleSubmit = (e) => {
    e.preventDefault()
    console.log('Sending '+ this.state.form)
    this.sendImage(this.state.form)
    .then(pred => {
      this.setState({
        prediction: pred
      })
    })
  }
  handleQuery(){
  axios({
    method: 'GET',
    url: API + '/search/'+ this.state.prediction
  })
    .then(res => {
        this.setState({data:JSON.parse(JSON.stringify(res.data))}) 
    })
    .catch(err => {
      console.error(err)
    })
  }


  getInformation = () => {
    this.handleQuery();
    return  <Mushroom
    name={this.state.data[0].name_eng}
    name_latin={this.state.data[0].name_latin}
    img={this.state.data[0].url} 
    edibility={this.state.data[0].edibility}
    />

  }

  
  render() {
    const { prediction, error} = this.state
    const namePred = "unknown"
    return (
      <div className="main-class" style={{display:"flex", alignItems:"center", justifyContent:"center", padding:"10rem"}}>
      <Box className ='box'>
      <Typography component="p" style={{fontSize:"2em"}}>
      Click a mushroom picture or upload a picture and send it to server for prediction!
      </Typography>
      <br></br>
      <Typography component="p" style={{fontSize:"1.2em"}}>
      Our technology will automagically return which type of mushroom is:
      </Typography>
      <Typography component="p">
      {prediction != undefined ? this.getInformation(): <p>Prediction: unknown</p>}
      { error ? 
        <p>Error: { error }</p>:
        null
      }
      </Typography>
      
      <form onSubmit={this.handleSubmit}>
      <input type="file" onChange={this.handleFileChange}/>
      <button type="submit"> <Typography>Submit</Typography></button>
      </form>
      </Box>
      </div>
      
      )
    }
  }
  
  export default Classify;