import React, { useState, createContext, useCallback } from "react";

const ScoresContext = createContext();
const IncrementContext = createContext();
const DecrementContext = createContext();

const useScores = () => {
  const [mosquito, setMosquito] = useState(0);
  const [flies, setFlies] = useState(0);
  const [cockroach, setCockroach] = useState(0);
  const [tick, setTick] = useState(0);
  const [centipede, setCentipede] = useState(0);
  const [clothingPest, setClothingPest] = useState(0);

  const scores = {
    mosquito,
    flies,
    cockroach,
    tick,
    centipede,
    clothingPest,
  };

  const increment = useCallback((content) => {
    switch (content) {
      case "mosquito":
        setMosquito((value) => value + 1);
        break;
      case "flies":
        setFlies((value) => value + 1);
        break;
      case "cockroach":
        setCockroach((value) => value + 1);
        break;
      case "tick":
        setTick((value) => value + 1);
        break;
      case "centipede":
        setCentipede((value) => value + 1);
        break;
      case "clothingPest":
        setClothingPest((value) => value + 1);
        break;
      default:
        console.warn("incrementの引数が不正です");
    }
  }, []);
  const decrement = useCallback((content) => {
    switch (content) {
      case "mosquito":
        setMosquito((value) => value - 1);
        break;
      case "flies":
        setFlies((value) => value - 1);
        break;
      case "cockroach":
        setCockroach((value) => value - 1);
        break;
      case "tick":
        setTick((value) => value - 1);
        break;
      case "centipede":
        setCentipede((value) => value - 1);
        break;
      case "clothingPest":
        setClothingPest((value) => value - 1);
        break;
      default:
        console.warn("decrementの引数が不正です");
    }
  }, []);
  return { scores, increment, decrement };
};

export const ScoresProvider = ({ children }) => {
  const { scores, increment, decrement } = useScores();
  const e = React.createElement;
  return e(
    ScoresContext.Provider,
    { value: { scores } },
    e(
      IncrementContext.Provider,
      { value: { increment } },
      e(DecrementContext.Provider, { value: { decrement } }, `${children}`)
    )
  );
};

export const useScoresData = () => {
  return useContext(ScoresContext);
};

export const useIncrement = () => {
  return useContext(IncrementContext);
};

export const useDecrement = () => {
  return useContext(DecrementContext);
};

export default useScores;
