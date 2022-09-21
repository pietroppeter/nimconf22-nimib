import nimib
nbInit
nbKaraxCode:
  import karax / vstyles
  import std / [strutils]
  import QRgen
  var currentData = "https://github.com/aruZeta/QRgen"
  var ar = 0.0
  var mr = 0.0

  proc updateQR(data: string, ar, mr: float) =
    getElementById("svg-container").innerHtml = newQR(currentData).printSvg(alRad = ar, moRad = mr)

  postRender:
    updateQR(currentData, ar, mr)
    setForeignNodeId("svg-container")

  karaxHtml:
    tdiv(id = "svg-container", style = toCss("max-height: 50%; max-width: 50%; margin: 0 auto"))
    textarea(id = "data-field", placeholder = "https://github.com/aruZeta/QRgen"):
      proc onChange() =
        currentData = $(getVNodeById("data-field").getInputText)
        updateQR(currentData, ar, mr)
    br()
    label:
      text "Radius1"
    input(`type` = "range", min = "0", max = "3.5", value = "0", step = "0.1", id = "ar-slider"):
      proc oninput() =
        ar = ($getVNodeById("ar-slider").getInputText).parseFloat
        updateQR(currentData, ar, mr)
    br()
    label:
      text "Radius2"
    input(`type` = "range", min = "0", max = "0.4", value = "0", step = "0.01", id = "mr-slider"):
      proc oninput() =
        mr = ($getVNodeById("mr-slider").getInputText).parseFloat
        updateQR(currentData, ar, mr)
    br()
    button:
      text "Refresh"
      proc onclick() =
        updateQR(currentData, ar, mr)
nbSave