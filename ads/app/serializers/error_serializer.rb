module ErrorSerializer
  extend self

  def from_messages(error_messages, meta: {})
    error_messages = Array.wrap(error_messages)
    { errors: error_messages }.to_json
  end
  alias from_message from_messages

  def from_model(model)
    { errors: model.errors }.to_json
  end
end
