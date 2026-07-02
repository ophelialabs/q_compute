if isempty(get(metadata["homepage"], "references", []))
    nothing
else
    references = [
      let
          image = get(x, "img", nothing)
          class = "reference-card" * (if !(image === nothing || isempty(image)) " has-image" else "" end)
          desc = get(x, "description", get(x, "text", ""))
          title = desc |> string
          dropdown_options = get(resource, "options", [])

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
