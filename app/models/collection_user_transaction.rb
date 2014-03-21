class CollectionUserTransaction < ActiveRecord::Base

  def self.save_user_and_collection(params)

   u_hash = params[:users]
   c_hash = params[:collection].permit(:name)

   if (!u_hash || !c_hash)
     return "need user and collection"
   end

    c = Collection.new(c_hash)


   transaction do
     res = self.save_users(params)
     if (res.instance_of?(String))
       return res
     else
       if (c.save!)
         res.each do |u|  # iterate through users creating connections
           cx = CollectionConnection.new
           cx.user_id = u.id
           cx.collection = c
           if (cx.save!)

           else
             return save_failure "collection xref"
           end
         end
         return c
       else
         return save_failure("collection")
       end
     end
   end

  end

  def self.save_users(params)
    users = params[:users]
    user_arr = []
    users.each do |user|
      u = User.find_by_email(user[:email])
      if(!u)
        u = User.new(user)
        if( u.save!)
        else
          return u.errors.full_messages.to_sentence
        end
      end
      user_arr.push u
    end
    return user_arr
  end

  def self.save_failure(type)
    return "error saving #{type}"
  end
end