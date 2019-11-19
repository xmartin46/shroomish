import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import { Redirect } from 'react-router-dom';
import ric from '../../images/ricardo.jpeg'
import xa from '../../images/xavier.jpeg'
import adria from '../../images/adria.jpeg'
import githublogo from '../../images/index.png'





class AboutUs extends Component {
  constructor(props) {
    super(props);
  }


  componentDidMount(){
    document.title = `Shroomish - The Team`;
  }


  render() {
    return (
      <div class="div1">
        <table align="center">
        <h1>The team</h1>
            <tr>
              <div class="hvrbox">
              <td align="center">
                <img src={ric} alt="Mountains" class="hvrbox-layer_bottom"  height="300"/>
                <div class="hvrbox-layer_top">
                  <div class="hvrbox-text"> <br /><br /><br /><br /><br /><br /><br />I like to do frontend to leave things pretty.<br /><br /><br />
                                            <br /><br /><br />
                    <a href="https://github.com/rlongares">
                      <img src={githublogo} class="git"  />
                    </a>
                  </div>
                </div>
                </td>
              </div>
              <div class="h2">
                <td align="center"><b>Ricardo María Longares Díez</b>
                <br />
                	ricardomaria.longaresdiez@aalto.fi
                </td>
              </div>
            </tr>
            <tr>
            <div class="hvrbox">
            <td align="center">
              <img src={xa} alt="Mountains" class="hvrbox-layer_bottom"  height="250"/>
              <div class="hvrbox-layer_top">
                <div class="hvrbox-text"><br /><br /><br /><br />Do you need a database? I
                                    am your guy! <br /><br /><br /><br /><br /><br /><br />

                  <a href="https://github.com/xmartin46">
                    <img src={githublogo} class="git" />
                  </a>
                </div>
              </div>
              </td>
            </div>
              <div class="h2">
                <td align="center"><b>Xavier Martín Ballesteros</b>
                <br />
                	xavier.martinballesteros@aalto.fi
                </td>
              </div>
            </tr>
             <tr>
             <div class="hvrbox">
             <td align="center">
               <img src={adria} alt="Mountains" class="hvrbox-layer_bottom"  height="250"/>
               <div class="hvrbox-layer_top">
                 <div class="hvrbox-text" ><br /><br /><br /><br />I love mushroom so much that I went
                  to the forest to classify them all, I am good in frontend too<br /><br /><br /><br />
                  <a href="https://github.com/adriacabeza">
                    <img src={githublogo} class="git"/>
                  </a>
                 </div>
               </div>
               </td>
             </div>
              <div class="h2">
                <td align="center"><b>Adrià Cabeza Sant´Anna</b>
                <br />
                	adria.cabezasantanna@aalto.fi
                </td>
              </div>
            </tr>
            <tr>
              <div class="link">
                <a href="../PrivacyPolicy">Here you have our policy about privicy in detail</a>
              </div>
            </tr>

        </table>
      </div>


    );
  }
}

export default AboutUs;
