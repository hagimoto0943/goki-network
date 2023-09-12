import React from "react";
// import axios from "axios";

const result = (props) => {
  const result = {
    mosquito: props.scores.mosquito,
    flies: props.scores.flies,
    cockroach: props.scores.cockroach,
    tick: props.scores.tick,
    centipede: props.scores.centipede,
    clothingPest: props.scores.clothingPest,
    sloth: props.scores.sloth,
  };

  const e = React.createElement;
  return e("div", null, [
    `${result.mosquito}`,
    `${result.flies}`,
    `${result.cockroach}`,
    `${result.tick}`,
    `${result.centipede}`,
    `${result.clothingPest}`,
    `${result.sloth}`,
  ]);
};
export default result;
