import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API } from '../../consts';
import Carousel from 'nuka-carousel';
import { Redirect } from 'react-router-dom';

class Information extends Component {
  constructor() {
    super();
    this.state = { data: [], check:false };
  }
  
  componentWillUnmount() {
    window.removeEventListener('resize', this.handleWindowSizeChange);
  }
  
  handleWindowSizeChange = () => {
    this.setState({ width: window.innerWidth });
  };
  
  componentWillMount() {
    window.addEventListener('resize', this.handleWindowSizeChange);
    let id = this.props.match.params.id;
    axios({
      method: 'GET',
      url: API + '/info/'+ id
    })
    .then(res => {
      console.log(res)
      if(res.data.message != null){
        this.setState({check:true});
      }
      else{
        this.setState({data:JSON.parse(JSON.stringify(res.data))})
      }
    })  
    .catch(err => {
      console.error(err)
    })
  }
  
  
  render() {
    if(this.state.check){
      return(<Redirect to="/gallery"/>); 
    }
    else{
      let name_eng="";
      let name_latin="";
      let description="";
      let edibility="";
      let images_length=0;
      let img=[];
      if (this.state.data.length > 0){
        images_length= this.state.data.length;
        for(let i=0; i<images_length; ++i){
          img.push(this.state.data[i].url);
        }
        // img = this.state.data[0].url;
        // console.log(img)
        description=this.state.data[0].description;
        edibility = this.state.data[0].edibility;
        name_latin=this.state.data[0].name_latin;
        name_eng = this.state.data[0].name_eng 
      }
      const width = this.state.width;
      const isMobile = width <= 600;
      
      if (isMobile) {
        return (  
          <div className='main-class' style={{margin:"0", padding:"0"}}>
          <div style={{textAlign:"justify"}}>
          <Carousel style={{height:"40vh"}}>
          {img.map((value, index) => (
            <img src={value}></img>
            ))}
            </Carousel>
            <div className="content-wrapper" style={{padding:"3em"}}>
            <Typography variant="headline" component="h2">
            {name_eng}
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
            </div>
            
            );
          }
          else{
            return (
              <div className='main-class' style={{margin:"0", padding:"0"}}>
              <div className="content-wrapper" style={{ marginTop:"3em",marginBottom:"5em", paddingBottom:"5em",  marginLeft:"15em", marginRight:"15em", textAlign:"justify",boxShadow: "0px 0px 30px #9E9E9E"}}>
              <Carousel style={{height:"70vh"}}>
              {img.map((value, index) => (
                <img src={value} style={{objectFit:"cover"}}></img>
                ))}
                </Carousel>
                <div style={{paddingRight:"5em", paddingLeft:"5em", paddingTop:"3em"}}>
                <Typography variant="headline" component="h2">
                {name_eng}
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
                </div>
                );   
              }
            }
          }
        }
        
        export default Information;