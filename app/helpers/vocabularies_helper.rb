module VocabulariesHelper
  def view_allowed?(my_id, others_id)
    my_id == others_id
  end
end
