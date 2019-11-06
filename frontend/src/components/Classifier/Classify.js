import React, { Component } from 'react'
import axios from 'axios'
import './main.css';
import { API } from '../../consts';
import Typography from '@material-ui/core/Typography';
import Mushroom from '../Mushroom/Mushroom';

const state_init = {
    form: undefined,
    prediction:undefined,
    error: '',
    data: [{}]
  }

const API_C = 'https://classifier.shroomish.ml/api'
const LOCAL_API_C = 'http://localhost:5000/api'

class Classify extends Component {

   state = {
    form: undefined,
    prediction: undefined,
    error: '',
    data: [{}],
    width: window.innerWidth,
  }


handleWindowSizeChange = () => {
  this.setState({ width: window.innerWidth });
};



componentWillMount() {
  window.addEventListener('resize', this.handleWindowSizeChange);
}



  async fetchLocalFile(fileName) {
    return fetch(window.location.origin + fileName)
    .then(res => res.blob())
    .then(blob => new File([blob], fileName))
  }

  sendImage(form) {
    return axios({
      method: 'POST',
      url: API_C + '/predict',
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
    let file = e.target.files[0]
    let form = new FormData()
    form.append('file', file)
    this.setState({ form: form})
  }

  handleSubmit = (e) => {
    e.preventDefault()
    //console.log('Sending '+ this.state.form)
    this.sendImage(this.state.form)
    .then(pred =>{{
      this.setState({
        prediction: pred
      })
    if(pred == undefined) alert('The prediction was not confident enough. Please, try again with another photo.')
    }
    }
    )
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
    const width = this.state.width;
    let isMobile = width <= 700;
    const { prediction, error} = this.state
	navigator.getMedia = ( navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia);

	if (isMobile) {
	return (
	  <div className="main-class" style={{display:"inline-block"}}>
    <div style={{padding:"2.5em"}}>
      <Typography component="p" style={{fontSize:"1.2em", textAlign:"center"}}>
      Upload a picture and send it to server for prediction!
      </Typography>
      <br></br>
      <Typography component="p" style={{fontSize:"0.8em", textAlign:"center"}}>
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
      <input type="file" accept="image/*" onChange={this.handleFileChange}/>
      <button type="submit"> <Typography>Submit</Typography></button>
      </form>

      <Typography component="p" style={{fontSize:"0.5em", padding:"10px"}}>
      Please notice that our predictions are not perfect, check with an expert before eating any mushroom. We are not responsible from the predictions made by our engine.
      </Typography>
      </div>
      </div>
      )
		  }
		  else{
			  return(
				<div className="main-class" style={{display:"block", alignItems:"center", justifyContent:"center", padding:"7rem"}}>
				<Typography component="p" style={{fontSize:"2em"}}>
				Upload a picture and send it to server for prediction!
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
				<input type="file" accept="image/*" onChange={this.handleFileChange}/>
				<button type="submit"> <Typography>Submit</Typography></button>
				</form>

				<Typography component="p" style={{fontSize:"0.5em", padding:"10px"}}>
				Please notice that our predictions are not perfect, check with an expert before eating any mushroom. We are not responsible from the predictions made by our engine.
				</Typography>
				</div>

			  )


		  }

  }}


  export default Classify;
