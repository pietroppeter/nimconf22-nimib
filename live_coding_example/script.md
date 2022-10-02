- Hello everyone, I am Pietro and today
  I will show you how the **nimib** library
  allows you to create html documents directly from nim code
- with nimib you can share your nim adventures
  and help nim fulfill its destiny and become
  "the one language to rule the mole"
- (pause)
- I want to play with a cool library that was just released,
  QRgen by Aruzeta (spanish accent)
- I have already installed the library
  and I am typing the first example that comes in QRgen's readme

https://forum.nim-lang.org/t/8780

```nim
import QRgen

let myQR = newQr("https://forum.nim-lang.org/t/8780")
# ...let myQR equals newQR, and the content is a string
# with a mysterious url inside
# by the time I am done, you will be able to unravel
# this mistery with your phone
myQR.printTerminal
```
- now I compile and run the code (`nim r qrfun`)
- (I have added a nim.cfg with verbosity set to 0)
- very nice, I can see the QRcode in the terminal!
  (muy chulo Aruzeta!)
- this is a very simple piece of code that does something
  and echoes output to the terminal
- let's see how nimib can produce a document
  that will capture the content printed to terminal
  and create an html that shows both the code 
  and the output it has produced
```nim
import nimib # I need to import nimib
# which I have already installed with `nimble install nimib`
nbInit # then, I initialize the document with nbInit
nbCode: # I wrap the code with nbCode
  import QRgen

  let myQR = newQr("https://forum.nim-lang.org/t/8780")
  myQR.printTerminal
nbSave # and ask nimib to render and save the document at the end with nbSave
```
- just 3 commands: nbInit, nbCode and nbSave
- now I run the standard nim command to compile and run
- with one little twist: I add a runtime option at the end `--nbShow`
- (`nim r qrfun --nbShow`)
- "Fico!" (cool in Italian) not only it has created the html document
- it has also opened a browser tab showing me the document!
- (this last bit is thanks to the --nbShow option)
- (pause)
- now, if you are trying to use your phone on the qr code
  it might not work (it does not for me),
  so let's try to show an actual image with the qr code
  and have nimib show the image

https://github.com/aruZeta/QRgen

```
import nimib

nbInit
# before working on the image let me show you first
# another essential element of nimib, the nbText command
nbText: """## Having fun with [QRgen](https://github.com/aruZeta/QRgen)
Where will the _mysterious_ url lead me?
""" # as you will see nbText allows you to use markdown
# to create directly the html content

nbCode:
  import QRgen

  let myQR = newQr("https://forum.nim-lang.org/t/8780")
  # I will change the output to a svg file
  # (and I am keeping the previous printTerminal)
  # (note that the scope is shared and the seconde nbCode will be able to access myQR)
  "qrfun.svg".writeFile myQR.printSvg
# now to visualize the image I have created I will call a nbImage command
nbImage("qrfun.svg")
nbCode:
  myQR.printTerminal
nbSave
```
- this time instead of compiling and running from terminal
- I will use "Nimiboost" VS code extension (Takk Hugo!)
- and with one click (or Ctrl+K release V)...
- I can see the output directly in VS code!
- (pause)
- that's awesome! and it took me about 3 minutes to get here!
- have you found out where the mysterious url leads you?
- (pause)
- now I only need to set up a repo (like github with pages on) and
- everyone will be able to see I am having fun with QR code,
- and that nim is awesome and it is gonna rule the mole!
- Ciao!