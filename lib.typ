#import "@preview/i-figured:0.2.4": show-equation, show-figure
#import "@preview/numbly:0.1.0": numbly

#import "components.typ": *
#import "./utils.typ": size4s, size5s


#let prelude-content(info: (:)) = {
  set page(margin: (top: 3cm, bottom: 1.75cm, x: 2.25cm), numbering: none)
  set align(center)

  contest-organizer-logos
  v(3.5em)
  contest-title
  v(4em)
  block(width: 90%)[
    #set text(size: size2s, font: ("Calibri", "SimSun"), weight: "bold")
    #grid(
      columns: (5.2em, 1em, 1fr),
      rows: (2em,) * 5,
      row-gutter: (1em, 0pt),
      stroke: (x, y) => if x in (1, 2) and y in (2, 3) { (bottom: 1pt) } else { (bottom: 1.5pt) },
      align: center + horizon,
      fixed-width("学校", width: 4em), "", info.学校,
      "参赛队号", "", info.参赛队号,
      grid.cell("队员姓名", rowspan: 3),
      ..info.队员.enumerate().map(x => ([#(x.at(0) + 1).], x.at(1))).flatten(),
    )
  ]
}

#let main-content(it) = {
  pagebreak(weak: true)
  set page(footer: context align(center, text(size: size5s, counter(page).display("1"))), numbering: "1")
  counter(page).update(n => 1)

  set text(font: ("Times New Roman", "SimSun"), size: size4s, lang: "zh")
  set par(first-line-indent: (amount: 2em, all: true), justify: true)

  set heading(numbering: numbly("第{1:一}章", "{1}.{2}"))
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set block(below: 18pt, above: 18pt, height: 20pt)
    align(center, text(weight: "bold", it))
  }

  set outline(title: none, depth: 2, indent: size4s * 1.5)
  show outline.entry.where(level: 1): it => text(size: size4s, it)

  show figure: show-figure.with(numbering: "1-1")
  show figure.where(kind: image): set figure(supplement: "图")
  show figure.where(kind: table): set figure(supplement: "表")
  show figure.where(kind: table): set figure.caption(position: top)

  show math.equation: show-equation.with(numbering: "(1-1)")

  set bibliography(style: "gb-7714-2015-numeric", title: none)


  let heading-not-outlined = ("目录",)
  let heading-not-numbering = ("参考文献", "附录")

  let element-replace(body) = {
    for ele in body.children {
      if ele.func() == heading {
        if ele.body.text in heading-not-outlined {
          heading(ele.body.text, outlined: false, numbering: none)
        } else if ele.body.text in heading-not-numbering {
          heading(ele.body.text, numbering: none)
        } else {
          ele
        }
      } else {
        ele
      }
    }
  }

  show: element-replace.with()


  v(3em)
  align(center, contest-title)
  v(1em)
  it
}


