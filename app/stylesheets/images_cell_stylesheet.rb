module ImagesCellStylesheet
  def cell_size
    {w: 96, h: 96}
  end

  def images_cell(st)
    st.frame = cell_size
    st.background_color = color.random

    # Style overall view here
  end

  def image(st)
    st.frame = :full
  end

end
