#let template(
  title: "", 
  date: none, 
  summary: none,
  body
) = {

  [#metadata((
      title: title,
      date: date,
      summary: summary,
    )) <tola-meta>]

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
      #html.elem("span", attrs: (class: "sidenote-content"), [#super(context counter(footnote).display())#note])
    ])
  }

  show outline: it => {
      html.elem("details", attrs: (class: "toc-wrapper"), [
        #html.elem("summary", attrs: (class: "toc-header"), [
          #html.elem("span", "Table of Contents")
        ])
        #html.elem("div", attrs: (class: "toc-content"), it)
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
            #html.elem("a", attrs: (href: "/contact/"), "~/contacts")
            #context {
              let fn-count = counter(footnote).final().at(0)
              if fn-count > 0 {
                html.elem("button", 
                  attrs: (
                    onclick: "toggleFn()", 
                    class: "fn-toggle-btn"
                  ), 
                  "[toggle-notes]"
                )
              }
            }
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
