class ContactFormsController < ApplicationController

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.valid?
      @contact_form.deliver
      redirect_to thanks_path
    else
      render :new
    end
  end
end
