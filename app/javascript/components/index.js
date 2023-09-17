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
        setMosquito((mosquito) => mosquito + 1.5);
        break;
      case "flies":
        setFlies((flies) => flies + 1.5);
        break;
      case "cockroach":
        setCockroach((cockroach) => cockroach + 1.5);
        break;
      case "tick":
        setTick((tick) => tick + 1);
        break;
      case "centipede":
        setCentipede((centipede) => centipede + 1);
        break;
      case "clothingPest":
        setClothingPest((clothingPest) => clothingPest + 2);
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
  //虫たちの順位付け
  const keys = Object.keys(result);
  const sortedKeys = keys.sort(function (a, b) {
    return result[b] - result[a];
  });
  //虫の上位３決定
  const fullResult = sortedKeys.slice(0, 3);
  //虫の一位のみ決定
  const partResult = sortedKeys.slice(0, 1);
  //jsonのすべてのデータから該当する虫の対策、ツールを抽出
  //extraction(fullResult[n]) = {tool: [{},{},....], countermeasure] [{},{},{},...]}
  const extraction = (result) => {
    if (result === "mosquito") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 2),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 1
        ),
      };
    } else if (result === "flies") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 3),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 3
        ),
      };
    } else if (result === "cockroach") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 4),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 4
        ),
      };
    } else if (result === "tick") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 5),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 5
        ),
      };
    } else if (result === "centipede") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 6),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 6
        ),
      };
    } else if (result === "clothingPest") {
      return {
        tool: props.tool.tool.tool.filter((item) => item.insect_type_id === 7),
        countermeasure: props.tool.tool.countermeasure.filter(
          (item) => item.insect_type_id === 1
        ),
      };
    }
  };
  //ツールをランダムに抽出する関数
  function randomToolNum(array, num) {
    let a = array;
    let t = [];
    let r = [];
    let l = a.length;
    let n = num < l ? num : l;
    while (n-- > 0) {
      let i = (Math.random() * l) | 0;
      r[n] = t[i] || a[i];
      --l;
      t[i] = t[l] || a[l];
    }
    return r;
  }

  const randomToolNumForFull1 = randomToolNum(
    extraction(fullResult[0]).tool,
    3
  );
  const randomToolNumForFull2 = randomToolNum(
    extraction(fullResult[1]).tool,
    3
  );
  const randomToolNumForFull3 = randomToolNum(
    extraction(fullResult[2]).tool,
    3
  );
  const randomToolNumForPart = randomToolNum(extraction(partResult[0]).tool, 3);
  const randomCountermeasureNumForFull1 = Math.floor(
    Math.random() * extraction(fullResult[0]).countermeasure.length
  );
  const randomCountermeasureNumForFull2 = Math.floor(
    Math.random() * extraction(fullResult[1]).countermeasure.length
  );
  const randomCountermeasureNumForFull3 = Math.floor(
    Math.random() * extraction(fullResult[2]).countermeasure.length
  );
  const randomCountermeasureNumForPart = Math.floor(
    Math.random() * extraction(partResult[0]).countermeasure.length
  );

  const e = React.createElement;
  return result.sloth > 0
    ? [
        e(
          "div",
          {
            className: "container my-16 mx-auto text-neutral md:px-6",
          },
          e("section", { className: "mb-32" }, [
            e(
              "h2",
              { className: "mb-16 text-center text-2xl font-bold" },
              "あなたのおすすめ対策"
            ),
            e("div", { className: "mb-16 flex flex-wrap" }, [
              e(
                "div",
                {
                  className:
                    "mb-6 w-full shrink-0 grow-0 basis-auto lg:mb-0 lg:w-6/12 lg:pr-6",
                },
                e(
                  "div",
                  {
                    className:
                      "ripple relative overflow-hidden rounded-lg bg-cover bg-[50%] bg-no-repeat",
                  },
                  e("img", {
                    src: `${
                      extraction(fullResult[0]).countermeasure[
                        randomCountermeasureNumForFull1
                      ].image
                    }`,
                    className: "w-full",
                  })
                )
              ),
              e(
                "div",
                {
                  className:
                    "w-full shrink-0 grow-0 basis-auto lg:w-6/12 lg:pl-6",
                },
                [
                  e(
                    "h3",
                    { className: "mb-4 text-2xl text-neutral font-bold" },
                    `1.${
                      extraction(fullResult[0]).countermeasure[
                        randomCountermeasureNumForFull1
                      ].title
                    }`
                  ),
                  e(
                    "p",
                    {
                      className: "mb-6 text-neutral-500",
                    },
                    `${
                      extraction(fullResult[0]).countermeasure[
                        randomCountermeasureNumForFull1
                      ].body
                    }`
                  ),
                  e(
                    "a",
                    {
                      className: "btn btn-lg btn-neutral-focus",
                      href: `${props.tool.tool.product_path}`,
                    },
                    "さっそく害虫対策を投稿する"
                  ),
                ]
              ),
            ]),
            e("div", { className: "mb-16 flex flex-wrap" }, [
              e(
                "div",
                {
                  className:
                    "mb-6 w-full shrink-0 grow-0 basis-auto lg:mb-0 lg:w-6/12 lg:pr-6",
                },
                e(
                  "div",
                  {
                    className:
                      "ripple relative overflow-hidden rounded-lg bg-cover bg-[50%] bg-no-repeat",
                  },
                  e("img", {
                    src: `${
                      extraction(fullResult[1]).countermeasure[
                        randomCountermeasureNumForFull2
                      ].image
                    }`,
                    className: "w-full",
                  })
                )
              ),
              e(
                "div",
                {
                  className:
                    "w-full shrink-0 grow-0 basis-auto lg:w-6/12 lg:pl-6",
                },
                [
                  e(
                    "h3",
                    { className: "mb-4 text-2xl font-bold text-neutral" },
                    `2.${
                      extraction(fullResult[1]).countermeasure[
                        randomCountermeasureNumForFull2
                      ].title
                    }`
                  ),
                  e(
                    "p",
                    {
                      className: "mb-6 text-neutral-500",
                    },
                    `${
                      extraction(fullResult[1]).countermeasure[
                        randomCountermeasureNumForFull2
                      ].body
                    }`
                  ),
                ]
              ),
            ]),
          ])
        ),
        e(
          "h1",
          {
            className: "text-4xl font-bold text-center mb-4 pb-4 text-neutral",
          },
          "おすすめ対策アイテム"
        ),
        e("div", { className: "flex flex-wrap -m-4 py-6 mx-auto" }, [
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull1[0].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull1[0].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull1[0].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull1[1].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull1[1].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull1[1].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull1[2].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull1[2].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull1[2].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull2[0].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull2[0].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull2[0].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull2[1].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull2[1].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull2[1].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull2[2].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull2[2].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull2[2].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull3[0].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull3[0].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull3[0].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull3[1].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull3[1].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull3[1].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForFull3[2].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForFull3[2].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForFull3[2].url}`,
                    target: "_blank",
                  },
                  "詳細"
                )
              ),
            ]
          ),
        ]),
      ]
    : e("div", null, [
        e(
          "div",
          { className: "container my-16 mx-auto md:px-6" },
          e("section", { className: "mb-32" }, [
            e(
              "h2",
              {
                className: "mb-16 text-center text-2xl font-bold text-neutral",
              },
              "あなたのおすすめ対策"
            ),
            e("div", { className: "mb-16 flex flex-wrap" }, [
              e(
                "div",
                {
                  className:
                    "mb-6 w-full shrink-0 grow-0 basis-auto lg:mb-0 lg:w-6/12 lg:pr-6",
                },
                e(
                  "div",
                  {
                    className:
                      "ripple relative overflow-hidden rounded-lg bg-cover bg-[50%] bg-no-repeat",
                  },
                  e("img", {
                    src: `${
                      extraction(partResult[0]).countermeasure[
                        randomCountermeasureNumForPart
                      ].image
                    }`,
                    className: "w-full",
                  })
                )
              ),
              e(
                "div",
                {
                  className:
                    "w-full shrink-0 grow-0 basis-auto lg:w-6/12 lg:pl-6",
                },
                [
                  e(
                    "h3",
                    { className: "mb-4 text-2xl font-bold text-neutral" },
                    `1.${
                      extraction(partResult[0]).countermeasure[
                        randomCountermeasureNumForPart
                      ].title
                    }`
                  ),
                  e(
                    "p",
                    {
                      className: "mb-6 text-neutral-500",
                    },
                    `${
                      extraction(partResult[0]).countermeasure[
                        randomCountermeasureNumForPart
                      ].body
                    }`
                  ),
                  e(
                    "a",
                    {
                      className: "btn btn-lg btn-neutral-focus",
                      href: `${props.tool.tool.product_path}`,
                    },
                    "さっそく害虫対策を投稿する"
                  ),
                ]
              ),
            ]),
          ])
        ),
        e(
          "h1",
          {
            className: "text-4xl font-bold text-center mb-4 pb-4 text-neutral",
          },
          "おすすめ対策アイテム"
        ),
        e("div", { className: "flex flex-wrap -m-3 py-6 mx-auto" }, [
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForPart[0].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForPart[0].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForPart[0].url}`,
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForPart[1].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForPart[1].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForPart[1].url}`,
                  },
                  "詳細"
                )
              ),
            ]
          ),
          e(
            "div",
            {
              className: "card card-compact w-96 bg-base-100 shadow-xl mx-auto",
            },
            [
              e(
                "figure",
                null,
                e("img", {
                  src: `${randomToolNumForPart[2].image}`,
                })
              ),
              e(
                "div",
                { className: "card-body" },
                e(
                  "div",
                  { className: "card-title" },
                  `${randomToolNumForPart[2].name}`
                )
              ),
              e(
                "div",
                { className: "card-actions justify-end" },
                e(
                  "a",
                  {
                    className: "link link-neutral mr-4 mb-4",
                    href: `${randomToolNumForPart[2].url}`,
                  },
                  "詳細"
                )
              ),
            ]
          ),
        ]),
      ]);
};
