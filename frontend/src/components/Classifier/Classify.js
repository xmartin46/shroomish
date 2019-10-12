import React, { Component } from 'react'
import axios from 'axios'
import './main.css';
import {Box} from 'grommet';
import { API } from '../../consts';
import Typography from '@material-ui/core/Typography'


class Classify extends Component {
  
  state = {
    form: undefined,
    prediction: undefined,
    error: '',
  }
  
  async fetchLocalFile(fileName) {
    return fetch(window.location.origin + fileName)
    .then(res => res.blob())
    .then(blob => new File([blob], fileName))
  }
  
  sendImage(form) {
    return axios({
      method: 'POST',
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
  
  render() {
    const { prediction, error} = this.state
    const namePred = "unknown"
    return (
      <div className="main-class">
      
      <Box className ='box'>
      <Typography component="p">
      Click a mushroom picture or upload a picture and send it to server for prediction!
      </Typography>
      <Typography component="p">
      Our technology will automagically return which type of mushroom is:
      </Typography>
      <Typography component="p">
      <p>Prediction: { namePred }</p>
      { error ? 
        <p>Error: { error }</p>
        :
        null
      }
      </Typography>
      
      <form onSubmit={this.handleSubmit}>
      <input type="file" onChange={this.handleFileChange}/>
      <button type="submit"> <Typography>Submit</Typography></button>
      {/* <Button 
        className='mainButton'
        color='accent-1'
        label='Submit'
        type="submit"
      /> */}
      </form>
      </Box>
      </div>
      
      )
    }
  }
  
  export default Classify