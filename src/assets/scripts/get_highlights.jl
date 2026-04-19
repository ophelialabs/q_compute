if isempty(get(metadata["homepage"], "carousel", []))
    nothing
else
    carousel_data = metadata["homepage"]["carousel"]
    
    @htl("""
    <div class="jumbotron-carousel">
      <div class="carousel-container">
        <div class="carousel-wrapper">
          <div class="carousel-track">
            $([
              @htl("""
              <section class="carousel-slide">
              <div class="content">
                  <h2>$(x["name"])</h2>
                  <p>$(x["text"])</p>
              </div>
              <div class="preview">
                  <img src="$(x["img"])">
              </div>
              </section>
              """) for x in carousel_data
            ])
          </div>
        </div>
        
        <button class="carousel-btn prev" aria-label="Previous slide">&#10094;</button>
        <button class="carousel-btn next" aria-label="Next slide">&#10095;</button>
        
        <div class="carousel-dots">
          $([
            @htl("""<button class="dot $(i == 1 ? "active" : "")" data-slide="$(i-1)" aria-label="Go to slide $(i)"></button>""")
            for i in 1:length(carousel_data)
          ])
        </div>
      </div>
    </div>
    """)
end