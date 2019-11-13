import React, { Component } from 'react'
import axios from 'axios'
import './main.css';
import { API } from '../../consts';
import Typography from '@material-ui/core/Typography';
import Mushroom from '../Mushroom/Mushroom';  

const state_init = {
    file: undefined,
    prediction:undefined,
    error: '',
    loading:false,
    data: [{}]
  }

const API_C = 'https://classifier.shroomish.ml/api'
const LOCAL_API_C = 'http://localhost:5000/api'

class Classify extends Component {
  constructor() {
    super();
    this.state = {   
      file: undefined,
      prediction: undefined,
      error: '',
      data: [{}],
      width: window.innerWidth,};
  }
  

  handleWindowSizeChange = () => {
    this.setState({ width: window.innerWidth });
  };


  componentWillMount() {
    window.addEventListener('resize', this.handleWindowSizeChange);
  }

  
  handleFileChange = (e) => {
    this.setState(state_init)
    let file = e.target.files[0]
    this.setState({file: file})
  }

  handleSubmit = (e) => {
    e.preventDefault()
    let form = new FormData()
    console.log(this.state)
    form.append('file', this.state.file)
    this.setState({loading:true})
    axios({
      method: 'POST',
      url: API_C + '/predict',
      data: form,
      headers:{
        'Content-Type':'multipart/form-data',
        'Access-Control-Allow-Origin':"https://classifier.shroomish.ml",
        'Content-Type':'application/x-www-form-urlencoded'
      }
    })
    .then(res => {
      this.setState({loading:false})
      this.setState({
        error: '',
	      prediction: res.data.prediction
      })
    })
    .catch(err => {
      console.log(err)
      this.setState({
        error: err.response
      })
      if(this.state.prediction == null) alert('The prediction was not confident enough. Please, try again with another photo.')
      this.setState({loading:false})
    })
  }

  handleQuery = () => {
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
      const { prediction, error, loading} = this.state

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
                    <p>Error: { error }</p>:null
                  }
              </Typography>
                {loading ? <div class="lds-dual-ring"></div>: null}
              <form onSubmit={this.handleSubmit}>
                <input id="myFileInput" type="file" accept="image/*" onChange={this.handleFileChange}/>
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
            <br>
            </br>
            <Typography component="p" style={{fontSize:"1.2em"}}>
              Our technology will automagically return which type of mushroom is:
            </Typography>
            <Typography component="p">
              {prediction != undefined ? this.getInformation():
              <p>Prediction: unknown</p>}
              { error ?
                <p>Error: { error }</p>:null
              }
            </Typography>
            {loading ? <div class="lds-dual-ring"></div>: null} 
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
    }
}


  export default Classify;
