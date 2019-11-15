import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'



class NotFound extends Component {
  
  componentDidMount(){
    document.title = `Shroomish - Not Found`;
  }

  render() {
  return (
    <div className='main-class'>
      <div className="content-wrapper">
        <Typography variant="headline" component="h1">
          Error 404, 
        </Typography>
        <Typography variant="headline" component="h2"> 
        </Typography>
        <div className='name'> 
          <Typography variant="headline" component="h1">
            No match found.
          </Typography>
          <img style={{height:"auto", width:"100%", padding:"2em"}}   alt={"notfound"}  src="https://i.kym-cdn.com/photos/images/original/001/416/688/925.jpg_large"></img>
        </div>   
      </div>
    </div>
    );
  }
}

export default NotFound;
