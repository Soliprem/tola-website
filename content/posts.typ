#import "index.typ": *
#import "@tola/pages:0.0.0": pages

#show: template.with(
  title: "Posts",
)

#let posts = (
  pages()
    .filter(p => "/posts/" in p.permalink and p.permalink != "/posts/")
    .filter(p => p.at("date", default: none) != none)
    .sorted(key: p => p.date)
    .rev()
)
#let current-year = ""
#for post in posts {
  let year = str(post.date).slice(0, 4)
  if year != current-year {
    [== #year]
    current-year = year
  }
  [- #link(post.permalink)[#post.title]]
}
