import nimib
import nimiSlides

nbInit(theme = revealTheme)
setSlidesTheme(Moon)

import nimpy/py_lib
pyInitLibPath("/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0")
nbInitPython()

slide:
  nbText: "## Who am I"

slide:
  nbText: hlMd"""
## nbPython
"""
  nbPython: hlPy"""
print("Hello world")
"""

slide:
  slide:
    nbText: hlMd"""
## Nimib goes interactive!
Compile Nim code to Javascript with ease!
"""

  slide:
    nbText: "## Why?"

  slide:
    nbText: "## How?"

  slide:
    nbText: hlMd"""
## API
- `nbJsFromCode` - compiles the code to javascript
- `nbKaraxCode` - sugar for using the API with Karax
"""

slide:
  nbText: hlMd"""
## Nimiboost  
- Basic info

Let's head over to VSCodium!
"""

nbSave