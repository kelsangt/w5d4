# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many :enrollments,
        class_name: :Enrollment,
        foreign_key: :id

    has_many :enrolled_students,
        class_name: :User,
        foreign_key: :id

    has_many :prerequisites,
        class_name: :Course,
        primary_key: :id,
        foreign_key: :prereq_id

    belongs_to :prerequisite,
        class_name: :Course,
        primary_key: :id,
        foreign_key: :prereq_id,
        optional: true

    # has_many :instructors,
    #     class_name: :Course,
    #     primary_key: :id,
    #     foreign_key: :instructor_id
    
    belongs_to :instructor,
        class_name: :User,
        primary_key: :id,
        foreign_key: :instructor_id,
        optional: true

end
