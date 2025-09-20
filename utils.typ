// reference: https://typst.dev/guide/FAQ/character-intersperse.html
#let fixed-width(str, width: auto) = {
  box(width: width, stack(dir: ltr, ..str.clusters().intersperse(1fr)))
  // block(width: width, body + linebreak(justify: true))
}

// reference: https://typst.dev/guide/FAQ/text-shadow.html
#let shadowed-text(shadow-color: "#c0c0c0", offset: (0.05em, 0.05em), it) = {
  box(
    stack(
      dir: ltr,
      spacing: 0pt,
      place(
        dx: offset.at(0),
        dy: offset.at(1),
        text(fill: rgb(shadow-color))[#it],
      ),
      text[#it],
    ),
  )
}

#let size0 = 42pt       // 初号
#let size0s = 36pt      // 小初
#let size1 = 26pt       // 一号
#let size1s = 24pt      // 小一
#let size2 = 22pt       // 二号
#let size2s = 18pt      // 小二
#let size3 = 16pt       // 三号
#let size3s = 15pt      // 小三
#let size4 = 14pt       // 四号
#let size4s = 12pt      // 小四
#let size5 = 10.5pt     // 五号
#let size5s = 9pt       // 小五
#let size6 = 7.5pt      // 六号
#let size6s = 6.5pt     // 小六
#let size7 = 5.5pt      // 七号
#let size8 = 5pt        // 八号
