require 'rails_helper'

RSpec.describe "Courses Index Page" do
  it "can see all courses and number of students enrolled" do
    student_1 = Student.create!(name: "Casseopia Black",
                              age: 14,
                              house: "Slytherin")
    student_2 = Student.create!(name: "Harry Potter",
                              age: 14,
                              house: "Slytherin")
    course_1 = Course.create!(name: "Defense against the Dark Arts")
    course_2 = Course.create!(name: "Herbology")
    course_3 = Course.create!(name: "Potions")
    StudentCourse.create(student_id: student_1.id, course_id: course_1.id)
    StudentCourse.create(student_id: student_2.id, course_id: course_1.id)
    StudentCourse.create(student_id: student_2.id, course_id: course_2.id)

    visit '/courses'

    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
    expect(page).to have_content(course_3.name)
    expect(page).to have_content("Students: 1")
    expect(page).to have_content("Students: 2")
    expect(page).to have_content("Students: 0")
  end
end
