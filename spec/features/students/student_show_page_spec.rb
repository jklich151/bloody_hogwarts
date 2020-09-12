require 'rails_helper'

RSpec.describe "Student show page" do
  it "can see a list of a students' courses" do
    student_1 = Student.create!(name: "Casseopia Black",
                              age: 14,
                              house: "Slytherin")
    student_2 = Student.create!(name: "Harry Potter",
                              age: 14,
                              house: "Slytherin")
    course_1 = student_1.courses.create!(name: "Defense against the Dark Arts")
    course_2 = student_1.courses.create!(name: "Herbology")
    course_3 = student_2.courses.create!(name: "Potions")

    visit "/students/#{student_1.id}"

    expect(current_path).to eq("/students/#{student_1.id}")
    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
    expect(page).to_not have_content(course_3.name)
  end
end
