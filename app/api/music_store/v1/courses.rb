module MusicStore
  module V1
    class Courses < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      helpers do
        
        def courses_params
          declared(params).slice(:course_name, :number, :no_of_subject, :percentage)
        end
      end

      resource :students do

        desc 'create courses for specififc students'
        route_param :id do
          resource :courses do
            params do
              requires :course_name, type: String
              requires :number, type: Float
              requires :no_of_subject, type: Integer
              requires :percentage, type: Float
              requires :student_id, type: Integer
            end
            post do
              student = Student.find(params[:id]).courses.create(courses_params)
              if student.save
                present student
                { message: 'Course has been created successfully' }
              else
                { message: 'creation failed' }
              end
            end

          end
        end

        desc 'Return courses for specififc students'
        route_param :id do
          resource :courses do
            get do
              student = Student.find(params[:id])
              if student.courses.present?
                present student.courses.order(created_at: :desc)
                { message: 'Courses details are given below' }
              else
                { message: 'Not found any courses' }
              end
            end
          end
        end
        
      end
    end
  end
end