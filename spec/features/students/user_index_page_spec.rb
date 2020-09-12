require 'rails_helper'

RSpec.describe "Student index page" do
  it "Can see a list of student information" do
    student_1 = Student.create!(name: "Casseopia Black",
                              age: 14,
                              house: "Slytherin")
    student_2 = Student.create!(name: "Harry Potter",
                              age: 14,
                              house: "Slytherin")
    visit "/students"

    expect(current_path).to eq("/students")
    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.age)
    expect(page).to have_content(student_1.house)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_2.age)
    expect(page).to have_content(student_2.house)
  end

  it "can see average age of students" do
    student_1 = Student.create!(name: "Casseopia Black",
                              age: 16,
                              house: "Slytherin")
    student_2 = Student.create!(name: "Harry Potter",
                              age: 14,
                              house: "Slytherin")
    visit "/students"

    expect(page).to have_content("Average Age: 15")
  end
end
