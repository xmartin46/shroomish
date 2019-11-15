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
        Login
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

class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: "",
      nameError: false,
      passwordError: false,
      showPassword: false
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount(){
    document.title = `Shroomish - Login`;
  }

  handleChange = (event) => {
    console.log(this.state.firstTime)
    this.setState({[event.target.name]: event.target.value});
    //if (this.state.firstTime) {
      /*if (event.target.name == 'username' && this.state.username == "") {
        this.setState({firstTime: this.state.password == ""})
      } else {
        this.setState({firstTime: this.state.username == ""})
      }*/
    /*} else {
      if (event.target.name == 'username') {
        this.setState({firstTime: this.state.username == ""})
      } else {
        this.setState({firstTime: this.state.password == ""})
      }
    }*/
  }

  handleSubmit = (event) => {
    var firstTime = this.state.username == "" || this.state.password == ""

    if (!firstTime) {
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
        if (response.data == "No user found") {
          this.setState({nameError: true})
        } else if (response.data == "Incorrect password") {
          this.setState({nameError: false, passwordError: true})
        } else {
          this.setState({nameError: false, passwordError: false})
          this.props.history.go(-1)
        }
      })
      .catch(error => {
        console.log("Error: ", JSON.stringify(error))
        alert("User does not exist or password do not match!");
      });
    } else {
      this.setState({nameError: this.state.username == "", passwordError: this.state.password == ""})
    }
  }

  render() {
    const { password } = this.state;

    return (
      <div id="divi">
      <form onSubmit={this.handleSubmit}>
      <TextField
      error={this.state.nameError}
      label="Username"
      type="text"
      name="username"
      value={this.state.username}
      onChange={this.handleChange}
      helperText="*Required"
      margin="dense"
      variant="outlined"
      style = {{margin:"auto", width:"100%"}}
      helperText={this.state.nameError ? ("The username you have introduced does not match with any of the accounts. Sign Up to create an account now.") : "*Required"}
      required
      />

      <PasswordInput
      error={this.state.passwordError}
      label="Password"
      name="password"
      value={this.state.password}
      onChange={this.handleChange}
      style = {{marginTop:"3vh", width:"100%"}}
      helperText={this.state.passwordError ? ("Password invalid. ¿Have you forgotten your password?") : "*Required"}
      required
      />

      <div id="button" style = {{marginTop:"10px"}} onClick={this.handleSubmit}>
        <ButtonInput
        onClick={this.handleSubmit}
        />
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
