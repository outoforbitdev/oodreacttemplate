import React, { Component } from 'react';

import "../lib/oodreactts/v1/styles/OODCore.css"

export class Home extends Component {
  static displayName = Home.name;

  render () {
    return (
      <div className={"OODCoreStyleCenteredContent"} style={{height: "100vh"}}>
        <h1>Out of Orbit Development</h1>
      </div>
    );
  }
}
