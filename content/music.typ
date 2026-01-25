#import "index.typ": *
#show: template.with(
  title: "My Music"
)

#let bandcamp_player(track_id, title, url, color: "2ebd35", bg: "333333") = {
  let src_url = "https://bandcamp.com/EmbeddedPlayer/track=" + str(track_id) + "/size=large/bgcol=" + bg + "/linkcol=" + color + "/tracklist=false/artwork=small/transparent=true/"
  
  html.elem("iframe",
    attrs: (
      style: "border: 0; width: 100%; height: 120px;",
      src: src_url,
      seamless: "",
    ),
    html.elem("a",
      attrs: (href: url),
      title
    )
  )
}

// How to use it for your current track:

== Moments of Self
A Wind Quintet

#bandcamp_player(
  3669618347, 
  "Moments of Self by Soliprem", 
  "https://soliprem.bandcamp.com/track/moments-of-self"
)
