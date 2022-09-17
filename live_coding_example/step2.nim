import QRgen
import nimib

nbInit
nbText: "playing with  [QRgen](https://github.com/aruZeta/QRgen)"
nbCode:
  let myQR = newQr("https://github.com/pietroppeter/nimconf22-nimib")
  myQR.printTerminal
  flushFile stdout  # needed on windows not on mac (should printTerminal be "fixed" or- better - we should fix captureStdout with a flush at the end?)
  # also, for better rendering I need to turn off line-height: 1.4 in browser inspect tool. this is also something we might want to fix.
  # and I am not sure why we get all that whitespace between code and text!
nbSave