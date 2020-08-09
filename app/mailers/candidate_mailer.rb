class CandidateMailer < ApplicationMailer
  default from: 'wesleycreations@gmail.com'

  def self.send_request(row)

    emails = []
    User.where(state: $candidate.home_state).each do |u|
      emails << u.email # To insert the user email into the array
    end

    emails.each do |email|
      new_request(email,row).deliver_now
    end
  end

  def new_request(email, row)
    @candidate = row
    mail(to: email, subject: 'New request')
  end
end

