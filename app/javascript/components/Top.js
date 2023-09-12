import React from "react";

const Top = (props) => {
  const e = React.createElement;
  return e(
    "div",
    { className: "hero min-h-screen bg-base-200" },
    e(
      "div",
      { className: "hero-content text-center" },
      e("div", { className: "max-w-md" }, [
        e("h1", { className: "text-5xl font-bold" }, "アンケート"),
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
export default Top;
