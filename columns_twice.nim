import nimib, nimislides

nbInit(theme = revealTheme)
slide:
  columns:
    column:
      nbText: "Left Column"
    column:
      nbText: "Right Column"
const showError = true
when showError:
  slide:
    columns:
      column: # compile error here
        nbText: "Left Column"
      column:
        nbText: "Right Column"
#[
  Error: ambiguous call; both columns_twice.column(bodyInner`gensym13: untyped)
  [template declared in /Users/pietroppeter/nimib-reveal/src/nimiSlides.nim(482, 12)]
  and columns_twice.column(bodyInner`gensym63: untyped)
  [template declared in /Users/pietroppeter/nimib-reveal/src/nimiSlides.nim(482, 12)]
  match for: ()
]#
nbSave
