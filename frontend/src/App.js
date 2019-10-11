import React, { Component } from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Homepage from './components/Homepage/Homepage';
import Classify from './components/Classifier/Classify';
import Gallery from './components/Gallery/Gallery';
import PrimarySearchAppBar from './components/PrimarySearchAppBar'

class App extends Component {
  render() {
    return (
      <Router>
        <div>
        <div>
	  <PrimarySearchAppBar/>
	  </div>
          <Route path='/' exact component={Homepage} />
          <Route path='/classify/' exact component={Classify} />
          <Route path='/gallery/' exact component={Gallery} />  

        </div>
      </Router>
    );
  }
}

export default App;