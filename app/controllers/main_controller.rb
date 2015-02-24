class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control, it's best not to do this
    # self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view

    # Create your UIViews here

    rmq.append(UILabel, :search_label)

    @query = rmq.append(UITextField, :query).focus.get

    rmq.append(UIButton, :submit_button).on(:touch) do |sender|
      search_for_images @query.text
    end
  end

  def init_nav
    self.title = 'RMQ Image Browser'
  end

  def search_for_images(query)
    if query && (query != '')
      query = query.gsub(/\s/, '%20')
      url = "https://secure.flickr.com/search/?=#{query}&s=int"

      rmq.animations.start_spinner

      AFMotion::HTTP.get(url) do |result|
        if html = result.body
          images = html.scan(/src="(.+?\.jpg)\"/).map do |m|
          m.first
          end

          puts images
          open_images_controller(images) if images.length > 0
          rmq.animations.stop_spinner
        end
      end

    end
  end

  def open_images_controller(images)
    controller = ImagesController.new
    controller.image_urls = images
    controller.title = @query.text
    self.navigationController.pushViewController controller, animated: true
  end
end


__END__

# You don't have to reapply styles to all UIViews, if you want to optimize,
# another way to do it is tag the views you need to restyle in your stylesheet,
# then only reapply the tagged views, like so:
def logo(st)
  st.frame = {t: 10, w: 200, h: 96}
  st.centered = :horizontal
  st.image = image.resource('logo')
  st.tag(:reapply_style)
end

# Then in willAnimateRotationToInterfaceOrientation
rmq(:reapply_style).reapply_styles
