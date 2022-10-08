import std / [strutils]
import nimib
import nimiSlides

nbInit(theme = revealTheme)

template textSwitcher(texts: seq[string], duration: float = 2) =
    var cssString = "<style>\n"
    for i, phrase in texts:
      let id = "textSwitcher-" & $nb.newId()
      let animationName = "animation-" & id
      nbRawHtml: """<div id="$1" style="position: absolute; width: 100%; opacity: 0; text-align: center;">$2</div>""" % [id, phrase]
      cssString.add "#$1 { animation: $2 $3s infinite }\n" % [id, animationName, $(texts.len.float * duration)]
      let middlePercent = 100 * (1 / (2 * texts.len) + i * 1 / texts.len)
      let lowerPercent = middlePercent - 100 * (1 / (2 * texts.len))
      let upperPercent = middlePercent + 100 * (1 / (2 * texts.len))
      cssString.add """
@keyframes $1 {
  $2% {
    opacity: 0;
  }
  $3% {
    opacity: 1;
  }
  $4% {
    opacity: 0;
  }
}
""" % [animationName, $lowerPercent, $middlePercent, $upperPercent]
    cssString.add "\n</style>"
    nbRawHtml: cssString
    


slide:
  nbText: "Thank you"
  let thankyous = @["Thanks", "Danke", "Tack", "Grazie", "Takk"]
  textSwitcher(thankyous)

nbSave()