import nimib
import nimislides

nbInit(theme = revealTheme)

template slideText(text: string) =
  slide:
    nbText: text

for theme in SlidesTheme:
  setSlidesTheme(theme)
  slideText: """
## More nimib adventures

**Authors**: Hugo Granstrom, Pietro Peterlongo

theme: """ & $theme
  nb.filename = "slides-" & $theme & ".html"
  nbSave

for theme in SlidesTheme:
  echo theme 