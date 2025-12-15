#import "../templates/normal.typ": *
#import "@preview/sicons:15.13.0": *

#show: template.with(
)

= Soliprem

#figure(
  image("./imgs/profile.png"),
  caption: [
    #quote(block: true, attribution: "Leo Tolstoy")[
      _All, everything I understand, I only understand because I love_
    ]
  ],
  numbering: none,
  scope: "column"
)

Welcome to my corner of the web. I'm a student, hobby dev, and enthusiast of all things complex, networks, and open-source.

== What I'm Up To

=== Current Projects

- *This website* — Rebuilding it from scratch using Typst for content generation
- *Server infrastructure* — Rewriting my homelab configuration with NixOS
- *#link("https://github.com/notashelf/nvf")[NVF]* — Cool stuff, also happens to be ralf-ware

== More fun parts of the Web!

#link("https://nixwebr.ing")[*Nix Webring*] — 
#link("https://nixwebr.ing/prev/soliprem")[← previous] · 
#link("https://nixwebr.ing/rand")[random] · 
#link("https://nixwebr.ing/next/soliprem")[next →]

#html.elem("script", attrs: (src: "https://astroring.auroradynia.com/ring.js"))

#html.elem("div", attrs: (id: "wcb", class: "carbonbadge wcb-d"))
#html.elem("script", attrs: (
  src: "https://unpkg.com/website-carbon-badges@1.1.3/b.min.js",
  defer: "defer"
))
