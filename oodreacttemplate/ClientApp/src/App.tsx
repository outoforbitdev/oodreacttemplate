import React, { Component } from "react";
import { Route } from "react-router-dom";
import { Home } from "./components/Home";

import "./custom.css"
import { setTheme, Themes } from "./lib/oodreactts/v1/utils/webpage";
import "./lib/oodreactts/src/v1/styles/Themes.css"

export default class App extends Component {
  static displayName = App.name;

  render () {
    setTheme(Themes.Dark)
    return (
      <Route exact path="/" component={Home} />
    );
  }
}
