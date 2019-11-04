import React, { Component} from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import PrimarySearchAppBar from './components/PrimarySearchAppBar';
import { PUBLIC_URL } from './consts';

const Gallery = React.lazy(() =>
import("./components/Gallery/Gallery"));

const NotFound = React.lazy(() =>
import("./components/NotFound/NotFound"));

const Classify = React.lazy(() =>
import("./components/Classifier/Classify"));


const Information = React.lazy(() =>
import("./components/Information/Information"));

const Login = React.lazy(() =>
import("./components/Login/Login"));

const Signup = React.lazy(() =>
import("./components/Signup/Signup"));

const Heatmap = React.lazy(() =>
import("./components/Heatmap/Heatmap"));

const renderLoader = () => <div className="loader"></div>;


class App extends Component {
  componentDidMount(){
    document.title = "Shroomish";
  }
  render() {
    return (
      <React.Suspense fallback={renderLoader()}>
      <BrowserRouter>
      <Switch>
      <div>
      <div>
      <PrimarySearchAppBar/>
      </div>
      <Route path={PUBLIC_URL + '/'} exact component={Gallery} />
      <Route path={PUBLIC_URL + '/classify/'} exact component={Classify} />
      <Route path={PUBLIC_URL + '/gallery/'} exact component={Gallery} />
      <Route path={PUBLIC_URL + '/info/:id'} exact component={Information} />
      <Route path={PUBLIC_URL + '/NotFound'} exact component={NotFound} />
      <Route path={PUBLIC_URL + '/Login'} exact component={Login}/>
      <Route path={PUBLIC_URL + '/Signup'} exact component={Signup}/>
      <Route path={PUBLIC_URL + '/heatmap/'} exact component={Heatmap}/>
      </div>
      </Switch>
      </BrowserRouter>
      </React.Suspense>
      );
    }
}


  export default App;
