class PostsController < ApplicationController
  #action 기능
  #해달 컨트롤러 기능이 실행하기전 권한검사(로그인)를 하게 하는것 인덱스 페이지는 예외
  before_action :authorize, except: [:index]
  def index
    @posts=Post.all
  end

  def new

  end

  def create
    post=Post.create(user_id: current_user.id, title: params[:title], content: params[:content])
    flash[:notice]="글을 작성했습니다."
    redirect_to '/'
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    post=Post.find(params[:id])
    post.update(username: current_user.id, title: params[:title], content: params[:content])
    flash[:notice]="글을 수정했습니다."
    redirect_to '/'
  end

  def destroy
    Post.find(params[:id]).delete
    flash[:alert]="글을 삭제했습니다."
    redirect_to '/'
  end
end
