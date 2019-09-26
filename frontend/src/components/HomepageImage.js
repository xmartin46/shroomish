import React from 'react';

function HomepageImage(){
 const url = 'https://ichef.bbci.co.uk/images/ic/480xn/p04gk42r.jpg';
  return (
    <img src={url} style={{width: 650}} alt='Image of a mushroom' />
  );

}

export default HomepageImage;
