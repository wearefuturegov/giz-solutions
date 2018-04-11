# frozen_string_literal: true

class CustomDeviseMailer < Devise::Mailer
  include SendGridMailer

  def confirmation_instructions(record, token, _opts = {})
    sendgrid_devise_mail(:confirmation_instructions, record, confirmation_url(record, confirmation_token: token))
  end

  def reset_password_instructions(record, token, _opts = {})
    sendgrid_devise_mail(:reset_password_instructions, record, edit_user_password_url(record, reset_password_token: token))
  end

  # def unlock_instructions(record, token, opts={})
  #   sendgrid_devise_mail(:confirmation_instructions, record, token)
  # end

  # def email_changed(record, opts={})
  #   sendgrid_devise_mail(:confirmation_instructions, record)
  # end

  # def password_change(record, opts={})
  #   sendgrid_devise_mail(:password_change, record)
  # end

  private

  def sendgrid_devise_mail(email_type, record, devise_link=nil)
    sendgrid_mail(
      get_subject(email_type),
      Email.new(email: "#{record.name} <#{record.email}>"),
      get_content(
        "devise/mailer/#{email_type}",
        devise_link: devise_link,
        name: record.name)
    )
  end

  def get_subject(key)
    I18n.t(:"#{key.to_s}_subject", scope: [:devise, :mailer, key],
                                   default: [:subject, key.to_s.humanize])
  end
end
