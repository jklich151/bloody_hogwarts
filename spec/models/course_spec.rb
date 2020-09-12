require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe '#student_count' do
    it "can tell me how many students it has" do
      student_1 = Student.create!(name: "Casseopia Black",
                                age: 14,
                                house: "Slytherin")
      course_1 = Course.create!(name: "Defense against the Dark Arts")
      StudentCourse.create(student_id: student_1.id, course_id: course_1.id)

      expect(course_1.student_count).to eq(1)
    end
  end
end
