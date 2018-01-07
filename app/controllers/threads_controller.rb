class ThreadsController < ApplicationController

  def index
    all_threads = BoardThread.all
    render json: all_threads.as_json
  end

  def create
    thread = BoardThread.new({
      title: params[:title]
      })
  end

  def destroy
    thread_id = params[:id]
    thread = BoardThread.find_by(id: thread_id)
    thread.destroy
  end

  def update

  end


end
