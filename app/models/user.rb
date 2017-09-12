class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attendances
  has_many :leaves

  has_many :manager_roles, class_name:"Role",
                           foreign_key: "employee_id",
                           dependent:   :destroy
  has_many :managers, through: :manager_roles

  has_many :employee_roles, class_name:"Role",
                            foreign_key: "manager_id",
                            dependent:   :destroy
  has_many :employees, through: :employee_roles

  has_many :issuances
  has_many :equipments, through: :issuances

  def manager?
  	employees.present?
  end
  def employee?
    managers.present?
  end
  def full_name
    "#{first_name} #{last_name}"
  end
end
