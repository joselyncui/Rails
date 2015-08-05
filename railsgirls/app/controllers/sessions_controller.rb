class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(email:params[:session][:email])
	if user && user.authenticate(params[:session][:password])
		# �����û���Ȼ���ض����û�������ҳ��
		log_in user
		redirect_to user
	else
		# ����һ��������Ϣ
		flash.now[:danger] = 'Invalid email/password combination'
		render 'new'
	end
  end

  def destory
	log_out
	redirect_to root_url
  end
  
end