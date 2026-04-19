if isempty(get(metadata["homepage"], "references", []))
    nothing
else
    references = [
      let
          image = get(x, "img", nothing)
          class = "no-decoration"
          desc = get(x, "description", get(x, "text", ""))
          title = desc |> string
          
          @htl("""<a title=$(title) class=$(class) href=$(x["url"]) target="_blank">
              <h3>$(x["name"])</h3>
              <p>$(desc)</p>
              $(if !(image === nothing || isempty(image))
                  @htl("""<img src=$(image)>""")
              end)
          </a>""")
      end for x in metadata["homepage"]["references"]
    ]

    @htl("""
    <div class="wide subjectscontainer">
      <h1>References</h1>
      <div class="subjects">
      $(references)      
      </div>
    </div>
    """)
end
