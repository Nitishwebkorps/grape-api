module MusicStore
  class Base < Grape::API
    mount MusicStore::V1::Students
  end
end

