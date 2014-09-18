class ContactsController < ApplicationController
  def index
    if current_user
      @contacts = Contact.all.where(:user_id => current_user.id)
    else
      @contacts = Contact.new
    end
  end


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact created!"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if params.include?(:myphone)
      current_user.phone = @contact.phone
      current_user.save
      flash[:notice] = "Your phone number is set to #{@contact.phone}, #{current_user.email}!"
      redirect_to contact_path(@contact)
    else
      if @contact.update(contact_params)
        flash[:notice] = "Contact updated!"
        redirect_to contact_path(@contact)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Your contact has been deleted"
    redirect_to root_path
  end


private
  def contact_params
    params.require(:contact).permit(:name, :phone, :user_id, :myphone)
  end

end
