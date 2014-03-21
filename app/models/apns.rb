class Apns < ActiveRecord::Base

  def self.send_message(message)

    c = message.collection
    owner = message.user_id
    c.collaborators.each do |u|
      # if (u.id != owner)
        if (!u.apns_token.nil?)
          self.push_apns(message.notes, u.apns_token)
        else
          p "user #{u.email} does not have token"
        end
      # else
      #   p "do not send to this owner #{u.email}"
      # end
    end

  end

  def self.push_apns(message, token)
    cert_path = "#{Rails.root}/private/rails_push_test.pem"
    apns_env_prod = false
    gateway = apns_env_prod ? "feedback.push.apple.com" : "feedback.sandbox.push.apple.com"

    pusher = Grocer.pusher(
        certificate: cert_path,
        gateway: gateway,
        retries: 2
    )

    notification = Grocer::Notification.new(
        device_token: token,
        alert: message
    )

    pusher.push(notification)

  end



end