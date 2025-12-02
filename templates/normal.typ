#let template(
  title: "", 
  date: none, 
  body
) = {
  let inside-figure = state("inside-figure", false)
  
  show figure: it => {
    inside-figure.update(true)
    it
    inside-figure.update(false)
  }
  
  // Math equation handling
  show math.equation.where(block: false): it => if not inside-figure.get() {
    html.elem("span", attrs: (class: "inline-block", role: "math"), html.frame(it))
  } else {it}
  
  show math.equation.where(block: true): it => if not inside-figure.get() {
    html.elem("figure", attrs: (class: "w-fit mx-auto", role: "math"), html.frame(it))
  } else {it}

  // Sidenote handling: convert footnotes to inline spans
  show footnote: it => {
    let note = it.body
    // Render the anchor number and the content immediately after it
    html.elem("span", attrs: (class: "sidenote-wrapper"), [
      #super(context counter(footnote).display())
      #html.elem("span", attrs: (class: "sidenote-content"), [
        #super(context counter(footnote).display()) 
        #note
      ])
    ])
  }
  
  // Add semantic HTML wrapper
  html.elem(
    "article",
    attrs: (class: "content-wrapper max-w-3xl mx-auto"),
    [
      #if title != "" or date != none [
        #html.elem("header", attrs: (class: "page-header mb-8"), [
          #if title != "" [
            #html.elem("h1", attrs: (class: "page-title"), [#title])
          ]
          #if date != none [
            #html.elem("time", attrs: (datetime: date, class: "page-date text-gray-400"), [#date])
          ]
        ])
      ]
      #body
    ]
  )
}

#let tola-conf(
  kind: "",
  body
) = [
  #if kind == "minimal" {
    tola-minimal-conf(body)
  }
]
