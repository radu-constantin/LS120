class Student
  attr_accessor :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    grade > student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('Joe', 10)
mike = Student.new('Mike', 8)

p joe.better_grade_than?(mike)
