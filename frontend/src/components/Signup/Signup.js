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
      loginErrors: "",
      nameError: false,
      emailError: false,
      passwordError: false,
      passwordsMatchError: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount(){
    document.title = `Shroomish - Signup`;
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });

    if (event.target.name == 'username' && event.target.value != "") {
      this.setState({nameError: false})
    } else if (event.target.name == 'username' && event.target.value == "") {
      this.setState({nameError: true})
    } else if (event.target.name == 'password2' && event.target.value == this.state.password) {
      this.setState({passwordsMatchError: false})
    } else if (event.target.name == 'password2' && event.target.value != this.state.password2) {
      this.setState({passwordsMatchError: true})
    } else if (event.target.name == 'password' && !this.validatePassword(event.target.value)) {
      this.setState({passwordError: true})
    } else if (event.target.name == 'password' && this.validatePassword(event.target.value)) {
      this.setState({passwordError: false})
    } else if (event.target.name == 'email' && !this.validateEmail(event.target.value)) {
      this.setState({emailError: true})
    } else if (event.target.name == 'email' && !this.validateEmail(event.target.value)) {
      this.setState({emailError: false})
    }
  }

  validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    this.setState({emailError: !re.test(String(email).toLowerCase())})
    return re.test(String(email).toLowerCase());
  }

  validatePassword(password) {
    var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    this.setState({passwordError: !re.test(String(password))})
    return re.test(String(password))
  }

  handleSubmit(event) {
    //var firstTime = this.state.username == "" || this.state.email == "" || this.state.password == "" || this.state.password2 == "" || this.state.password !== this.state.password2

    this.setState({nameError: this.state.username == "", emailError: this.state.email == "" || !this.validateEmail(this.state.email), passwordError: this.state.password == "" || !this.validatePassword(this.state.password), passwordsMatchError: this.state.password2 == "" || this.state.password !== this.state.password2})

    var errors = this.state.username == "" || this.state.email == "" || !this.validateEmail(this.state.email) || this.state.password == "" || !this.validatePassword(this.state.password) || this.state.password2 == "" || this.state.password !== this.state.password2

    if (!errors) {
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
        if (response.data.message != null) {
          if (response.data.message.detail.includes("Key (name)")) {
            this.setState({nameError: true})
          } else if (response.data.message.detail.includes("Key (email)")) {
            this.setState({emailError: true})
          }
        } else {
            this.props.history.go(-1)
        }
      })
      .catch(error => {
        console.log("Error: ", error.message)
      });
    }

    event.preventDefault();
  }

  render() {
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
      margin="dense"
      variant="outlined"
      style = {{margin:"auto", width:"100%"}}
      helperText={this.state.nameError ? "Empty username or this username has already been taken." : "*Required"}
      required
      />

      <div style={{marginTop:"3vh"}}>
      <TextField
      error={this.state.emailError}
      label="Email"
      type="email"
      name="email"
      value={this.state.email}
      onChange={this.handleChange}
      margin="dense"
      variant="outlined"
      style = {{margin:"auto", width:"100%"}}
      helperText={this.state.emailError ? "Invalid email or this email has already been taken." : "*Required"}
      required
      />
      </div>

      <PasswordInput
      error={this.state.passwordError}
      label="Password"
      name="password"
      value={this.state.password}
      onChange={this.handleChange}
      style = {{marginTop:"3vh", width:"100%"}}
      helperText={this.state.passwordError ? "Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character." : "*Required"}
      required
      />

      <PasswordInput
      error={this.state.passwordsMatchError}
      label="Confirm password"
      name="password2"
      value={this.state.password2}
      onChange={this.handleChange}
      style = {{marginTop:"3vh", width:"100%"}}
      helperText={this.state.passwordsMatchError ? "Passwords do not match." : "*Required"}
      required
      />
      <div id="button" style = {{marginTop:"10px"}} onClick={this.handleSubmit}>
      <ButtonInput
      onClick={this.handleSubmit}
      />
      </div>
      <div >
      <p id="PrivacyLink"> By clicking Sign Up, you agree to our <a href="/PrivacyPolicy">Terms</a>.</p>
      </div>
      </form>
      <br/>
      </div>

    );
  }
}

export default Signup;
