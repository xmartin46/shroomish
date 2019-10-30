import React, { Component } from 'react'
import { render } from 'react-dom';
import { Map, TileLayer } from 'react-leaflet';
import HeatmapLayer from './src/HeatmapLayer';
import './main.css';
import PropTypes from 'prop-types';
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardContent from '@material-ui/core/CardContent'
import CardMedia from '@material-ui/core/CardMedia'
import Button from '@material-ui/core/Button'
import Typography from '@material-ui/core/Typography'
import { API } from '../../consts';
import axios from 'axios'

class MapExample extends React.Component {

  state = {
    latitude: '',
    longitude: '',
    data: [],
    radius: 20,
    blur: 20,
    max: 0.5,
    limitAddressPoints: true
  };

  /**
   * Toggle limiting the address points to test behavior with refocusing/zooming when data points change
   */
  // toggleLimitedAddressPoints() {
  //   if (this.state.limitAddressPoints) {
  //     this.setState({ addressPoints: addressPoints.slice(500, 1000), limitAddressPoints: false });
  //   } else {
  //     this.setState({ addressPoints, limitAddressPoints: true });
  //   }
  // }

  componentWillMount() {
    let params = new URLSearchParams(this.props.location.search);
    console.log("params: " + params)
    let id = params.get("id");
    if(id == null){
      id = ""
    }
    let llista = axios({
      method: 'GET',
      url: API + '/heatmap/'+ id
    })
      .then(res => {
        if(res.data.message != null){
          let llista = axios({
            method: 'GET',
            url: API + '/search/'
          }).then(res2 => this.setState({data:JSON.parse(JSON.stringify(res2.data))}))
          .catch(err => {
            console.error(err)
          })
        }
        else{
          this.setState({data:res.data[0].coordinates})
        }
      })
      .catch(err => {
        console.error(err)
      })
      if (!llista) this.setState({data: this.state.coordinates});



      this.getMyLocation()
  }

  getMyLocation() {
    const location = window.navigator && window.navigator.geolocation

    if (location) {
      location.getCurrentPosition((position) => {
        this.setState({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude,
        })
      }, (error) => {
        this.setState({ latitude: 'err-latitude', longitude: 'err-longitude' })
      })
    }

  }

  handleClick(e) {
    console.log(e.latlng)
  }

  render() {
    const gradient = {
      0.1: '#89BDE0', 0.2: '#96E3E6', 0.4: '#82CEB6',
      0.6: '#FAF3A5', 0.8: '#F5D98B', '1.0': '#DE9A96'
    };

    const { latitude, longitude } = this.state

    return (
      <div>
        <Map center={[latitude, longitude]} zoom={8} onClick={this.handleClick}>
          <HeatmapLayer
            points={this.state.data}
            longitudeExtractor={m => m[1]}
            latitudeExtractor={m => m[0]}
            gradient={gradient}
            intensityExtractor={m => parseFloat(m[2])}
            radius={Number(this.state.radius)}
            blur={Number(this.state.blur)}
            max={Number.parseFloat(this.state.max)}
          />
          <TileLayer
            url="http://{s}.tile.osm.org/{z}/{x}/{y}.png"
            attribution='&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
          />
        </Map>
      </div>
        // <div>
        //   Radius
        //   <input
        //     type="range"
        //     min={1}
        //     max={40}
        //     value={this.state.radius}
        //     onChange={(e) => this.setState({ radius: e.currentTarget.value })}
        //   /> {this.state.radius}
        // </div>
        //
        // <div>
        //   Blur
        //   <input
        //     type="range"
        //     min={1}
        //     max={20}
        //     value={this.state.blur}
        //     onChange={(e) => this.setState({ blur: e.currentTarget.value })}
        //   /> {this.state.blur}
        // </div>
        //
        // <div>
        //   Max
        //   <input
        //     type="range"
        //     min={0.1}
        //     max={3}
        //     step={0.1}
        //     value={this.state.max}
        //     onChange={(e) => this.setState({ max: e.currentTarget.value })}
        //   /> {this.state.max}
        // </div>

    );
  }

}

//render(<MapExample />, document.getElementById('app'));

export default MapExample
