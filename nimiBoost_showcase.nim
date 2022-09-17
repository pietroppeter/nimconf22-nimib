import nimib

nbInit

import nimpy/py_lib
pyInitLibPath("/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0")
nbInitPython

nbText: """
# Markdown
## Another header
 
You can have *italic* and **bold** as well as ~~crossed over~~ text.

- Lists
- works
- as well
  1. first
  2. second
  3. third
"""

nbPython: """
def add(a, b):
  return a + b

a = 1
b = 2

print("Result:", add(a, b))
"""

nbRawHtml: hlHtml"""
<p id="text-id">You haven't clicked the button yet!</p>
<button id="btn-id">Click me!</button>
"""

nbJsFromString: """
import std / [dom]

let btn = getElementById("btn-id")
let p = getElementById("text-id")

var counter: int

btn.addEventListener("click", proc (event: Event) =
  counter += 1
  p.innerHtml = cstring("You have clicked the button " & $counter & " times!")
)
"""

nbSave