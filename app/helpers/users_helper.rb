module UsersHelper
  def index
  @total_users = User.count
    end
end
