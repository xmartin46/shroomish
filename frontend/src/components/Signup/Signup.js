import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import { Redirect } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import { InputAdornment, withStyles } from '@material-ui/core';
import { RemoveRedEye } from '@material-ui/icons';
import PropTypes from 'prop-types';
import Button from '@material-ui/core/Button';
import Fab from '@material-ui/core/Fab';
import IconButton from '@material-ui/core/IconButton';
import AddIcon from '@material-ui/icons/Add';
import DeleteIcon from '@material-ui/icons/Delete';
import NavigationIcon from '@material-ui/icons/Navigation';
import ArrowDownwardIcon from '@material-ui/icons/ArrowDownward';

const useStyles = theme => ({
  margin: {
    margin: theme.spacing(1),
  },
  extendedIcon: {
    marginRight: theme.spacing(1),
  },
});

class ButtonInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: "",
    };
  }

  render() {
    const { classes } = this.props;

    return (
      <Fab
      variant="extended"
      color="primary"
      aria-label="add"
      style = {{width: '100px'}}
      className={classes.margin}>
        Sign Up
      </Fab>
    );
  }
}

/*PasswordInput.propTypes = {
  classes: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
  value: PropTypes.func.isRequired,
};*/

ButtonInput = withStyles(useStyles)(ButtonInput);

/* ******************************************************************** */

const styles = theme => ({
  eye: {
    cursor: 'pointer',
  },
});

class PasswordInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      passwordIsMasked: true,
    };
  }

  togglePasswordMask = () => {
    this.setState(prevState => ({
      passwordIsMasked: !prevState.passwordIsMasked,
    }));
  };

  render() {
    const { classes } = this.props;
    const { passwordIsMasked } = this.state;

    return (
      <TextField
      id="outlined-margin-dense"
      margin="dense"
      variant="outlined"
      type={passwordIsMasked ? 'password' : 'text'}
      {...this.props}
      InputProps={{
        endAdornment: (
          <InputAdornment position="end">
          <RemoveRedEye
          className={classes.eye}
          onClick={this.togglePasswordMask}
          />
          </InputAdornment>
        ),
      }}
      />
    );
  }
}

PasswordInput.propTypes = {
  classes: PropTypes.object.isRequired,
  onChange: PropTypes.func.isRequired,
  value: PropTypes.func.isRequired,
};

PasswordInput = withStyles(styles)(PasswordInput);

/* ------------------------------------------------------------------------- */

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
    if (this.state.password === this.state.password2) {
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
//        if (response.data.logged_in) {
//         this.props.handleSuccessfulAuth(response.data);
//        }
	  console.log("HIIIIIIIIIII", response)
	  this.props.history.go(-1)
      })
      .catch(error => {
        console.log("Error: ", error)
        alert("User or email are already taken");
      });
    } else {
      alert('Passwords do not match!')
    }
    event.preventDefault();
}
  render() {
    return (
      <div id="divi">
        <form onSubmit={this.handleSubmit}>
        <TextField
        label="Username"
        type="text"
        name="username"
        value={this.state.username}
        onChange={this.handleChange}
        margin="dense"
        variant="outlined"
        style = {{margin:"auto", width:"100%"}}
        required
        />

        <div style={{marginTop:"3vh"}}>
        <TextField
        label="Email"
        type="email"
        name="email"
        value={this.state.email}
        onChange={this.handleChange}
        margin="dense"
        variant="outlined"
        style = {{margin:"auto", width:"100%"}}
        required
        />
        </div>

        <PasswordInput
        label="Password"
        name="password"
        value={this.state.password}
        onChange={this.handleChange}
        style = {{marginTop:"3vh", width:"100%"}}
        required
        />

        <PasswordInput
        label="Confirm password"
        name="password2"
        value={this.state.password2}
        onChange={this.handleChange}
        style = {{marginTop:"3vh", width:"100%"}}
        required
        />
        <div id="button" style = {{marginTop:"10px"}} onClick={this.handleSubmit}>
          <ButtonInput
          onClick={this.handleSubmit}
          />
        </div>
        </form>
        <br/>
        </div>

    );
  }
}

export default Signup;
