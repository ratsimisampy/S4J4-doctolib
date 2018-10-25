# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


def seed_patient
    10.times do
        @patient = Patient.create!(first_name: Faker::Company.name, last_name: Faker::Name.name )
    end
end

def seed_doctor
    5.times do
        @doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: "Generaliste", postal_code: "92500" )
    end
end

def seed_appointment
    15.times do
        @appointment = Appointment.create!(appointment_date: Faker::Time.between(DateTime.now - 1, DateTime.now), doctor_id: Faker::Number.between(Doctor.first.id, Doctor.last.id), patient_id: Faker::Number.between(Patient.first.id, Patient.last.id))
       end
end

seed_patient
seed_doctor
seed_appointment