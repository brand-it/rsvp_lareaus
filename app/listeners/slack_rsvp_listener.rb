# frozen_string_literal: true

class SlackRsvpListener
  def rsvp_guest_created(rsvp_guest)
    SlackMessage.chat_postMessage(slack_attachment_new(rsvp_guest))
  end

  def rsvp_guest_updated(rsvp_guest)
    SlackMessage.chat_postMessage(slack_attachment_updated(rsvp_guest))
  end

  private

  def slack_attachment_updated(rsvp_guest)
    {
      channel: '#rsvp',
      as_user: true,
      attachments: [
        {
          title: "#{rsvp_guest.name} has updated there information",
          color: '#1edb7c',
          text: changes_to_sentence(rsvp_guest),
          ts: Time.now.to_i,
          footer: 'RSVP'
        }
      ]
    }
  end

  def slack_attachment_new(rsvp_guest)
    {
      channel: '#rsvp',
      as_user: true,
      attachments: [
        {
          title: "#{rsvp_guest.name} is #{rsvp_guest.attending? ? 'Attending' : 'Not Attending'}",
          color: '#1edb7c',
          text: "Total #{rsvp_guest.total_adults_attending} adults & Total children #{rsvp_guest.total_children_attending}",
          ts: Time.now.to_i,
          footer: 'RSVP'
        }
      ]
    }
  end

  def changes_to_sentence(rsvp_guest)
    rsvp_guest.changes.map do |key, values|
      "#{key.humanize.titleize} was changed from #{humanize_changes(values[0], values[1])}"
    end.join("\n")
  end

  def humanize_changes(from_value, to_value)
    if !!from_value == from_value && !!to_value == to_value # rubocop:disable Style/DoubleNegation
      "\"#{from_value ? 'Yes' : 'No'}\" to \"#{to_value ? 'Yes' : 'No'}\""
    else
      "\"#{from_value}\" to \"#{to_value}\""
    end
  end
end
