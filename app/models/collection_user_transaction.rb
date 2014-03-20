class CollectionUserTransaction < ActiveRecord::Base

  def self.save_user_and_collection(params)

   u_hash = params[:user].permit(:id,:email)
   c_hash = params[:collection].permit(:name)

   if (!u_hash || !c_hash)
     return "need user and collection"
   end

    u = User.new(u_hash)
    c = Collection.new(c_hash)
    cx = CollectionConnection.new

   transaction do
     if u.save!
       if (c.save!)
         cx.user = u
         cx.collection = c
         if(cx.save!)
           return c
         else
           return save_failure "collection xref"
         end
       else
         return save_failure("collection")
       end
     else
       return save_failure("user")
     end
   end

  end

  def self.save_failure(type)
    p "could not save #{type}"
    return "error saving #{type}"
  end
end