class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

            #Se usuario for destruido, as tarefas relacionadas tambem serao
  has_many :tasks, dependent: :destroy
end
