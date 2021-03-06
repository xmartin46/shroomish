import React from 'react';
import { fade, makeStyles, useTheme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import InputBase from '@material-ui/core/InputBase';
import MenuItem from '@material-ui/core/MenuItem';
import List from '@material-ui/core/List';
import Menu from '@material-ui/core/Menu';
import PeopleIcon from '@material-ui/icons/People';
import MenuIcon from '@material-ui/icons/Menu';
import InsertPhotoIcon from '@material-ui/icons/InsertPhoto';
import HomeIcon from '@material-ui/icons/Home';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import SearchIcon from '@material-ui/icons/Search';
import AccountCircle from '@material-ui/icons/AccountCircle';
import Divider from '@material-ui/core/Divider';
import Drawer from '@material-ui/core/Drawer';
import axios from 'axios'
import logo from '../logo.svg'
import { API, PUBLIC_URL } from '../consts';
import MuiThemeProvider from '@material-ui/core/styles/MuiThemeProvider';


const drawerWidth = 240;

const useStyles = makeStyles(theme => ({
  grow: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    display: 'none',
    [theme.breakpoints.up('sm')]: {
      display: 'block',
    },
  },
  search: {
    position: 'relative',
    borderRadius: theme.shape.borderRadius,
    backgroundColor: fade(theme.palette.common.white, 0.15),
    '&:hover': {
      backgroundColor: fade(theme.palette.common.white, 0.25),
    },
    marginRight: theme.spacing(2),
    marginLeft: 0,
    width: '100%',
    [theme.breakpoints.up('sm')]: {
      marginLeft: theme.spacing(3),
      width: '50%',
    },
  },
  searchIcon: {
    width: theme.spacing(7),
    height: '100%',
    position: 'absolute',
    pointerEvents: 'none',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  inputRoot: {
    color: 'inherit',
  },
  inputInput: {
    padding: theme.spacing(1, 1, 1, 7),
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '100%',
    },
  },
  sectionDesktop: {
    display: 'none',
    [theme.breakpoints.up('md')]: {
      display: 'flex',
    },
  },
  sectionMobile: {
    display: 'flex',
    [theme.breakpoints.up('md')]: {
      display: 'none',
    },
  },
  root: {
    display: 'flex',
  },
  appBar: {
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
  },
  appBarShift: {
    width: `calc(100% - ${drawerWidth}px)`,
    marginLeft: drawerWidth,
    transition: theme.transitions.create(['margin', 'width'], {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  hide: {
    display: 'none',
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    width: drawerWidth,
  },
  drawerHeader: {
    display: 'flex',
    alignItems: 'center',
    padding: theme.spacing(0, 1),
    ...theme.mixins.toolbar,
    justifyContent: 'flex-end',
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    marginLeft: -drawerWidth,
  },
  contentShift: {
    transition: theme.transitions.create('margin', {
      easing: theme.transitions.easing.easeOut,
      duration: theme.transitions.duration.enteringScreen,
    }),
    marginLeft: 0,
  }
}));



export default function PrimarySearchAppBar() {
  const classes = useStyles();
  const theme = useTheme();
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [mobileMoreAnchorEl, setMobileMoreAnchorEl] = React.useState(null);
  const [open, setOpen] = React.useState(false);
  const handleDrawerOpen = () => {
    setOpen(true);
  };

  const handleDrawerClose = () => {
    setOpen(false);
  };
  const isMenuOpen = Boolean(anchorEl);
  const isMobileMenuOpen = Boolean(mobileMoreAnchorEl);

  const handleProfileMenuOpen = event => {
    setAnchorEl(event.currentTarget);
  };


  const handleSearch = e => {
    if(e.keyCode === 13){
      window.location.href = "/gallery?id="+e.target.value;
    }
  }

  const handleMobileMenuClose = () => {
    setMobileMoreAnchorEl(null);
  };

  const handleMenuClose = () => {
    setAnchorEl(null);
  }

  const signOut = () => {
    axios({
      method: 'GET',
      url: API + '/logout',
      withCredentials: 'true'
    })
    .then(response => {
      window.location.href = ""
    })
    .catch(error => {
      console.log("login error", error);
    });
  }

  const handleMobileMenuOpen = event => {
    setMobileMoreAnchorEl(event.currentTarget);
  };

  const menuId = 'primary-search-account-menu';
  const renderMenuNotLoggedIn = (
    <Menu
    anchorEl={anchorEl}
    anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
    id={menuId}
    keepMounted
    transformOrigin={{ vertical: 'top', horizontal: 'right' }}
    open={isMenuOpen}
    onClose={handleMenuClose}
    >
    <MenuItem button component="a" href="/Login" key="Login">Log In</MenuItem>
    <MenuItem button component="a" href="/Signup" key="Login">Sign Up</MenuItem>
    </Menu>
  );

  const renderMenuLoggedIn = (
    <Menu
    anchorEl={anchorEl}
    anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
    id={menuId}
    keepMounted
    transformOrigin={{ vertical: 'top', horizontal: 'right' }}
    open={isMenuOpen}
    onClose={handleMenuClose}
    >
    <MenuItem onClick={signOut}>Sign Out</MenuItem>
    </Menu>
  );


  const mobileMenuId = 'primary-search-account-menu-mobile';
  const renderMobileMenuNotLoggedIn = (
      <Menu
      anchorEl={mobileMoreAnchorEl}
      anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
      id={mobileMenuId}
      keepMounted
      transformOrigin={{ vertical: 'top', horizontal: 'right' }}
      open={isMobileMenuOpen}
      onClose={handleMobileMenuClose}
      >

      <MenuItem button component="a" href="/Login" key="Login">Log In</MenuItem>
      <MenuItem button component="a" href="/Signup" key="Login">Sign Up</MenuItem>
      </Menu>
      );

    const renderMobileMenuLoggedIn = (
        <Menu
        anchorEl={mobileMoreAnchorEl}
        anchorOrigin={{ vertical: 'top', horizontal: 'right' }}
        id={mobileMenuId}
        keepMounted
        transformOrigin={{ vertical: 'top', horizontal: 'right' }}
        open={isMobileMenuOpen}
        onClose={handleMobileMenuClose}
        >

        <MenuItem onClick={signOut}>Sign Out</MenuItem>
        </Menu>
        );

    if (document.cookie.includes("Create a .env pls")) {
      return (

        <MuiThemeProvider theme={theme}>
        <div className={classes.grow}>
        <AppBar position="static" style={{ background:'#f44336'}}>
        <Toolbar>
        <IconButton
        edge="start"
        onClick={handleDrawerOpen}
        className={classes.menuButton && open && classes.hide}
        color="inherit"
        aria-label="open drawer"
        >
        <MenuIcon />
        </IconButton>
        <Typography className={classes.title} variant="h6" noWrap  component="a" style={{ textDecoration: 'none', color : "#ffff"}} href="/" key="Home">
        <img src={logo} style={{height:"3.5vh"}}></img>Shroomish
        </Typography>
        <div className={classes.search}>
        <div className={classes.searchIcon}>
        <SearchIcon />
        </div>
        <InputBase
        placeholder="Search…"
        classes={{
          root: classes.inputRoot,
          input: classes.inputInput,
        }}
        inputProps={{ 'aria-label': 'search' }}
        onKeyDown={handleSearch}
        />
        </div>
        <div className={classes.grow} />
        <div className={classes.sectionDesktop}>
        <IconButton
        edge="end"
        aria-label="account of current user"
        aria-controls={menuId}
        aria-haspopup="true"
        onClick={handleProfileMenuOpen}
        color="inherit"
        >
        <AccountCircle />
        </IconButton>
        </div>
        <div className={classes.sectionMobile}>
        <IconButton
        aria-label="show more"
        aria-controls={mobileMenuId}
        aria-haspopup="true"
        onClick={handleMobileMenuOpen}
        color="inherit"
        >
        <AccountCircle />
        </IconButton>
        </div>
        </Toolbar>
        </AppBar>
        <Drawer
        className={classes.drawer}
        variant="persistent"
        anchor="left"
        open={open}
        classes={{
          paper: classes.drawerPaper,
        }}
        >
        <div className={classes.drawerHeader}>
        <IconButton onClick={handleDrawerClose}>
        {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
        </IconButton>
        </div>
        <Divider />
        <List>
        <ListItem button component="a" href="/" key="Home">
        <ListItemIcon> <HomeIcon/> </ListItemIcon>
        <ListItemText primary="Home"/>
        </ListItem>

        <ListItem button component="a" href="/classify" key="Classifier">
        <ListItemIcon> <InsertPhotoIcon/> </ListItemIcon>
        <ListItemText primary="Classifier" />
        </ListItem>

        <ListItem button component="a" href="/AboutUs" key="AboutUs">
        <ListItemIcon> <PeopleIcon/> </ListItemIcon>
        <ListItemText primary="About Us" />
        </ListItem>


        </List>
        </Drawer>
        {renderMobileMenuLoggedIn}
        {renderMenuLoggedIn}
        </div>
        </MuiThemeProvider>
        );
      } else {
        return(
          <MuiThemeProvider theme={theme}>
          <div className={classes.grow}>
          <AppBar position="static" style={{ background:'#f44336'}}>
          <Toolbar>
          <IconButton
          edge="start"
          onClick={handleDrawerOpen}
          className={classes.menuButton && open && classes.hide}
          color="inherit"
          aria-label="open drawer"
          >
          <MenuIcon />
          </IconButton>
          <Typography className={classes.title} variant="h6" noWrap  component="a" style={{ textDecoration: 'none', color : "#ffff"}} href="/" key="Home">
          <img src={logo} style={{height:"3.5vh"}}></img>Shroomish
          </Typography>
          <div className={classes.search}>
          <div className={classes.searchIcon}>
          <SearchIcon />
          </div>
          <InputBase
          placeholder="Search…"
          classes={{
            root: classes.inputRoot,
            input: classes.inputInput,
          }}
          inputProps={{ 'aria-label': 'search' }}
          onKeyDown={handleSearch}
          />
          </div>
          <div className={classes.grow} />
          <div className={classes.sectionDesktop}>
          <IconButton
          edge="end"
          aria-label="account of current user"
          aria-controls={menuId}
          aria-haspopup="true"
          onClick={handleProfileMenuOpen}
          color="inherit"
          >
          <AccountCircle />
          </IconButton>
          </div>
          <div className={classes.sectionMobile}>
          <IconButton
          aria-label="show more"
          aria-controls={mobileMenuId}
          aria-haspopup="true"
          onClick={handleMobileMenuOpen}
          color="inherit"
          >
          <AccountCircle />
          </IconButton>
          </div>
          </Toolbar>
          </AppBar>
          <Drawer
          className={classes.drawer}
          variant="persistent"
          anchor="left"
          open={open}
          classes={{
            paper: classes.drawerPaper,
          }}
          >
          <div className={classes.drawerHeader}>
          <IconButton onClick={handleDrawerClose}>
          {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
          </IconButton>
          </div>
          <Divider />
          <List>
          <ListItem button component="a" href="/" key="Home">
          <ListItemIcon> <HomeIcon/> </ListItemIcon>
          <ListItemText primary="Home"/>
          </ListItem>

          <ListItem button component="a" href="/classify" key="Classifier">
          <ListItemIcon> <InsertPhotoIcon/> </ListItemIcon>
          <ListItemText primary="Classifier" />
          </ListItem>

          <ListItem button component="a" href="/AboutUs" key="AboutUs">
          <ListItemIcon> <PeopleIcon/> </ListItemIcon>
          <ListItemText primary="About Us" />
          </ListItem>


          </List>
          </Drawer>
          {renderMobileMenuNotLoggedIn}
          {renderMenuNotLoggedIn}
          </div>
          </MuiThemeProvider>
          );
      }
    }
