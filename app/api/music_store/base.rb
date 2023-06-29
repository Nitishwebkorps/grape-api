module MusicStore
  class Base < Grape::API
    mount MusicStore::V1::Students
    mount MusicStore::V1::Courses
  end
end

