class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(title, text)
  end
end

class HTMLFormatter
  def output_report(title, text)
    puts '<html>'
    puts '<head>'
    puts '<title>%s</title>' % title
    puts '</head>'
    puts '<body>'
    text.each do |line|
      puts '<p>%s</p>' % line
    end
    puts '</body>'
    puts '</html>'
  end
end

class PlainTextFormatter
  def output_report(title, text)
    puts '***** %s *****' % title
    text.each do |line|
      puts line
    end
  end
end

report = Report.new HTMLFormatter.new
report.output_report

report.formatter = PlainTextFormatter.new
report.output_report
