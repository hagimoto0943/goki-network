import { Controller } from "@hotwired/stimulus";
import React from "react";
import ReactDOM from "react-dom";
import index from "../components/index";
import top from "../components/top";
import questions from "../components/questions";
import result from "../components/result";

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    console.log("コネクト成功");

    const e = React.createElement;
    const root = document.getElementById("root");
    const post = JSON.parse(root.dataset.json);
    const createRoot = ReactDOM.createRoot(root);
    createRoot.render(e(index, { post: { post } }), root);
  }
}
