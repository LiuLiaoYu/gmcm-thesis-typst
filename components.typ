#import "./utils.typ": fixed-width, shadowed-text, size2, size2s, size3

#let contest-organizer-logos = block[
  #set text(spacing: 0pt)
  #box(image("./res/1.png", height: 65.250pt, width: 102.500pt, fit: "stretch"))
  #h(9.000pt)
  #box(image("./res/2.png", height: 75.350pt, width: 78.250pt, fit: "stretch"))
  #h(15.700pt)
  #box(image("./res/3.jpg", height: 79.400pt, width: 79.450pt, fit: "stretch"))
  #h(27.100pt)
  #box(image("./res/4.png", height: 69.000pt, width: 71.400pt, fit: "stretch"))
]

#let contest-title = block[
  #set text(font: "STXinwei", weight: "bold")
  #set par(spacing: 0.5em)

  #text(size: size2s)[
    #shadowed-text[中国研究生创新实践系列大赛]
  ]
  #v(8pt)

  #text(size: size2)[
    // #h(20pt)
    #shadowed-text[“华为杯”第二十二届中国研究生]

    #shadowed-text[数学建模竞赛]
  ]
]

#let 题目(body) = [
  #set par(first-line-indent: 0em)
  #text(font: "LiSu", size: size2s, "题 目：") #text(font: "SimHei", size: size3)[#underline(body, offset: 0.1em + 1pt)]
]

#let 摘要(body) = [
  #align(center, text(font: "LiSu", size: size2s, "摘   要："))
  #set par(first-line-indent: 2em, justify: true)
  #body
]

#let 关键词(body) = [
  #set par(first-line-indent: 0em)
  #text(font: "LiSu", size: size2s, "关键词：")#body
]
