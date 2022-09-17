import QRgen
import nimib

nbInit
nbText: "playing with  [QRgen](https://github.com/aruZeta/QRgen)"
nbCode:
  let myQR = newQr("https://github.com/pietroppeter/nimconf22-nimib")
  writeFile("qr.svg", myQR.printSvg)
nbImage("qr.svg")
nbSave