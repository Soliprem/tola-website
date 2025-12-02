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
  
  show footnote: it => {
    let note = it.body
    html.elem("span", attrs: (class: "sidenote-wrapper", tabindex: "0"), [
      #super(context counter(footnote).display())
      #html.elem("span", attrs: (class: "sidenote-content"), note)
    ])
  }
  
  show math.equation.where(block: false): it => if not inside-figure.get() {
    html.elem("span", attrs: (class: "inline-block", role: "math"), html.frame(it))
  } else {it}
  
  show math.equation.where(block: true): it => if not inside-figure.get() {
    html.elem("figure", attrs: (class: "w-fit mx-auto", role: "math"), html.frame(it))
  } else {it}
 
  html.elem(
    "article",
    attrs: (class: "content-wrapper max-w-3xl mx-auto"),
    [
      #html.elem("script", "function toggleFn() { document.body.classList.toggle('inline-notes'); }")

      // [UPDATED] Navbar with integrated Toggle
      #html.elem("nav", attrs: (class: "terminal-nav"), [
        #html.elem("span", attrs: (class: "terminal-prompt"), "guest@soliprem.eu: $")
        #html.elem("div", attrs: (class: "terminal-links"), [
            #html.elem("a", attrs: (href: "/"), "~/")
            #html.elem("a", attrs: (href: "/posts/"), "~/posts")
            #html.elem("a", attrs: (href: "/about/"), "~/about")
        ])
      ])

      #if title != "" or date != none [
        #html.elem("header", attrs: (class: "page-header mb-12"), [
          #if title != "" [
            #html.elem("h1", attrs: (class: "page-title"), [#title])
          ]
        
          #if date != none [
            #html.elem("time", attrs: (datetime: date, class: "page-date text-gray-500 font-mono text-sm"), [#date])
          ]

            // Moved Toggle Button Here
            #html.elem("button", 
              attrs: (
                onclick: "toggleFn()", 
                class: "fn-toggle-btn"
              ), 
              "[toggle-notes]"
            )
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
