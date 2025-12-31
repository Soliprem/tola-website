#import "index.typ": *

#show: template.with(
  title: "Posts"
)

#let pages = json("/_data/pages.json")
#let posts = pages.filter(p => 
  p.url.starts-with("/posts/") and p.url != "/posts/"
)
#let sorted-posts = posts.sorted(key: p => p.at("date", default: "0000-00-00")).rev()
#let current-year = ""
#for post in sorted-posts {
  let date-str = post.at("date", default: "")
  let year = if date-str != "" { date-str.slice(0, 4) } else { "Undated" }
  if year != current-year {
    [== #year]
    current-year = year
  }
  [- #link(post.url)[#post.title]]
}
