class EmailsController < ApplicationController

  post '/email' do
    if !params[:email][:email].blank?
      email = Email.create(email: params[:email][:email])
      if email.valid?
        # email = Email.create(email: params[:email][:email])
        # email.email = params[:email][:email]
        emails = Email.print_all
        Pony.mail(:to => 'emanuel.bierman@gmail.com', :subject => 'Updated nybrowning email list', :body => "#{emails}")

        flash[:message] = "Your email #{email.email} has been submitted."
        redirect "/"
      else
        flash[:message] = "This email is already registered to receive our monthly newsletters."
        redirect "/"
      end
    else
      flash[:message] = "Please input an email."
      redirect "/"
    end
  end
end
