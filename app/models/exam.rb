# Semester III end-term datesheet (December 2026). Static data — edit the list below to change it.
class Exam < Data.define(:paper_code, :name, :date, :time, :subject_code)
  def self.all
    ALL
  end

  def day
    date.strftime("%A")
  end

  # The matching Subject page, if there is one.
  def subject
    Subject.all.find { |s| s.code == subject_code } if subject_code
  end

  TIME = "2 PM – 5 PM".freeze

  ALL = [
    new(paper_code: "11630", name: "Information Technology", date: Date.new(2026, 12, 8),  time: TIME, subject_code: "LBE-316A"),
    new(paper_code: "11625", name: "Jurisprudence",          date: Date.new(2026, 12, 10), time: TIME, subject_code: "LBC-311"),
    new(paper_code: "11626", name: "Company Law",            date: Date.new(2026, 12, 12), time: TIME, subject_code: "LBC-312"),
    new(paper_code: "11627", name: "CPC",                    date: Date.new(2026, 12, 14), time: TIME, subject_code: "LBC-313"),
    new(paper_code: "11628", name: "Environmental Law",      date: Date.new(2026, 12, 16), time: TIME, subject_code: "LBC-314"),
    new(paper_code: "11629", name: "Labour & Industrial Law", date: Date.new(2026, 12, 18), time: TIME, subject_code: "LBC-215")
  ].freeze
end
