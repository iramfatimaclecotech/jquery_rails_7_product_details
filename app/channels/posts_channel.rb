class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    post = Post.find(params[:id])
    stream_for post
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def speak
      ActionCable.server.broadcast 'post_channel', message: data['message']
  end




  def post_params
    params.require(:post).permit(:name)
  end
end
