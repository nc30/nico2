module ApplicationHelper
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "localhost:3000")
    processor.call(markdown)[:output].to_s.html_safe
  end
end
