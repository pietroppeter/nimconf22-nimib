import nimib, nimiSlides
from custom_blocks import
  myInit, mySlide, slideText, title_contribute, title_roadmap, textSwitcher, slideAutoAnimate, addNbTextSmall, nbTextSmall, nimibIssue

template contributeSlides* =
  mySlide:
    slideText: hlMdF"## {title_contribute}"
    slideAutoAnimate:
      nbText: " ### 👩‍💻Improved Dev Experience"
      unorderedList:
        listItem: nbText: "docs are now built in CI"
        listItem: nbText: "deploy preview!"
        listItem: nbText: "we added tests (and removed ptest)"
        listItem: nbText: "updated docs and added a separate changelog"
        listItem: nbText: "a new [CONTRIBUTE.md]()!"
        listItem: nbText: "some issues marked as good-first-issue"
    slideAutoAnimate:
      nbText: " ### 👩‍💻Improved Dev Experience"
      nbText: " #### Deploy preview"
      nbImage("deploy_preview.png")
    mySlide:
      nbText: " ### 🎪Nimib Speaking Hours!"
      unorderedList:
        listItem: nbText: "me and Hugo have been meeting regularly"
        listItem: nbText: "thinking of keeping this up (once a month)"
        listItem: nbText: "open to anyone using nimib or contributing"
        listItem: nbText: "will announce somewhere (nimib discussions?)"
      fragmentfadeIn: nbTextSmall "(inspired by [Simon Willson](https://simonwillison.net/2021/Feb/19/office-hours/))"
  # @hugo: an idea I had in mind, first time I am proposing it...
  # see https://simonwillison.net/2021/Feb/19/office-hours/
  # I remember some tweet that mentioned a better name for office hours
  # ah "speaking hours"! yes, better. see https://twitter.com/simonw/status/1578410543014035457?s=20&t=y6ONp5McTq38bmwRAO2jPw

template roadmapSlides* =
  mySlide:
    slideText: hlMdF"## {title_roadmap}"
    mySlide:
      nbText: "### priorities"
      unorderedList:
        listItem: nbText: "first goal: produce stuff with nimib 0.3.x!"
        unorderedList: 
          listItem: nbText: "more [scinim/getting-started](https://github.com/SciNim/getting-started) tutorials! 👩‍🔬"
          listItem: nbText: "Advent of code! 🎄"
        listItem: nbText: "next 0.4 target: backend maker"
        listItem: nbText: "side projects:"
        unorderedList:
          listItem:
            nbText: "(Pietro) a blog theme / jekyll clone"


    mySlide:
      nbText: " ### 0.3.x"
      unorderedList:
        listItem: nbText: "more blocks, e.g. nbShell " & nimibIssue(34)
        listItem: nbText: "container block " & nimibIssue(117)
        listItem: nbText: "improve default theme, e.g. code output " & nimibIssue(65)
        listItem: nbText: "table of contents " & nimibIssue(58)
        listItem: nbText: "site index " & nimibIssue(129)
        listItem: nbText: "dataframe to html table " & nimibIssue(65)
        listItem: nbText: "..."

  #[
    slideText: """
  ### side projects
  - feedo
  - nog
  - nex
  - github powered CMS
  - nimetta / the algorithms
  - ...
  """
  ]#
    mySlide:
      nbText: "### further down the road"
      unorderedList:
        listItem: nbText: "(after 0.4) new backends (e.g latex, twitter?, ...)"
        listItem: nbText: "serving a backend that interacts with the page ([streamlit](https://streamlit.io/) style? [jester](https://github.com/dom96/jester)? [htmx](https://htmx.org/)?)"
        listItem: nbText: "build a library directly from documentation (like in [nbdev](https://nbdev.fast.ai/))?"
        listItem: nbText: "nimib executable for scaffolding"
        listItem: nbText: "possibility of editing document in the browser"


template thankyouSlide* =
  mySlide:
    nbText: "Thank you for listening!"
    let
      thankyous1 = @["Tack", "谢谢", "धन्यवाद", "Gracias"]
      thankyous2 = @["Grazie", "ありがとう", "Merci", "Bedankt"]
      thankyous3 = @["Danke", "Дякую тобі", "Obrigado", "Dziękuję Ci"]
    textSwitcher(thankyous1)
    nbText: " "
    textSwitcher(thankyous2)
    nbText: " "
    textSwitcher(thankyous3)


when isMainModule:
  myInit()
  #contributeSlides()
  #roadmapSlides()
  thankyouSlide()
  nbSave