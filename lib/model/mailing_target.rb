class MailingTarget < ActiveRecord::Base
  #attr_accessor :email_address, :opted_out
  self.table_name = "mailing_list"
end