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
              <div style="align: center">
                    <select id="$(unique_id)-select" class="resource-select" data-resource="$(unique_id)" style="padding: 8px 12px; border-radius: 4px; border: 1px solid #ddd; font-size: 14px;">
                        <option value="">-- $(get(resource, "select_placeholder", "Choose an option")) --</option>
                        $([
                            let opt = option_item
                                opt_json = JSON.json(opt)
                                @htl("""<option value='$(opt_json)'>$(opt["name"])</option>""")
                            end
                            for option_item in dropdown_options
                        ])
                    </select>
               </div>
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
