# frozen_string_literal: true

class CustomDeviseMailer < Devise::Mailer
  include SendGridMailer

  def confirmation_instructions(record, token, _opts = {})
    sendgrid_devise_mail(:confirmation_instructions, record, token)
  end

  def reset_password_instructions(record, token, _opts = {})
    sendgrid_devise_mail(:reset_password_instructions, record, token)
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

  def sendgrid_devise_mail(email_type, record, token = nil)
    sendgrid_mail(
      get_subject(email_type),
      Email.new(email: record.email),
      get_content("devise/mailer/#{email_type}", token: token, resource: record, email: record.email)
    )
  end

  def get_subject(key)
    I18n.t(:"#{key.to_s}_subject", scope: [:devise, :mailer, key],
                                   default: [:subject, key.to_s.humanize])
  end
end
