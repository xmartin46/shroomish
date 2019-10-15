import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API } from '../../consts';







class Signup extends Component {
  constructor(props) {
    super(props);


    this.state = {
      email: "",
      password: "",
      loginErrors: ""
    };
    this.password2 ="";
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    const password2 = this.password2;
    const { email, password } = this.state;
    if(!password.equals(password2)){prompt("Password and confirmation not equal")}
    else{

    /*axios
      .post(
        "http://localhost:3001/sessions",
        {
          user: {
            email: email,
            password: password
          }
        },
        { withCredentials: true }
      )
      .then(response => {
        if (response.data.logged_in) {
          this.props.handleSuccessfulAuth(response.data);
        }
      })
      .catch(error => {
        console.log("login error", error);
      });
    event.preventDefault();
    */
  }
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
          <div>
          <button id="button" type="submit">Login</button>

          </div>
        </form>
        <br/>
        </div>

    );
  }
}

export default Signup;
