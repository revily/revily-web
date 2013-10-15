module BootstrapHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :danger   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag :div, class: "dialog dialog-#{type} fade in" do
          content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") + msg.html_safe
        end
        flash_messages << text if message
      end
    end
    flash_messages.join("\n").html_safe
  end

  def page_header(&block)
    content_for(:page_header) do
      content_tag :div, class: 'page-header' do
        content_tag :div, nil, class: 'row-fluid', &block
      end
    end
  end

  def controller?(controller, version='v1')
    params[:controller] == "#{version}/#{controller}"
  end

  def is_active?(controller)
    "active" if controller?(controller)
  end

  def link_to_nav(content, path, controller=nil, options={})
    controller = controller || content.downcase

    content_tag :li, class: is_active?(controller) do
      link_to content, path, options
    end
  end

  def brand_link
    link_to "Revily", root_path, class: 'brand'
  end

  def collapse_button(target)
    content_tag :button, nil, class: 'btn btn-navbar', data: { toggle: 'collapse', target: target }
  end
end
