import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'


class Information extends Component {
  render() {
    return (

      <div className='main-class'>

<div className='background' />  
<div className="content-wrapper">
                 <Typography variant="headline" component="h2">
                      Hello, welcome to
                  </Typography>
                  <div className='name'> <Typography variant="headline" component="h1"> Shroomish!</Typography></div>
            </div>
      </div>
    
    );
  }
}

export default Information;