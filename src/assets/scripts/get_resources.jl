using JSON

if isempty(get(metadata["homepage"], "resources", []))
    nothing
else
    cards = [
        let
            resource = res
            unique_id = replace(resource["name"], " " => "_", ":" => "")
            dropdown_options = get(resource, "options", [])
            
            @htl("""
            <div style="padding: 24px; background: linear-gradient(135deg, $(resource["gradient_from"]) 0%, $(resource["gradient_to"]) 100%); border: 1px solid #e0e6ed; border-radius: 12px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;" 
                 onmouseover="this.style.transform='translateY(-4px)'; this.style.boxShadow='0 8px 20px rgba(0, 0, 0, 0.15)'" 
                 onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 12px rgba(0, 0, 0, 0.08)'">
                <h3 style="margin-top: 0; color: #2c3e50; font-size: 1.4em;">$(resource["emoji"]) $(resource["name"])</h3>
                <p style="color: #555; line-height: 1.6; margin: 12px 0 0 0;">$(resource["description"])</p>
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
            </div>
            """)
        end for res in metadata["homepage"]["resources"]
    ]

    @htl("""
    <div class="wide subjectscontainer">
      <h1>Resources</h1>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 24px; margin: 30px 0; padding: 0 20px;">
      $(cards)      
      </div>
    </div>

    <!-- Modal for resource details -->
    <div id="resourceModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 1000; justify-content: center; align-items: center;">
        <div style="background: white; border-radius: 12px; padding: 30px; max-width: 600px; width: 90%; max-height: 80vh; overflow-y: auto; box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);">
            <div style="display: flex; justify-content: space-between; align-items: start; margin-bottom: 20px;">
                <h2 id="modalTitle" style="margin: 0; color: #2c3e50; font-size: 1.8em;"></h2>
                <button id="closeModal" style="background: none; border: none; font-size: 28px; cursor: pointer; color: #999;">×</button>
            </div>
            <div style="display: flex; gap: 20px; margin-bottom: 20px;">
                <img id="modalImage" src="" alt="Resource" style="width: 150px; height: 150px; object-fit: cover; border-radius: 8px;">
                <div style="flex: 1;">
                    <p id="modalCategory" style="font-size: 12px; color: #667eea; font-weight: 600; text-transform: uppercase; margin: 0 0 10px 0;"></p>
                    <p id="modalDescription" style="color: #555; line-height: 1.6; margin: 0 0 15px 0; font-size: 14px;"></p>
                    <div id="modalRelatedTools" style="display: none; background: #f9f9f9; padding: 12px; border-radius: 6px; border-left: 4px solid #667eea;">
                        <p style="margin: 0 0 8px 0; font-weight: 600; font-size: 12px; color: #333;">Related Tools:</p>
                        <div id="relatedToolsList" style="display: flex; flex-direction: column; gap: 8px;"></div>
                    </div>
                </div>
            </div>
            <div style="display: flex; gap: 10px;">
                <a id="modalLink" href="" target="_blank" style="display: inline-block; padding: 12px 20px; background: linear-gradient(135deg, #60a5fa 0%, #a78bfa 100%); color: white; text-decoration: none; border-radius: 6px; font-weight: 500; text-align: center; flex: 1;">Visit Resource →</a>
                <button id="closeModalBtn" style="padding: 12px 20px; background: #f0f0f0; border: 1px solid #ddd; border-radius: 6px; cursor: pointer; font-weight: 500; color: #333;">Close</button>
            </div>
        </div>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const selects = document.querySelectorAll(".resource-select");
        const modal = document.getElementById("resourceModal");
        const closeBtn = document.getElementById("closeModal");
        const closeModalBtn = document.getElementById("closeModalBtn");

        function openModal(optionData) {
            try {
                document.getElementById("modalTitle").textContent = optionData.name;
                document.getElementById("modalCategory").textContent = optionData.category;
                document.getElementById("modalDescription").textContent = optionData.description;
                document.getElementById("modalImage").src = optionData.img;
                document.getElementById("modalLink").href = optionData.url;
                
                // Handle related tools if present
                const relatedToolsDiv = document.getElementById("modalRelatedTools");
                const relatedToolsList = document.getElementById("relatedToolsList");
                
                if (optionData.related_tools && optionData.related_tools.length > 0) {
                    relatedToolsList.innerHTML = optionData.related_tools.map(tool => 
                        `<a href="\${tool.url}" target="_blank" style="color: #667eea; text-decoration: none; font-size: 13px; padding: 4px 0;"><strong>\${tool.name}</strong>: \${tool.description}</a>`
                    ).join("");
                    relatedToolsDiv.style.display = "block";
                } else {
                    relatedToolsDiv.style.display = "none";
                }
                
                modal.style.display = "flex";
            } catch (e) {
                console.error("Error opening modal:", e);
            }
        }

        function closeResourceModal() {
            modal.style.display = "none";
        }

        selects.forEach(select => {
            select.addEventListener("change", function(e) {
                if (this.value) {
                    try {
                        const optionData = JSON.parse(this.value);
                        openModal(optionData);
                        this.value = "";
                    } catch (err) {
                        console.error("Error parsing option data:", err);
                    }
                }
            });
        });

        closeBtn.addEventListener("click", closeResourceModal);
        closeModalBtn.addEventListener("click", closeResourceModal);

        modal.addEventListener("click", function(e) {
            if (e.target === modal) {
                closeResourceModal();
            }
        });
    });
    </script>
    """)
end
