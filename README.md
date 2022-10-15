# nimconf22-nimib

slides for nimib presentation at nimconf 2022

**Title**: Nimib goes interactive

## summary

- [both: 4 mins]
  - intro (title, who we are, previous presentation, content of presentation)
- [pietro: 5 mins]
  - intro to nimib with livecoding (example with QRgen)
- [pietro: 18 mins]
  - introduce nimib 0.3 changes
  - nimibCodeAsInSource is default
  - make your own block
  - fancy blocks
- [hugo: 16 mins]
  - nbPython
  - nbJSstuff
- [pietro 5 mins]
  - js plant app
- [hugo: 5 mins]
  - nimiboost
- [both 10 mins] outro
  - roadmap
  - contributing (back together)
  - thanks 

 4 intro +
 5 livecoding + 
18 blocks +
16 js +
 5 nimiboost +
 5 plant app +
10 outro
 =
1h03'

up for cuts:
- plant app 5
- nimiboost 5

## status

- [x] record and send presentation
  - [ ] will they ask us to cut it?
- [ ] add contribute.md to nimib
- [ ] cleanup roadmap
  - [ ] cleanup and label issues
- [ ] prepare slides and repo to be made public on conf day
  - [ ] single index.nim with slides
    - [ ] refactor intro
    - [ ] refactor hugos_slides
  - [ ] add source(s) of slides (bottom of title page)?

### meetings:

- [x] Sep 10th, Sat 12:00
- [x] Sep 17-18, Sat 15:00
- [x] Sep 24-25, Sun 15:00
- [x] Oct 1 - Sun 10-12 start recording (all individual parts + intro together)
- [x] Oct 9 - Sun 10-12:30
- [x] Oct 13 (Thu) **deadline for video**
- [ ] Oct 15-16 (what else?)
- [ ] Oct 22, Saturday NIMCONF!!!!

### recording

* video recording: https://obsproject.com
* video editing: https://www.openshot.org/
* using a circular mask for the webcam, as in [this video](https://www.youtube.com/watch?v=4i5rTa7m9Uo)
  - add filter -> image mask -> select `circular_mask_obs.png` here in repo
* to record both persons at the same time, share second display with zoom video and crop to fit the circle

### preparing slides

- [x] release 0.3.1 nimib
- together
  - [x] title slide
  - [x] presentation content slide
  - [x] recorded intro
- Pietro:
  - [x] who am I (reuse from last time)
  - [x] livecoding
    - [x] code example
    - [x] record livecoding
    - [x] livecode slide
  - [x] 0.3.x changes
    - [x] intro slide for release
      - [x] add lines on 1) how to (custom blocks examples) 2) a js mathy plant app
    - [x] codeAsInSource
      - [x] fix animation of code lines
      - [x] mention CodeFromAst macro
    - [x] custom block theory
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
      - [x] a refresher on mustache
      - [x] render function (implementation details)
        - [x] review and animate
      - [x] how do I create a block
        - [x] nbCode
        - [x] nbText
        - [x] nbImage
      - [x] other blocks
        - [x] nbCodeInBlock
        - [x] nbTextWithCode
        - [x] nbFile (string and untyped)
        - [x] nbRawHtml
          - example on how to create blocks with this
      - [x] how can **you** create blocks?
        - [x] "natively" (newNbCodeBlock, newNbSlimBlock)
        - [x] from other blocks, composing, copying and customizing
        - [x] discussion about partials+renderPlans vs nbRawHtml
          - [x] mention container block as missing piece
    - [x] fancy blocks (blocks with (external) js)
      - [x] how to use external js functionality (add to head, add to main)
      - [x] add redo a title slide
      - [x] leftRight slider      
      - [x] mermaid
        - [x] fix in nblog
      - [x] plotly
    - [x] js mathy plant app: title slide
      - [x] add minimal intro
      - [x] embed html
      - [x] use nimconf for this part of slides
    - [x] refactor to allow easy change to nimconfslides
  - [x] record the 0.3.x changes part
  - [x] record description of plant_app as example of js
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
  - [x] contributing
  - [x] roadmap
  - [x] hi, thanks, goodbye

cleanup blcok slides before recording again:
- [x] remove stuff and redo what is a block
- [x] add a note that all example will be found in nblog and a link

### recording sessions (October 2 and October 9)

homework:
  Pietro:
    - [x] livecoding recording
    - [x] complete release slides
    - [x] record release part
    - [x] record plant app
    - [x] work on later slides (contribution + roadmap)
  Hugo:
    - [x] nimiboost recording
    - [x] record part 2 of slides (+ details)
    - [x] put together videos

during sessions:
  - [x] record intro together - Oct 2
  - [x] record outro together - Oct 9

#### nice to have

- [ ] cornerImage without JS? or at least without calling JS every time
- [ ] qr code links around
- [ ] whale in the qr code
- [ ] source of slides (bottom of title slide)
