import React from 'react'
import { Map, TileLayer, Marker, Popup } from 'react-leaflet';
import HeatmapLayer from './src/HeatmapLayer';
import './main.css';
import Typography from '@material-ui/core/Typography'
import { API } from '../../consts';
import axios from 'axios'
import L from 'leaflet'

const pointerIcon = new L.Icon({
  // iconUrl: 'http://leafletjs.com/examples/custom-icons/leaf-green.png',
  // iconRetinaUrl: require('../assets/pointerIcon.svg'),
  // shadowUrl: 'http://leafletjs.com/examples/custom-icons/leaf-shadow.png',
  iconUrl: require('./assets/icon.png'),
  iconAnchor: [5, 55],
  popupAnchor: [10, -44],
  iconSize: [25, 55],
  // shadowUrl: './assets/icon.png',
  shadowSize: [68, 95],
  shadowAnchor: [20, 92],
})

async function getData (id, latlng) {
  try {
    var llista = await axios({
        method: 'POST',
        withCredentials: true,
        url: API + '/heatmap/'+ id + "/" + latlng
      })
      .then(res => {
        console.log("Inserted!")
      })
      .catch(err => {
        console.error(err)
      })
    } catch (err) {
      console.error(err);
  }
}

class MapExample extends React.Component {

  constructor() {
    super();
    this.state = {
      latitude: '',
      longitude: '',
      data: [],
      radius: 20,
      blur: 20,
      max: 0.5,
      limitAddressPoints: true,
      markers: []
    };
  }

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

  componentDidMount(){
    document.title = `Shroomish-heatmap`;
  }

  componentWillMount() {
    let params = new URLSearchParams(this.props.location.search);
    console.log("params: " + params)
    let id = params.get("id");
    if(id == null){
      id = ""
    }
    console.log(id)
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
        this.setState({ latitude: '60.192059', longitude: '24.945831' })
      })
    }

  }

  handleClick = (e) => {
    if (document.cookie.includes("Create a .env pls")) {
        const {markers} = this.state
        markers.push(e.latlng)
        this.setState({markers})
    } else {
	// Talk about how to say it to the clients
        alert("You have to be logged in in order to be able to add some points!")
    }
  }

  handleSendButton = (e) => {
    const { markers } = this.state
    if (markers.length > 0) {
      for (var i = 0; i < markers.length; i++) {
        console.log(markers[i])
        const lat = markers[i]["lat"]
        const lng = markers[i]["lng"]
        var latlng = "[" + lat + ", " + lng + "]"
        console.log("Maker " + i + " => latlng: " + latlng)

        let params = new URLSearchParams(this.props.location.search);
        let id = params.get("id");
        if(id == null){
          id = ""
        }

        getData(id, latlng).then(function(result) {})
      }

      while (markers.length > 0) {
        markers.pop()
      }
      this.setState({ markers })
    }
  }

  handleMarker = (e, idx) => {
    const { markers } = this.state
    for(var i = markers.length - 1; i >= 0; i--) {
      if(i == e) markers.splice(i, 1);
    }
    this.setState({markers})
  }

  render() {
    const gradient = {
      0.1: '#89BDE0', 0.2: '#96E3E6', 0.4: '#82CEB6',
      0.6: '#FAF3A5', 0.8: '#F5D98B', '1.0': '#DE9A96'
    };

    const { latitude, longitude } = this.state

    return (
      <div>
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
      {this.state.markers.map((position, idx) =>
        <Marker key={`marker-${idx}`} position={position} icon={pointerIcon} onClick={this.handleMarker.bind(this, idx)}>
        </Marker>
      )}
      </Map>
      </div>
      <div onClick={(e) => this.handleSendButton(e)} style={{display:"flex", justifyContent:"center", marginTop:"10px", marginBottom:"20px"}}>
      <button className={"mapButton"} >Send locations!</button>
      </div>
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
