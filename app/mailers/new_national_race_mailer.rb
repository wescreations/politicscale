class NewNationalRaceMailer < ApplicationMailer
  default from: 'wesleycreations@gmail.com'

  def self.send_request(row)

    emails = []
    User.where(state: $national_race.state).each do |u|
      emails << u.email # To insert the user email into the array
    end

    emails.each do |email|
      new_request(email,row).deliver_now
    end
  end

  def new_request(email, row)
    @national_race = row
    mail(to: email, subject: 'New request')
  end
end
