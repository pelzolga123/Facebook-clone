module UsersHelper
    def friendship(user)
        Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    end
end
