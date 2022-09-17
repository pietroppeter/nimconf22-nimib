import QRgen
import nimib

nbInit
nbText: "playing with  [QRgen](https://github.com/aruZeta/QRgen)"
nbCode:
  let myQR = newQr("https://github.com/pietroppeter/nimconf22-nimib")
  writeFile("qr.svg", myQR.printSvg)
nbImage("qr.svg")
nbRawHtml: myQR.printSvg
nbRawHtml: """<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Ever wondered how a QR code works? <br>No, me neither but it&#39;s low-key fascinating.<br><br>(Warning, there is some extremely nerdy shit here.👇 ) <a href="https://t.co/SgQJVvhu0q">pic.twitter.com/SgQJVvhu0q</a></p>&mdash; Dan Hollick 🇿🇦 (@DanHollick) <a href="https://twitter.com/DanHollick/status/1570040185500626947?ref_src=twsrc%5Etfw">September 14, 2022</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>"""
nbSave