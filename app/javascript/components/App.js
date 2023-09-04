import React, { useState } from "react";
import Top from "./Top";
import Questions from "./Questions";

function App() {
  const [page, setPage] = useState("top");
  const e = React.createElement;
  return page === "top"
    ? e(Top, { onClick: (page) => setPage(page) })
    : page === "questions"
    ? e(Questions, { onClick: (page) => setPage(page) })
    : page === "result"
    ? e(Result)
    : console.warn("pageの値が不正です");
}

export default App;
