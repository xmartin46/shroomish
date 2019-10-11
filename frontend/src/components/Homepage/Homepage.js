import React, { Component } from 'react';
import { Box, Grid, Button } from 'grommet';
import './main.css';

class Main extends Component {
  constructor(props) {
    super(props);
  }



  render() {
    return (

      <div className='main-class'>

        <div className='background' />
        <Grid
            className='mainGrid'
            columns={['fill']}
            rows={['medium', 'small']}
            gap='none'
            areas={[
              { name: 'header', start: [0, 0], end: [1, 0] },
              { name: 'content', start: [0, 1], end: [1, 1] },
            ]}
          >
            <Box className ='box-header' gridArea='header'>
              <h1>Hello,</h1>
              <h2>welcome to 
                  <div className='name'> Mushroom Classifier!</div>
              </h2>
            </Box>
            
          </Grid>
    
      </div>
    
    );
  }
}

export default Main;