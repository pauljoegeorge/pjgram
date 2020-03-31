module ArticlesHelper
  # Return the tag names separated by a comma and space
  def tags_as_string
    tag_names.join(", ")
  end

# Split up the provided value by commas and (optional) spaces.
  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end
end
