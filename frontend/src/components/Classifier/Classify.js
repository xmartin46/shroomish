import React, { Component } from 'react'
import axios from 'axios'
import './main.css';
import {Box} from 'grommet';
import { API } from '../../consts';
import Typography from '@material-ui/core/Typography';
import Mushroom from '../Mushroom/Mushroom';

const state_init = {
    form: undefined,
    prediction: undefined,
    error: '',
    data: [{}]
  }

class Classify extends Component {

  
   state = {
    form: undefined,
    prediction: undefined,
    error: '',
    data: [{}]
  }
  
  async fetchLocalFile(fileName) {
    return fetch(window.location.origin + fileName)
    .then(res => res.blob())
    .then(blob => new File([blob], fileName))
  }
  
  sendImage(form) {
    return axios({
      method: 'POST',
      url:'http://localhost:5000/api/predict',
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
    this.setState(state_init)
    const file = e.target.files[0]
    const form = new FormData()
    form.append('file', file)
	  this.setState({ form })
  }
  
  handleSubmit = (e) => {
    e.preventDefault()
    //console.log('Sending '+ this.state.form)
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
	    //console.log(this.state)
    })
    .catch(err => {
      console.error(err)
    })
  }


  getInformation = () => {
	  if(!this.state.data[0].name_eng){
		  this.handleQuery();
    	}
		  return  (
	    <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', margin:"3em"}}>
			  <Mushroom
    name={this.state.data[0].name_eng}
    name_latin={this.state.data[0].name_latin}
    img={this.state.data[0].url} 
    edibility={this.state.data[0].edibility}
    />
	    </div>
    )
  }

  
  render() {
    const { prediction, error} = this.state
    const namePred = "unknown"
    return (
      <div className="main-class" style={{display:"flex", alignItems:"center", justifyContent:"center", padding:"7rem"}}>
      <Box className ='box'>
      <Typography component="p" style={{fontSize:"2em"}}>
      Click a mushroom picture or upload a picture and send it to server for prediction!
      </Typography>
      <br></br>
      <Typography component="p" style={{fontSize:"1.2em"}}>
      Our technology will automagically return which type of mushroom is:
      </Typography>
      <Typography component="p">
{prediction != undefined ? this.getInformation():
      <p>Prediction: unknown</p>}
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
