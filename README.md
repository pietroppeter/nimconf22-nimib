# nimconf22-nimib

slides for nimib presentation at nimconf 2022

Title: Nimib goes interactive

**October 9th - send a video recording of your talk!**

## prep

- [x] release 0.3.1 nimib
- [ ] stuff in https://github.com/pietroppeter/nimib/discussions/112

## status

- together
  - [ ] title slide
    - [ ] add a small QR code with link to slides
  - [x] presentation content slide
- Pietro:
  - [x] who am I (reuse from last time)
  - [ ] livecoding
    - [x] code example
    - [ ] record livecoding
    - [x] livecode slide
      - [ ] add nbVideo to nimib (for Pietro's live coding)
      - [ ] add a small QR code with link to video
  - [ ] 0.3.x changes
    - [x] intro slide for release
    - [x] codeAsInSource
      - [ ] fix animation of code lines and mention CodeFromAst macro
    - [ ] custom block theory
      - [ ] custom block examples: nbCode, nbText, nbImage
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
  - [ ] nimiboost
    - [x] livecoding example
    - [ ] record nimiboost livecoding
    - [ ] Hugo nimiboost: add a way to add video to slides
  - [ ] details
    - [ ] bigger buttons
    - [ ] better example for postRender
- back to Pietro
  - [ ] nimibook changes
  - [x] nimib gallery
    - [ ] fix mermaid in nblog
    - [ ] fix plotly in nblog
- together:
  - [ ] contributing
  - [ ] roadmap
  - [ ] hi, thanks, goodbye

## recording

### first session (October 8-9)

homework:
  Pietro:
    - [ ] livecoding recording
    - [ ] complete release slides + record
    - [ ] work on later slides 
  Hugo:
    - [ ] nimiboost recording
    - [ ] record part 2 of slides (+ details)

during session:
  - [ ] record intro together

nice to have:
  - [ ] qr code links around
  - [ ] whale in the qr code

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
- [ ] Oct 1-2 - start recording (all individual parts + intro together)
- [ ] Oct 8-9 **deadline for video**
- [ ] Oct 15-16 (what else?)
- [ ] Oct 22, Saturday NIMCONF!!!!

### random notes

- all links (to slides repo, to livecoding video) will have a small qr code in the slides
- Pietro using a circular mask for the webcam, as in [this video](https://www.youtube.com/watch?v=4i5rTa7m9Uo)
- very easy, add filter -> image mask -> select `circular_mask_obs.png` here in repo
