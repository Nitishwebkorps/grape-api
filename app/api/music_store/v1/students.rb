module MusicStore
  module V1
    class Students < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      helpers do
        
        def student_params
          declared(params).slice(:name, :city, :state)
        end

        def selected_attr(students)
          students.map do |student|
            {
              student_id: student.id,
              student_name: student.name
            }
          end
        end
        
      end

      resource :students do
        desc 'Return list of students'
        get do
          students = Student.all
          present selected_attr(students)
        end

        desc 'create a new student'
        params do
          requires :name, type: String
          requires :city, type: String
          requires :state, type: String
        end
        post do
          Student.create!(student_params)
        end
      
        desc 'Return a specific student'
        route_param :id do
          get do
            student = Student.find(params[:id])
            present student
          end
        end

        desc 'Delete a specific student'
        route_param :id do
          delete do
            student = Student.find(params[:id])
            if student.destroy!
              { message: 'Recent Student detail destroyed successfully' }
            else
              { message: 'destroyed failed' }
            end
          end
        end
      
        desc 'Update a specific student'
        route_param :id do
          params do
            optional :name, type: String
            optional :city, type: String
            optional :state, type: String
          end
          put do
            student = Student.find(params[:id])
            if student.update!(student_params)
              { message: 'Student detail updated successfully' }
            else
              { message: 'Update failed' }
            end
          end
        end

      end

        desc 'greeting'
        get 'hello' do
          { message: 'Hello, world!' }
        end

    end
  end
end


