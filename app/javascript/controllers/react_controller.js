import { Controller } from "@hotwired/stimulus";
import React from "react";
import ReactDOM from "react-dom";
import App from "../components/App";

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    console.log("コネクト成功");

    const e = React.createElement;
    const root = ReactDOM.createRoot(document.getElementById("root"));
    root.render(e(App), root);
  }
}
