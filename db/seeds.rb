# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stream_names = [
  'All',
  'Business Administration',
  'Architecture',
  'Chemical Engineering',
  'Civil Engineering',
  'Electrical Engineering',
  'Mechanical Engineering',
  'Instrumentation',
  'Agronomy',
  'Industrial Engineering',
  'Draughtsman / CAD Operator',
  'Quantity Surveying',
  'Survey Engineering',
  'Geology',
  'Economy'
]

positions = [
  "Manager",
  "Project Manager / Team Leader",
  "Designer / Design Engineer",
  "Quantity Surveyor",
  "Land Surveyor",
  "CAD Technician / Draftsman",
  "Administrative Assistant / Document Controller",
  "Resident Engineer / Construction Manager",
  "Civil Engineer / Assistant Resident Engineer",
  "Materials Inspector",
  "Site Inspector",
  "Material Engineer / Quality Controller/QA/QC",
  "Planning Engineer",
  "HSE Specialist",
  "Other"
]

stream_names.each do |name|
  positions.each do |position|
    Record.find_or_create_by(item: name, position_record: position)
  end
end

roles = [
"HR",
"Tech Manager",
"Business Development Manager"
]

roles.each do |role|
  Role.find_or_create_by(role_name: role)
end

