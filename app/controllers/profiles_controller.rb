class ProfilesController < ApplicationController
   def new
      # form where each user can fill out there own profile.
      @user = User.find( params[:user_id] )
      @profile = Profile.new
   end
   
   def create
      @user = User.find( params[:user_id] )
      @profile = @user.build_profile(profile_params)
      if @profile.save
         flash[:success] = "Profile updated!"
         redirect_to user_path( params[:user_id] )
      else
         render action: :new
      end
   end
   
   private
      def profile_params
         params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
      end
end