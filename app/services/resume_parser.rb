class ResumeParser
  def self.call(text)
    {
      raw_text: text,
      name: text[/^(.+)$/, 1],
      email: text[/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/],
      phone: text[/(\(?\d{2}\)?\s?\d{4,5}-?\d{4})/, 1],
      skills: [],
      experience: [],
      education: []
    }
  end
end