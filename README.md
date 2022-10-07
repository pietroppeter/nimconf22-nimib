# nimconf22-nimib

slides for nimib presentation at nimconf 2022

Title: Nimib goes interactive

**October 9th - send a video recording of your talk!**

## prep

- [x] release 0.3.1 nimib
- [ ] stuff in https://github.com/pietroppeter/nimib/discussions/112

## status

- together
  - [x] title slide
  - [x] presentation content slide
  - [ ] recorded intro
- Pietro:
  - [x] who am I (reuse from last time)
  - [x] livecoding
    - [x] code example
    - [x] record livecoding
    - [x] livecode slide
  - [ ] 0.3.x changes
    - [x] intro slide for release
      - [x] add lines on 1) how to (custom blocks examples) 2) a js mathy plant app
    - [x] codeAsInSource
      - [x] fix animation of code lines
      - [x] mention CodeFromAst macro
    - [ ] custom block theory
      - [x] what are blocks
        - [x] add title and animate
      - [x] what is a block: data + render (two columns with examples)
        - [x] mention backend concept
        - [x] nbCode
        - [x] nbText
        - [x] nbImage
      - [x] nimib types (implementation details)
        - [x] animate and review
        - mention that until 0.2 it was an object variant with 3 kinds
      - [x] render function (implementation details)
        - [x] review and animate
      - [ ] how do I create (and customize) blocks
        - [ ] nbCode
          - [ ] customization example: add "Output:"
        - [ ] nbText
          - [ ] customization examples (e.g.nbText with rst)
        - [ ] nbImage
      - [ ] other blocks
        - [ ] nbCodeInBlock
        - [ ] nbTextWithCode
        - [ ] nbFile (string and untyped)
        - [ ] nbRawHtml
          - example on how to create blocks with this
      - [ ] how to create blocks
        - [ ] "natively" (newNbCodeBlock, newNbSlimBlock)
        - [ ] from other blocks, composing, copying and customizing
        - [ ] discussion about partials+renderPlans vs nbRawHtml
          - mention container block as missing piece
    - [ ] blocks with (external) js
      - [ ] how to use external js functionality (add to head, add to main)
      - [ ] a refresher on mustache? here or earlier? probably earlier!
      - [x] add redo a title slide
      - [x] leftRight slider      
      - [x] mermaid
        - [x] fix in nblog
      - [x] plotly
    - [x] js mathy plant app: title slide
      - [x] embed html
    - [ ] use nimconf theme and merge all in slides.nim
      - refactor by making slides call a proc from pietro_slides?
    - [ ] record the 0.3.x changes part
  - [ ] record description of plant_app as example of js
  - [x] contributing slides draft
  - [x] roadmap draft
  - [x] nimib changes
    - [x] stdout flush fix
    - [x] pre line-height fix
- Hugo:
  - [x] nbPython example
  - [x] nbJstuff
    - [x] js app for qr code app
    - [x] nbJsFromCode with counter example
    - [x] boilerplate karax in nbJsFromCode
    - [x] nbKaraxCode with counter example
    - [x] capture variable example
  - [x] nimiboost
    - [x] livecoding example
    - [x] record nimiboost livecoding
    - [x] Hugo nimiboost: add a way to add video to slides
  - [x] details
    - [x] bigger buttons
    - [x] better example for postRender
- back to Pietro
- together:
  - [ ] contributing
  - [ ] roadmap
  - [ ] hi, thanks, goodbye

## recording

### recording sessions (October 2 and October 9)

homework:
  Pietro:
    - [x] livecoding recording
    - [ ] complete release slides
    - [ ] record release part
    - [ ] record plant app
    - [x] work on later slides (contribution + roadmap)
  Hugo:
    - [x] nimiboost recording
    - [x] record part 2 of slides (+ details)
    - [ ] test putting together videos

during sessions:
  - [x] record intro together - Oct 2
  - [ ] record outro together - Oct 9

nice to have:
  - [ ] cornerImage without JS?
  - [ ] qr code links around
  - [ ] whale in the qr code
  - [ ] source of slides (bottom of title slide)

## summary

- intro (title, who we are, previous presentation, content of presentation) - together
- nimib livecoding
- nimib 0.3 changes
  - nimibCodeAsInSource is default
  - refactoring: custom blocks - explain how it works with live coding example
    - examples (mostly from nblog and using embed)
  - Pietro stops here and passes to Hugo
  - nbPython (as a curiosity we should mention issues - in particular CI)
  - nbJSstuff...
  - nimiboost
- nimibook changes (back to Pietro)
- nimib gallery
- contributing (back together)
- roadmap

10'+10'+10'

video recording: OBS

video editing: ?

meetings:
- [x] Sep 10th, Sat 12:00
- [x] Sep 17-18, Sat 15:00
- [x] Sep 24-25, Sun 15:00
- [x] Oct 1 - Sun 10-12 start recording (all individual parts + intro together)
- [ ] Oct 8-9 **deadline for video**
- [ ] Oct 15-16 (what else?)
- [ ] Oct 22, Saturday NIMCONF!!!!

### random notes

- all links (to slides repo, to livecoding video) will have a small qr code in the slides
- Pietro using a circular mask for the webcam, as in [this video](https://www.youtube.com/watch?v=4i5rTa7m9Uo)
- very easy, add filter -> image mask -> select `circular_mask_obs.png` here in repo
