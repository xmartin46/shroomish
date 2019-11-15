import React, { Component, useEffect } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import Carousel from 'nuka-carousel';
import { Redirect } from 'react-router-dom';
import skull from '../../skull.png';
import warning from '../../warning.png';
import accept from '../../green_tick.png';




class Information extends Component {
  constructor() {
    super();
    this.state = { data: [], check:false, width: window.innerWidth };
  }

  componentWillUnmount() {
    window.removeEventListener('resize', this.handleWindowSizeChange);
  }

  handleWindowSizeChange = () => {
    this.setState({ width: window.innerWidth });
  };

  componentDidMount(){
    let id = this.props.match.params.id;
    document.title = `Shroomish-${id}`;
  }

  
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

  handleClick() {
    var url = window.location.href.split("/");
    var name = url[url.length - 1];
    window.location.href = PUBLIC_URL + "/heatmap?id=" + name;
  }

  render() {
    function getPoisonousImage(){
      return <img src={skull} style={{marginRight:"5px", marginBottom:"20px"}}></img>
  };
  function getWarningImage(){
      return <img src={warning} style={{marginRight:"5px"}}></img>
  };
  function getAcceptImage(){
      return <img src={accept} style={{marginRight:"5px", marginBottom:"20px"}}></img>
  };

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
        description=this.state.data[0].description;
        edibility = this.state.data[0].edibility;
        name_latin=this.state.data[0].name_latin;
        name_eng = this.state.data[0].name_eng
      }
      const width = this.state.width;
      let isMobile = width <= 1000;

      if (isMobile) {
        return (
          <div className='main-class' style={{margin:"0", padding:"0"}}>
            <div style={{textAlign:"justify"}}>
              <Carousel style={{height:"40vh"}}>
                {img.map((value, index) => (<img src={value}></img>))}
              </Carousel>
              <div className="content-wrapper" style={{padding:"3em"}}>
                <div style={{display:"flex", justifyContent:"flex-end"}}>
                  {edibility == "poisonous" || edibility == "lethally poisonous" ? getPoisonousImage():null}
                  {edibility == "inedible" ? getWarningImage():null}
                  {edibility == "edible " || edibility == "edible and good " || edibility == "edible and excellent " ||
                  edibility == "edible when boiled " ? getAcceptImage():null}
                </div>
                <p className="mysubtitle">
                {name_eng}
                </p>
                <Typography variant="headline" component="h3">
                {name_latin}
                </Typography>
                <Typography variant="headline" component="h3" style={{marginTop:"2%"}}>
                Edibility: {edibility}
                </Typography>
                <Typography component="p" style={{marginTop:"0.5%"}}>
                {description}
                </Typography>
                <div style={{display:"flex", justifyContent:"flex-end", marginTop:"20px"}}>
                  <button className={"heatmapButton"} onClick={(e) => this.handleClick(e)} >Go to Heatmap!</button>
                </div>
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
              <div className="content-wrapper" style={{padding:"3em"}}>
                <div style={{display:"flex", justifyContent:"flex-end"}}>
                  {edibility == "poisonous" || edibility == "lethally poisonous" ? getPoisonousImage():null}
                  {edibility == "inedible" ? getWarningImage():null}
                  {edibility == "edible " || edibility == "edible and good " || edibility == "edible and excellent " ||
                  edibility == "edible when boiled " ? getAcceptImage():null}
                </div>
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
                <div style={{display:"flex", justifyContent:"flex-end", marginTop:"20px"}}>
                  <button className={"heatmapButton"} onClick={(e) => this.handleClick(e)} >Go to Heatmap!</button>
                </div>
              </div>
          </div>
        </div>
        );
      }
    }
  }
}

export default Information;
