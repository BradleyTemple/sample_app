module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :safe_links_only => true, :filter_html => true, :hard_wrap => true, :tables => true, :autolink => true)
    markdown.render(text).html_safe
  end
end
