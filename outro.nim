import nimib, nimiSlides
from custom_blocks import
  myInit, mySlide, slideText, title_contribute, title_roadmap, textSwitcher

template contributeSlides* =
  mySlide:
    slideText: hlMdF"## {title_contribute}"
    slideText: """
  ### Improved Dev Experience
  - docs are now built in CI
  - deploy preview!
  - we added tests (and removed ptest)
  - update docs and separated changelog
  - a new [CONTRIBUTE.md]()!
  - some issues marked as good-first-issue
  """
    slideText: """
  ### Office Hours!
  - me and Hugo have been meeting regularly
  - we could continue to meet regularly
    - (e.g. once a month, on weekends, a floating hour)
  - in this meeting we would welcome and support users of nimib who are
    struggling or new contributors
  """
  # @hugo: an idea I had in mind, first time I am proposing it...
  # see https://simonwillison.net/2021/Feb/19/office-hours/
  # I remember some tweet that mentioned a better name for office hours
  # ah "speaking hours"! yes, better. see https://twitter.com/simonw/status/1578410543014035457?s=20&t=y6ONp5McTq38bmwRAO2jPw

template roadmapSlides* =
  mySlide:
    slideText: hlMdF"## {title_roadmap}"
    slideText: """
  ### priorities
  - first goal: produce stuff with nimib 0.3.x!
    - e.g. a nim-lang blogpost using md backend (but with js stuff?)
  - next 0.4 target: backend maker
  - (Pietro) a blog theme / jekyll clone (side project)
  """
    slideText: """
  ### 0.3.x
  - more blocks (nbAudio, nbVideo, nbPlotly, nbShell, ...)
  - container block
  - `NbBlock.data: JsonNode`
  - improve default theme
    - better code output
    - anchors for headers
  - table of contents
  - html outputs from code blocks (nbShow?):
    - html table for a dataframe
  - shared data between documents
    - site index
  """
    slideText: """
  ### side projects
  - feedo
  - nog
  - nex
  - github powered CMS
  - nimetta / the algorithms
  - ...
  """
    slideText: """
  ### further down the road
  - new backends
    - a latex theme (for articles or, using beamer, for presentations)
    - a pdf theme (without passing from latex?)
    - a twitter backend?
  - serving a (real) backend that interacts with the page (streamlit style? jester? htmx?)
  - can I use nimib to build a library directly from documentation (like in nbdev)?
  - nimib executable for scaffolding and to support different publishing workflows
  - possibility of editing document in the browser (similar to jupyter UI, not necessarily taking advantage of hot code reloading)
  - ...
  """

template thankyouSlide* =
  mySlide:
    nbText: "Thank you for listening!"
    let thankyous = @["Thanks", "Danke", "Tack", "Grazie", "Takk"]
    textSwitcher(thankyous)


when isMainModule:
  myInit()
  contributeSlides()
  roadmapSlides()
  thankyouSlide()
  nbSave