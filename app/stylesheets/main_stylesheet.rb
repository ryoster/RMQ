class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.light_gray
  end

  # def hello_world(st)
  #   st.frame = {top: 100, width: 200, height: 18, centered: :horizontal}
  #   st.text_alignment = :center
  #   st.color = color.battleship_gray
  #   st.font = font.medium
  #   st.text = 'Hello World'
  # end

  def search_label(st)
    st.frame = {l: 10, t: 100, w: device_width - 20, h: 40}
    st.color = color.white
    st.font = font.large
    st.text = 'Find'
  end

  def query(st)
    st.frame = {l: 10, top: 150, w: device_width - 20, height: 48}
    st.background_color = color.white
    st.view.font = font.large
  end

  def submit_button(st)
    st.frame = {l: 10, top: 200, w: device_width - 20, height: 48}
    st.background_color = color.blue
    st.text = 'GO!'
    st.color = color.white
    st.font = font.large
  end

end
