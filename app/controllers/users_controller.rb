class UsersController < ApplicationController
  def posts
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def index
  end

  def new
  end

  def create
    #------------------ bycrpt 적용 ------------------
    unless User.find_by(email: params[:email])
      @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

      if @user.save
        # 가입이 되면, true + 저장이 되고
        flash[:notice] = "가입을 축하드립니다."
        redirect_to '/login'
      else
        #비밀번호가 달라서 가입이 안되면, false + 저장이 안됨
        flash[:alert] = "비밀번호가 다릅니다."
        redirect_to '/'
      end
    else
      flash[:alert] = "등록된 이메일입니다."
       redirect_to '/'
    end
    #-------------------일반적인 로직 -------------------
    # #1. email 검증 User.find_by(email: 값)
    # if User.find_by(email: params[:email])
    #   flash[:alert] = "가입된 이메일입니다."
    #   redirect_to :back
    # else
    #   if params[:password] == params[:password_confirmation]
    #     User.create(username: params[:username], email: params[:email],password: params[:password])
    #     flash[:notice] = "#{params[:username]}님 가입이 완료되었습니다."
    #     redirect_to '/'
    #   else
    #     flash[:alert] = "비밀번호가 일치하지 않습니다."
    #     redirect_to :back
    #   #1-1. 맞으면 비밀번호 확인
    #   end
    # end
    # #1-1-1. 비밀번호가 같으면 가입
    # #1-1-2. 비밀번호가 틀리면, falsh 메세지로 비밀번호가 일치하지 않습니다. redirect_to :back
    # #1-2. 틀리면, flash 메세지로 가입된 이메일입니다. redirect_to :back
  end
end
