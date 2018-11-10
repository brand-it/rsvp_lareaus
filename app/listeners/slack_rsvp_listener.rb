# frozen_string_literal: true

class SlackRsvpListener
  def rsvp_guest_created(rsvp_guest)
    SlackMessage.chat_postMessage(slack_attachment(rsvp_guest))
  end

  private

  def slack_attachment(rsvp_guest)
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
end
