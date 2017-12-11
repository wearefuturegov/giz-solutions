class SolutionMailer < ActionMailer::Base
  default from: GizSolutions.config.support_email

  def notify_admins(admin_emails, new_solution)
    @new_solution = new_solution
    mail(
      to: admin_emails,
      subject: I18n.t('mail.solution.subject.new_solution')
    )
  end
end
