class UserForms::RegistrationForm < Reform::Form
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods
  include Composition
  model :visitor
  property :id, on: :visitor
  property :name, on: :visitor  
  property :email, on: :visitor 
  property :password, on: :visitor 
  property :password_confirmation, on: :visitor 
  property :refer, on: :visitor, default: User.new

  validation name: :default, with: { form: true } do 
    configure do
      config.messages_file = 'config/locales/forms/registration_form_error_messages.yml'
      def email_case_insensitive_uniqueness?
        form.email.downcase!
        Visitor.where.not(id: form.id).where("email = ?",
                                             form.email).empty?
      end

      def same_password? value
        value == form.password 
      end
    end

    required(:name).filled max_size?: 50
    required(:email).filled max_size?: 250
    required(:email).filled :email_case_insensitive_uniqueness?,
      format?: URI::MailTo::EMAIL_REGEXP
    required(:password).filled min_size?: 6 
    required(:password_confirmation).filled :same_password?
  end 
end
