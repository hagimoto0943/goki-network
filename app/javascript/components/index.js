import React, { useState } from "react";

export default function index(props) {
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
    ? e(result, { scores: scores, tool: props.tool })
    : console.warn("pageの値が不正です");
}

export const top = (props) => {
  const e = React.createElement;
  return e(
    "div",
    { className: "hero min-h-screen bg-base-200" },
    e(
      "div",
      { className: "hero-content text-center" },
      e("div", { className: "max-w-md" }, [
        e("h1", { className: "text-5xl font-bold" }, "診断"),
        e("p", { className: "py-6" }, "あなたの現状を教えてください"),
        e(
          "button",
          {
            className: "btn btn-neutral",
            onClick: () => props.onClick("questions"),
          },
          "スタート"
        ),
      ])
    )
  );
};

export const questions = (props) => {
  const questionData = [
    {
      questionNumber: 1,
      questionTitle: "あなたが住んでいる地域は？",
      choices: {
        1: "北海道",
        // ゴキ-1,蚊-1
        2: "本州",
        // ゴキ+1,
        3: "四国・九州",
        // ゴキ+1,蚊+1,
      },
      answer: (choice) => {
        if (choice === "北海道") {
          props.decrement("cockroach");
          props.decrement("mosquito");
        } else if (choice === "本州") {
          props.increment("cockroach");
        } else if (choice === "四国・九州") {
          props.increment("cockroach");
          props.increment("mosquito");
        } else {
          console.warn("choiceの値が不正です");
        }
      },
    },
    {
      questionNumber: 2,
      questionTitle: "あなたは何階に住んでいますか？",
      choices: {
        1: "1階",
        // ゴキ+1,蚊+1,ハエ+1,ムカデ＋1,
        2: "2階",
        // 蚊+1,ハエ+1,
        3: "3階以上",
        //ゴキ-1
      },
      answer: (choice) => {
        if (choice === "1階") {
          props.increment("cockroach");
          props.increment("mosquito");
          props.increment("flies");
          props.increment("centipede");
        } else if (choice === "2階") {
          props.increment("mosquito");
          props.increment("flies");
        } else if (choice === "3階以上") {
          props.decrement("cockroach");
        } else {
          console.warn("choiceの値が不正です");
        }
      },
    },
    {
      questionNumber: 3,
      questionTitle: "家の周りに田んぼやため池はありますか？",
      choices: {
        1: "ある",
        // ゴキ+1,蚊+1,ムカデ+1
        2: "ない",
      },
      answer: (choice) => {
        if (choice === "ある") {
          props.increment("cockroach");
          props.increment("mosquito");
          props.increment("centipede");
        } else if (choice === "ない") {
          console.log("変化はありません");
        } else {
          console.warn("choiceの値が不正です");
        }
      },
    },
    {
      questionNumber: 4,
      questionTitle: "家の周りに飲食店はありますか？",
      choices: {
        1: "ある",
        //ゴキ+1
        2: "ない",
      },
      answer: (choice) => {
        if (choice === "ある") {
          props.increment("cockroach");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 5,
      questionTitle: "アレルギーや喘息はありますか？",
      choices: {
        1: "ある",
        //ダニ+1
        2: "少しある",
        3: "ない",
        //ダニ-1
      },
      answer: (choice) => {
        if (choice === "ある") {
          props.increment("tick");
        } else if (choice === "少しある") {
          console.log("変化はありません");
        } else if (choice === "ない") {
          props.decrement("tick");
        } else {
          console.warn("choiceの値が不正です");
        }
      },
    },
    {
      questionNumber: 6,
      questionTitle: "家に一人でいるのが怖いですか？",
      choices: {
        1: "怖い",
        //ゴキ+1,ムカデ+1
        2: "怖くない",
      },
      answer: (choice) => {
        if (choice === "怖い") {
          props.increment("cockroach");
          props.increment("centipede");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 7,
      questionTitle: "あなたの血液型は？",
      choices: {
        1: "A型",
        //蚊-1
        2: "B型",
        3: "O型",
        //蚊+1
        4: "AB型",
      },
      answer: (choice) => {
        if (choice === "A型") {
          props.decrement("mosquito");
        } else if (choice === "O型") {
          props.increment("mosquito");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 8,
      questionTitle: "空き缶や食べカスはすぐにゴミ箱へ入れますか？",
      choices: {
        1: "はい",
        //ゴキ、ハエ、ダニ-1
        2: "いいえ",
      },
      answer: (choice) => {
        if (choice === "はい") {
          props.decrement("cockroach");
          props.decrement("flies");
          props.decrement("tick");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 9,
      questionTitle: "部屋の換気はよくしますか？",
      choices: {
        1: "よくする",
        // ダニ以外+1
        2: "まあまあする",
        3: "全くしない",
        // ダニ以外-1
      },
      answer: (choice) => {
        if (choice === "よくする") {
          props.increment("mosquito");
          props.increment("cockroach");
          props.increment("centipede");
          props.increment("clothingPest");
          props.increment("flies");
        } else if (choice === "全くしない") {
          props.decrement("mosquito");
          props.decrement("cockroach");
          props.decrement("centipede");
          props.decrement("clothingPest");
          props.decrement("flies");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 10,
      questionTitle: "洋服はたくさん持っていますか？",
      choices: {
        1: "たくさん持ってる",
        //衣類害虫+1
        2: "まあまあ持ってる",
        3: "あまり持ってない",
        //衣類害虫-1
      },
      answer: (choice) => {
        if (choice === "たくさん持ってる") {
          props.increment("clothingPest");
        } else if (choice === "あまり持ってない") {
          props.decrement("clothingPest");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 11,
      questionTitle: "部屋の掃除はどれくらいの頻度でしますか？",
      choices: {
        1: "毎日する",
        //コンテンツを全て出す
        2: "たまにする",
        //コンテンツを１つへらす
        3: "あまりしない",
        //コンテンツ２つまで
        4: "全くしない",
        //コンテンツを1つだけ出す
      },
      answer: (choice) => {
        if (choice === "毎日する") {
          props.increment("sloth");
        } else if (choice === "たまにする") {
          props.increment("sloth");
        } else if (choice === "あまりしない") {
          props.decrement("sloth");
        } else if (choice === "全くしない") {
          props.decrement("sloth");
        } else {
          console.warn("choiceの値が不正です");
        }
      },
    },
    {
      questionNumber: 12,
      questionTitle: "平均体温はどれくらいですか？",
      choices: {
        1: "36.0以下",
        //蚊-1
        2: "36.1〜36.7",
        3: "36.8以上",
        //蚊+1
      },
      answer: (choice) => {
        if (choice === "36.0以下") {
          props.decrement("mosquito");
        } else if (choice === "36.8以上") {
          props.increment("mosquito");
        } else {
          console.log("変化はありません");
        }
      },
    },
    {
      questionNumber: 13,
      questionTitle: "汗っかきですか？",
      choices: {
        1: "はい",
        // 蚊+1
        2: "いいえ",
      },
      answer: (choice) => {
        if (choice === "はい") {
          props.increment("mosquito");
        } else {
          console.log("変化はありません");
        }
      },
    },
  ];
  const [currentQuestion, setCurrentQuestion] = useState(questionData[0]);

  const onClickHandler = (choice) => {
    const currentNumber = currentQuestion.questionNumber;
    currentQuestion.answer(choice);
    if (currentNumber === questionData.length) {
      props.onClick("result");
    }
    setCurrentQuestion(questionData[currentNumber]);
  };
  const e = React.createElement;
  return e(
    "div",
    { className: "hero min-h-screen bg-base-200" },
    e(
      "div",
      { className: "hero-content text-center" },
      e("div", { className: "max-w-md" }, [
        e(
          "p",
          { className: "text-xl" },
          `質問${currentQuestion.questionNumber}/${questionData.length}`
        ),
        e(
          "h1",
          { className: "text-3xl font-bold py-6" },
          `${currentQuestion.questionTitle}`
        ),
        Object.keys(currentQuestion.choices).map((choice) =>
          e(
            "button",
            {
              className: "btn btn-neutral m-2",
              onClick: () => onClickHandler(currentQuestion.choices[choice]),
            },
            `${currentQuestion.choices[choice]}`
          )
        ),
      ])
    )
  );
};

export const result = (props) => {
  console.log(props.tool.tool);
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
  return e(
    "div",
    null,
    [
      `${result.mosquito}`,
      `${result.flies}`,
      `${result.cockroach}`,
      `${result.tick}`,
      `${result.centipede}`,
      `${result.clothingPest}`,
      `${result.sloth}`,
    ],
    e("div", { className: "card w-96 bg-base-100 shadow-xl" }, [
      e("figure", null, e("img", { src: `${props.tool.tool[20].image}` })),
      e("div", { className: "card-body" }, [
        e("h2", { className: "card-title" }, `${props.tool.tool[20].name}`),
        e(
          "div",
          { className: "card-actions justify-end" },
          e(
            "a",
            {
              className: "link link-neutral",
              href: `${props.tool.tool[20].url}`,
              target: "_blank",
            },
            "詳細"
          )
        ),
      ]),
    ])
  );
};
