import nimib, nimiSlides
import custom_blocks
import intro, outro, pietros_slides, hugos_slides

when isMainModule:
  myInit("index.nim")
  # both - intro
  useSource("intro.nim")
  titleSlide # add authors + link to repo (+ sources?)
  whoIsPietroSlide
  whoIsHugoSlide
  previouslyAtNimConfSlide
  contentSlide
  slideLiveCoding # add video
  # pietro - blocks
  useSource("pietros_slides.nim")
  slideBlockMaker
  slidesCodeAsInsource
  slidesBlocks
  slidesFancyBlocks
  # hugo - interactivity
  useSource("hugos_slides.nim")
  slidesNbPython
  slidesNimibInteractive
  # pietro - plant app
  useSource("pietros_slides.nim")
  slidesPlantApp # add video
  # hugo - nimiboost
  useSource("hugos_slides.nim")
  slidesNimiBoost # add video
  # both - outro
  useSource("outro.nim")
  roadmapSlides
  contributeSlides
  thankyouSlide
  nbSave
