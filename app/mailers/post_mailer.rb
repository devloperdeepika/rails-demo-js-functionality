# class PostMailer < ApplicationMailer
#   def new_post_notification(post)
#     @post = post
#     mail(to: 'deedangi@bestpeers.com', subject: 'New Post Notification')
#   end
# end

# app/mailers/post_mailer.rb

class PostMailer < ApplicationMailer
  def new_post_notification(post)
    @post = post
    mailchimp_template_id = 'your-mailchimp-template-id'
    recipient_email = User.last.email

    gibbon = Gibbon::Request.new(api_key: Gibbon::Request.api_key)
    gibbon.lists('9446b13a2d').members.create(
      body: {
        email_address: recipient_email,
        status: 'subscribed',
        merge_fields: {
          FNAME: 'Recipient',
          LNAME: 'Example'
        }
      }
    )

    # Trigger the Mailchimp API to send the email
    gibbon.campaigns.create(
      body: {
        type: 'regular',
        recipients: {
          list_id: '9446b13a2d'
        },
        settings: {
          subject_line: 'New Post Notification',
          title: 'New Post Notification',
          from_name: 'Your Name',
          reply_to: 'your-email@example.com'
        },
        template: {
          id: mailchimp_template_id,
          sections: {}
        }
      }
    )
  end
end

