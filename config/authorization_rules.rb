authorization do
  role :guest do
  end
  
  role :ong do
    includes :guest
    has_permission_on :initiatives, to: [:manage]
  end
  
  role :admin do
    includes :ong
    has_permission_on :users, to: [:manage]
  end
end

privileges do
  privilege :manage, includes: [:read, :new, :create, :join, :edit, :update, :destroy]
  privilege :read, includes: [:index, :show]
end
