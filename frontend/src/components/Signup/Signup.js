import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import { Redirect } from 'react-router-dom';







class Signup extends Component {
  constructor(props) {
    super(props);


    this.state = {
      username: "",
      email: "",
      password: "",
      password2: "",
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
        url: API + '/signup',
        data: {
          username: this.state.username,
          email: this.state.email,
          password: this.state.password,
          password2: this.state.password2
        }
      })
      .then(response => {
        if (response.data.logged_in) {
          this.props.handleSuccessfulAuth(response.data);

        }
      })
      .catch(error => {
        console.log("Sign up error", error);
      });
    event.preventDefault();
}
  render() {
    return (
      <div id="divi">
        <form onSubmit={this.handleSubmit}>
        <div>
          <input
            id="username"
            type="text"
            name="username"
            placeholder="Username"
            value={this.state.username}
            onChange={this.handleChange}
            required
          />
            </div>
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
            className="password"
            type="password"
            name="password"
            placeholder="Password"
            value={this.state.password}
            onChange={this.handleChange}
            required
          />
          <br/>
          <br/>
          <input
            className="password"
            type="password"
            name="password2"
            placeholder="Confirm password"
            value={this.state.password2}
            onChange={this.handleChange}
            required
          />
          </div>
          <div >
            <p id="PrivacyLink"> By clicking Sign Up, you agree to our <a href="/PrivacyPolicy">Terms</a>.</p>
          <button id="button" type="submit">Sign up</button>

          </div>
        </form>
        <br/>
        </div>

    );
  }
}

export default Signup;
