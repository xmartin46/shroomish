import React, { Component } from 'react';
import './main.css';
import Typography from '@material-ui/core/Typography'
import axios from 'axios'
import { API, PUBLIC_URL } from '../../consts';
import { Redirect } from 'react-router-dom';

class PrivacyPolicy extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <section id="section">
        <h1>Privacy Policy</h1>
          <p align="justify">Your privacy is important to us. It is Shroomish´s policy to respect your privacy regarding any information we may collect from you across our website, <a href="http://shroomish.ml">http://shroomish.ml</a>, and other sites we own and operate.</p>
          <p align="justify">We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.</p>
          <p align="justify">We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.</p>
          <p align="justify">We don’t share any personally identifying information publicly or with third-parties, except when required to by law.</p>
          <p align="justify">Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.</p>
          <p align="justify">You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.</p>
          <p align="justify">Your continued use of our website will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.</p>
          <p align="justify">This policy is effective as of 13 November 2019.</p>
    </section>
    );
  }
}


export default PrivacyPolicy;
