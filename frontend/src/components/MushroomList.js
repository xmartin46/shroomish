import React, { Component } from 'react'
import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';
import * as contentful from 'contentful'
import Mushroom from '../components/Mushroom'

class MushroomList extends Component {
    state = {
        mushrooms: [],
        searchString: ''
    }
    constructor() {
        super()
        this.getMushrooms()
    }
    
	
getMushrooms = () => {
        client.getEntries({
            content_type: 'mushroom',
            query: this.state.searchString
        })
        .then((response) => {
            this.setState({mushrooms: response.items})
            console.log(this.state.mushrooms)
        })
        .catch((error) => {
          console.log("Error occurred while fetching Entries")
          console.error(error)
        })
    }



    onSearchInputChange = (event) => {
        console.log("Search changed ..." + event.target.value)
        if (event.target.value) {
            this.setState({searchString: event.target.value})
        } else {
            this.setState({searchString: ''})
        }
        this.getMushrooms()
    }
    render() {
        return (
            <div>
                { this.state.mushrooms ? (
                    <div>
                        <TextField style={{padding: 24}}
                            id="searchInput"
                            placeholder="Search for mushrooms"   
                            margin="normal"
                            onChange={this.onSearchInputChange}
                            />
                        <Grid container spacing={24} style={{padding: 24}}>
                            { this.state.mushrooms.map(currentMushroom => (
                                <Grid item xs={12} sm={6} lg={4} xl={3}>
                                    <Mushroom mushroom={currentMushroom} />
                                </Grid>
                            ))}
                        </Grid>
                    </div>
                ) : "No mushrooms found" }
            </div>
        )
    }
}
export default MushroomList;
