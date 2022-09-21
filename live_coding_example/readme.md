## Live Coding Example

In past nim conf (2021) there was a short example in the slides introducing what nimib is and how to use it (based on nimoji).

In this nimconf (2022) the idea is still to have a short introduction but this time it should be a livecoding session, so that we can show the workflow. It should not only introduce what nimib is and how it works, but also show off some of the recently released features.

As a concrete idea for the live coding example, the goal is to show how nimib works by showing how [qrgen](https://github.com/aruZeta/QRgen) works.
Live coding should work in steps and will assume nothing, only that you have installed nim.

Likely the steps below are too much stuff to cover, I should start implementing only a subset of those and see how much time it will take to implement the rest. The minimal set is steps 1-4. Also to be discussed with hugo if and how to do steps 6-7. 5 is really a question mark to be honest, but it was an idea I had in the back of my mind since some time. very unlikely it will make the final cut

0. install qrgen with nimble
1. show example of using qrgen (printTerminal)
2. installing nimib and show how the same content can be published to html. Elements introduced in this way:
  - import nimib
  - nbInit
  - nbText
  - nbCode
  - nbSave
  - here I use --nbShow
3. now use printSvg, save to a svg file and show it as an image in nimib. We show now how to use:
  - nbImage
  - here I use nimiboost
4. instead of showing the image from a file we can actually embed it as a svg in the page with nbRawHtml. And the same command can be used to embed a tweet (https://twitter.com/DanHollick/status/1570040185500626947?s=20&t=tqLmT5uvA45fEBqvOW1FmA)
  - nbRawHtml
5. how does qrgen printSvg works? I know it must have options for (at least) error correcting level. Show how I can use nbHelp (a new command, yet to be implemented) to show api of a library (base nbHelp on this https://stackoverflow.com/questions/61221599/nim-equivalent-to-pythons-help/61230721#61230721)
  - nbHelp (to be designed and implemented)
  - see also here: https://rosettacode.org/wiki/Reflection/List_methods#Nim
6. now that we now we have options it could be cool to have an app that allows you to show a qr code based on input and selection of error level (and colors). steps 6 and following should implement the app using:
  - nbKarax
  - karaxHtml
7. we might be able to simplify the api by using karax widgets (which in that case should be added to nimib), see https://pietroppeter.github.io/nblog/drafts/karax_widgets_demo.html
8. a last step could be to set up github pages and make it public so that you can publish your app and the live coding goes from zero (only assuming nim and being interested in a library) to publishing a document + app on that part of nim code. shoudl we also add nimib as a github topic for easier discoverability?