import React, { useState } from "react";
import top from "./top";
import questions from "./questions";
import result from "./result";

function index(props) {
  const [page, setPage] = useState("top");
  const pageHandler = (page) => setPage(page);

  const [mosquito, setMosquito] = useState(0);
  const [flies, setFlies] = useState(0);
  const [cockroach, setCockroach] = useState(0);
  const [tick, setTick] = useState(0);
  const [centipede, setCentipede] = useState(0);
  const [clothingPest, setClothingPest] = useState(0);
  const [sloth, setSloth] = useState(0);

  const increment = (answer) => {
    switch (answer) {
      case "mosquito":
        setMosquito((mosquito) => mosquito + 1);
        break;
      case "flies":
        setFlies((flies) => flies + 1);
        break;
      case "cockroach":
        setCockroach((cockroach) => cockroach + 1);
        break;
      case "tick":
        setTick((tick) => tick + 1);
        break;
      case "centipede":
        setCentipede((centipede) => centipede + 1);
        break;
      case "clothingPest":
        setClothingPest((clothingPest) => clothingPest + 1);
        break;
      case "sloth":
        setSloth((sloth) => sloth + 1);
        break;
      default:
        console.warn("incrementの引数が不正です");
    }
  };

  const decrement = (answer) => {
    switch (answer) {
      case "mosquito":
        setMosquito((mosquito) => mosquito - 1);
        break;
      case "flies":
        setFlies((flies) => flies - 1);
        break;
      case "cockroach":
        setCockroach((cockroach) => cockroach - 1);
        break;
      case "tick":
        setTick((tick) => tick - 1);
        break;
      case "centipede":
        setCentipede((centipede) => centipede - 1);
        break;
      case "clothingPest":
        setClothingPest((clothingPest) => clothingPest - 1);
        break;
      case "sloth":
        setSloth((sloth) => sloth - 1);
        break;
      default:
        console.warn("incrementの引数が不正です");
    }
  };

  const scores = {
    mosquito,
    flies,
    cockroach,
    tick,
    centipede,
    clothingPest,
    sloth,
  };

  const e = React.createElement;
  return page === "top"
    ? e(top, { onClick: pageHandler })
    : page === "questions"
    ? e(questions, {
        onClick: pageHandler,
        increment: increment,
        decrement: decrement,
      })
    : page === "result"
    ? e(result, { scores: scores })
    : console.warn("pageの値が不正です");
}

export default index;
