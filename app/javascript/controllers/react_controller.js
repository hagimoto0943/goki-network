import { Controller } from "@hotwired/stimulus";
import React from "react";
import ReactDOM from "react-dom";
import index from "components/index";

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    // console.log("コネクト成功");

    const e = React.createElement;
    const root = document.getElementById("root");
    const tool = JSON.parse(root.dataset.json);
    const createRoot = ReactDOM.createRoot(root);
    createRoot.render(e(index, { tool: { tool } }), root);
  }
}
