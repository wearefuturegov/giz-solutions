# frozen_string_literal: true

require 'sendgrid-ruby'

module SendGridMailer
  include SendGrid

  def get_content(template, assigns = {})
    content = Content.new(
      type: 'text/html',
      value: ApplicationController.render(
        template: template,
        layout: nil,
        assigns: assigns
      )
    )
  end

  def sendgrid_mail(subject, to, content)
    from = Email.new(email: GizSolutions.config.support_email)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.headers
  end
end
