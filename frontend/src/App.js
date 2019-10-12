import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Homepage from './components/Homepage/Homepage';
import Classify from './components/Classifier/Classify';
import Gallery from './components/Gallery/Gallery';
import MuiThemeProvider from "@material-ui/core/styles/MuiThemeProvider";
import PrimarySearchAppBar from './components/PrimarySearchAppBar';
import theme from './components/theme';
import { PUBLIC_URL } from './consts';

class App extends Component {
  render() {
    return (
      <MuiThemeProvider muitheme={theme}>
      <Router>
      <div>
      <div>
      <PrimarySearchAppBar/>
      </div>
      <Route path={PUBLIC_URL + '/'} exact component={Homepage} />
      <Route path={PUBLIC_URL + '/classify/'} exact component={Classify} />
      <Route path={PUBLIC_URL + '/gallery/'} exact component={Gallery} />  
      </div>
      </Router>
      </MuiThemeProvider>
      );
    }
  }
  
  export default App;