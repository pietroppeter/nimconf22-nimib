import nimib, nimiSlides
import custom_blocks

template titleSlide* =
  slideText: "# NIMIB🐳 GOES INTERACTIVE🤯"
  # add authors
  # add link/url to slide

template whoIsPietroSlide* =
  mySlide:
    nbText: "### 👨‍👩‍👧 Pietro"
    unorderedList:
      listItem: nbText: "Pietro Peterlongo, [Milan, Italy 🇮🇹](https://goo.gl/maps/ceG6UsLEGqmx5Kpa7)"
      listItem: nbText: "Python Data Scientist working on a [Supply Chain Planning Software](https://www.toolsgroup.com)"
      listItem: nbText: "talked previously about nimib at [NimConf2021](https://pietroppeter.github.io/nimconf2021/revealjs/index.html)"
      listItem: nbText: "helped organize [Nim Devroom at FOSDEM 2022](https://archive.fosdem.org/2022/schedule/track/nim_programming_language/)"
      listItem: nbText: "let's organize again the Nim Devroom and meet at [FOSDEM 2023](https://fosdem.org/2023/)!"

template whoIsHugoSlide* =
  mySlide:
    nbText: "### HUGO 🙋‍♂️"
    unorderedList:
      listItem: nbText: "Engineering Physics student"
      listItem: nbText: "Nimib maintainer - since July 2022"
      unorderedList:
        listItem: nbText: "nimiSlides"
      listItem: nbText: "SciNim member - since the start 2020"
      unorderedList:
        listItem: nbText: "NumericalNim"
        listItem: nbText: "Scinim/getting-started (uses nimiBook)"

template previouslyAtNimConfSlide* =
  mySlide:
    nbText: "### Previously at NimConf 2021"
    nbRawHtml: """<iframe width="560" height="315" src="https://www.youtube.com/embed/sWA58Wtk6L8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

template contentSlide* =
  slideText: hlMdF"""## Content of presentation
- A livecoding👨‍💻 intro to Nimib🐳
- ✨Release of Nimib 0.3 - BlockMaker🧱
  - {title_block}
  - {title_js}
- Nimiboost🚀
- {title_roadmap}
- {title_contribute}
"""

template slideLiveCoding* =
  mySlide:
    nbText: "## A livecoding👨‍💻 intro to Nimib🐳"
    nbRawHtml: """<iframe width="560" height="315" src="https://www.youtube.com/embed/6jTZWkof4Cs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

when isMainModule:
  myInit("intro.nim")
  titleSlide
  whoIsPietroSlide
  whoIsHugoSlide
  previouslyAtNimConfSlide
  contentSlide
  slideLiveCoding
  nbSave
