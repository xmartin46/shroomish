import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API } from '../../consts';
import { Redirect } from 'react-router-dom';






class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      email: "",
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
    axios({
      method: 'POST',
      url: API + '/login',
      data: {
        username: this.state.username,
        password: this.state.password

      }
    })
      .then(response => {
        if (response.data.logged_in) {
          this.props.handleSuccessfulAuth(response.data);
        }
      })
      .catch(error => {
        console.log("login error", error);
      });
    event.preventDefault();
  }


  render() {
    return (
      <div id="divi">
        <form onSubmit={this.handleSubmit}>
        <div>
          <input
            id="email"
            type="email"
            name="email"
            placeholder="Email"
            value={this.state.email}
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

export default Login;
