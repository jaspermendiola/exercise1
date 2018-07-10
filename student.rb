#!/usr/bin/ruby -w

@array_of_students = Hash.new {|hash, key| hash[key] = []}
@student_id = 0

# Define Student Class
class Student

    attr_accessor :stud_id, :first_name, :last_name, :age

    def toggle_questions
        
        print "Enter First Name: "
        @first_name = gets.chomp


        print "Enter Last Name: "
        @last_name = gets.chomp


        print "Enter Age: "
        @age = gets.chomp
    end 
end

def decision_main_menu
    puts
    puts "*** WELCOME TO THE MOST AWESOME ENROLLMENT SYSTEM IN THE WORLD!! ***"
    puts
    puts
    print "Now what do you want to do? Enroll[1] or View Student Info[2]? "
    choice = gets.chomp

    decision_enroll_view(choice)
end

def decision_enroll_view(choice)
     
    if choice == "1"
        decision_enroll
    elsif choice == "2"
        decision_view
    end
end

def decision_enroll
    @student_id += 1
    student = Student.new
    student.toggle_questions

    @array_of_students[@student_id] << @student_id

    @array_of_students[@student_id] << student.first_name

    @array_of_students[@student_id] << student.last_name

    @array_of_students[@student_id] << student.age

    puts "The Student has been successfully added! 
    \n Student ID: " + @student_id.to_s + "
    \n First Name: " + @array_of_students[@student_id][1] + "
    \n Last Name: " + @array_of_students[@student_id][2] + "
    \n Age: " + @array_of_students[@student_id][3]
    puts
    puts

    print "Enroll another student? [Y/N]"
    choice = gets.chomp

    if choice == "Y" or choice == "y"
        decision_enroll
    elsif choice == "N" or choice == "n"
        decision_main_menu
    end
end

def decision_view

    keys = @array_of_students.keys


    @does_exist = false

    print "Enter Student ID: "
    choice = gets.chomp

    keys.each { |x|
        
        if x.to_s == choice
            @does_exist = true
        end
    }

    if @does_exist == true
        puts "First Name: " + @array_of_students[choice.to_i][1]
        puts "Last Name: " + @array_of_students[choice.to_i][2]
        puts "Age: " + @array_of_students[choice.to_i][3]

        decision_view_try_again("View another student info? [Y/N]")
    else
        decision_view_try_again("The Student ID does not exist yet. Try again? [Y/N]")
    end
end

def decision_view_try_again(message)
    print message
    choice = gets.chomp

        if choice == "Y" or choice == "y"
            decision_view
        elsif choice == "N" or choice == "n"
            decision_main_menu
        end
end


decision_main_menu