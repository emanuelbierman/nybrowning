class EmailsController < ApplicationController

  post '/email' do
    if !params[:email][:email].blank?
      if !Email.find_by(email: params[:email][:email])
        email = Email.new
        email.email = params[:email][:email]
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
