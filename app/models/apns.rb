class Apns < ActiveRecord::Base

  def self.send_message(message, user_id)
    u = User.find(user_id)
    if (!u.apns_token.nil?)
      p "** sending msg, userid: #{user_id} msg: #{message}"
      cert_path = "#{Rails.root}/private/rails_push_test.pem"
      apns_env_prod = false
      gateway = apns_env_prod ? "feedback.push.apple.com" : "feedback.sandbox.push.apple.com"
      p "path #{cert_path}"
      p "env: #{gateway}"

      pusher = Grocer.pusher(
          certificate: cert_path, # required
          passphrase: "", # optional
          gateway: gateway, # optional; See note below.
          port: 2195, # optional
          retries: 3 # optional
      )

      notification = Grocer::Notification.new(
          device_token: u.apns_token,
          alert: "Hello from Grocer!",
          badge: 0,
          expiry: Time.now + 60*60, # optional; 0 is default, meaning the message is not stored
      )

      pusher.push(notification)

      p "** notification appears to have been pushed **"


      feedback = Grocer.feedback(
          certificate: cert_path, # required
          passphrase: "", # optional
          gateway: gateway, # optional; See note below.
          port: 2196, # optional
          retries: 3 # optional
      )

      feedback.each do |attempt|
        puts "Device #{attempt.device_token} failed at #{attempt.timestamp}"
      end
    end
  end



end