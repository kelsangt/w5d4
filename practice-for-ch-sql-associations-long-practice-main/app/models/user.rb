# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    belongs_to(
        :enrolled_courses,
        class_name: :Course,
        foreign_key: :id
    )
    has_many(
        :enrollments,
        class_name: :Enrollment,
        foreign_key: :id
    )
end