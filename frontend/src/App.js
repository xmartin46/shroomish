import React from 'react';
import logo from './logo.svg';
import './App.css';
import HomepageImage from './components/HomepageImage'
//import NavBar from './components/NavBar'
//import MushroomList from './components/MushroomList'
import PrimarySearchAppBar from './components/PrimarySearchAppBar'

function App() {
  return (
    <div className="App">
	  <div>
	  <PrimarySearchAppBar/>
	  </div>
      <header className="App-header">
      <HomepageImage/>
	<p>
        Mushroom Classifier
	</p>
	  </header>
    </div>
  );
}

export default App;
