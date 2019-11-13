import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import { Redirect } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';

class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: "",
      loginErrors: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    axios({
      method: 'POST',
      url: API + '/login',
      withCredentials: true,
      data: {
        username: this.state.username,
        password: this.state.password
      }
    })
      .then(response => {
        this.props.history.go(-1)
        // if (response.data.logged_in) {
        //   this.props.handleSuccessfulAuth(response.data);
        // }
      })
      .catch(error => {
        alert("User does not exist or password do not match!");
      });
  }

  render() {
    return (
      <div id="divi" /*className={classes.container}*/>
        <form onSubmit={this.handleSubmit}>
          <div>
	    <TextField
              label="Name"
              id="outlined-margin-dense"
  //          className={classes.textField}
              helperText="Some important text"
              margin="dense"
              variant="outlined"
	      style = {{margin:"auto", width:"50%"}}
            />
  	  </div>
	  <div>
            <button id="button" type="submit">Login</button>
          </div>
          <div>
            <a id="signuplink" href="../Signup" >Lacking an account?, Create one now, sign up!</a>
          </div>
        </form>
      </div>



    );
  }
}
/*
<div>
          <input
            id="username"
            type="text"
            name="username"
            placeholder="username"
            value={this.state.username}
            onChange={this.handleChange}
            required
          />
            </div>
            <div>
          <input
            id="password"
            type="password"
            name="password"
            placeholder="Password"
            value={this.state.password}
            onChange={this.handleChange}
            required
          />
          <div>*/

export default Login;
