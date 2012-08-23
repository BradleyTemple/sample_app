class PrinterFriendlyArticle < Prawn::Document
  def initialize(article, view)
    super()
    @article = article
    @view = view
    title
    author
    body
  end
  
  def title
    text "#{@article.title}", size: 30, style: :bold
  end
  
  def author
    move_down 10
    text "Posted by #{@article.author}", size: 10
  end
  
  def body
    move_down 10
    text @view.strip_tags @view.markdown(@article.body)
  end
end