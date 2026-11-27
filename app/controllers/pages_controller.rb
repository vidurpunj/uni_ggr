class PagesController < ApplicationController
  FEATURES = [
    { title: "Concise notes", body: "Each unit of the syllabus condensed into revision-ready notes with statutory references." },
    { title: "Case briefs", body: "Landmark judgments broken down into facts, issues, held, and ratio." },
    { title: "Past papers", body: "Previous years' exam questions, grouped by topic, with model answer outlines." },
    { title: "Moot & viva prep", body: "Research tips, memorial structure, and the questions examiners like to ask." }
  ].freeze

  def home
    @subjects = Subject.all
    @features = FEATURES
    @exams = Exam.all
  end
end
