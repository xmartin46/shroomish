import React, { Component} from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import MuiThemeProvider from "@material-ui/core/styles/MuiThemeProvider";
import PrimarySearchAppBar from './components/PrimarySearchAppBar';
import theme from './components/theme';
import { PUBLIC_URL } from './consts';

const Gallery = React.lazy(() => 
import("./components/Gallery/Gallery"));

// const Homepage = React.lazy(() => 
// import("./components/Homepage/Homepage"));

const Classify = React.lazy(() => 
import("./components/Classifier/Classify"));


const Information = React.lazy(() => 
import("./components/Information/Information"));


const renderLoader = () => <div className="loader"></div>;


class App extends Component {
  componentDidMount(){
    document.title = "Shroomish";
  }
  render() {
    return (
      <React.Suspense fallback={renderLoader()}>
      <MuiThemeProvider muitheme={theme}>
      <Router>
      <div>
      <div>
      <PrimarySearchAppBar/>
      </div>
      <Route path={PUBLIC_URL + '/'} exact component={Gallery} />
      <Route path={PUBLIC_URL + '/classify/'} exact component={Classify} />
      <Route path={PUBLIC_URL + '/gallery/'} exact component={Gallery} />
      <Route path={PUBLIC_URL + '/info/:id'} exact component={Information} />
      </div>
      </Router>
      </MuiThemeProvider>
      </React.Suspense>
      );
    }
}

  
  export default App;
  