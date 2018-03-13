require('minitest/autorun')
require_relative('../codeclan_student.rb')

class TestStudent < MiniTest::Test

  def test_name_getter
    student = Student.new("Alex", 20)
    assert_equal("Alex", student.get_name)
  end

  def test_cohort_getter
    student = Student.new("Alex", 20)
    assert_equal(20, student.get_cohort)
  end

  def test_name_setter
    student = Student.new("Alex", 20)
    assert_equal("Alex", student.get_name)
    student.set_name("Jim")
    assert_equal("Jim", student.get_name)
  end

  def test_cohort_setter
    student = Student.new("Alex", 20)
    assert_equal(20, student.get_cohort)
    student.set_cohort(30)
    assert_equal(30, student.get_cohort)
  end

  student = Student.new("Alex", 20)
  speech_bubble = student.talk()
  p speech_bubble

  student = Student.new("Alex", 20)
  speech_bubble = student.say_favourite_language("Java")
  p speech_bubble

end


 class TestTeam < MiniTest::Test

# Original getter and setter methods to start

  def test_name_getter
    team = Team.new("Chicago Bulls", ["Michael Jordan"], "Magic Johnson")
    assert_equal("Chicago Bulls", team.get_name)
  end

  def test_players_getter
    team = Team.new("Chicago Bulls", ["Michael Jordan"], "Magic Johnson")
    assert_equal(["Michael Jordan"], team.get_players)
  end

  def test_coach_getter
    team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson")
    assert_equal("Magic Johnson", team.get_coach)
  end

  def test_coach_name_setter
    team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson")
    assert_equal("Magic Johnson", team.get_coach)
    team.set_coach("Jose Mourinho")
    assert_equal("Jose Mourinho", team.get_coach)
  end

#  Getters and setters refactored to use attr_reader and attr_accessor

    def test_name_getter
      team = Team.new("Chicago Bulls", ["Michael Jordan"], "Magic Johnson")
      assert_equal("Chicago Bulls", team.name)
    end

    def test_players_getter
      team = Team.new("Chicago Bulls", ["Michael Jordan"], "Magic Johnson")
      assert_equal(["Michael Jordan"], team.players)
    end

    def test_coach_getter
      team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson")
      assert_equal("Magic Johnson", team.coach)
    end

    def test_coach_name_setter
      team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson")
      assert_equal("Magic Johnson", team.coach)
      team.coach = "Jose Mourinho"
      assert_equal("Jose Mourinho", team.coach)
    end

    def test_add_player
      team = Team.new("Chicago Bulls", ["Michael Jordan"], "Magic Johnson")
      team.add_player("Scottie Pippen")
      assert_equal(["Michael Jordan", "Scottie Pippen"], team.players)
    end

    def test_is_player_in_players
      player_array = ["Michael Jordan", "Scottie Pippen"]
      team = Team.new("Chicago Bulls", player_array, "Magic Johnson")
      assert_equal(true,team.is_player_in_players("Michael Jordan"))
      assert_equal(false,team.is_player_in_players("Larry Bird"))
    end

    def test_points_getter
      team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson", 0)
      assert_equal(0, team.points)
    end

    def test_update_points
      team = Team.new("Chicago Bulls", ["Michael Jordan"],"Magic Johnson", 0)
      team.update_points("Won")
      assert_equal(1, team.points)
      #  team.update_points("Lost")
      #  assert_equal(0, team.points)
    end

  end

# Library Class Testing

class TestLibrary < MiniTest::Test

def setup
  @books = [
    @book1 =   {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    },
    @book2 =   {
      title: "the_hobbit",
      rental_details: {
        student_name: "Dave",
        date: "01/12/17"
      }
    }
  ]

  @books_plus_one = [
    @book1,
    @book2,
    @book3 =   {
      title: "middlemarch",
      rental_details: {
        student_name: "",
        date: ""
      }
    }
  ]

  @rental_1 = @book1[:rental_details]
  @rental_2 = @book2[:rental_details]

end

  def test_book_getter
    library = Library.new(@books)
    assert_equal(@book1, library.get_book(0))
    assert_equal(@book2, library.get_book(1))
  end

  def test_return_book
    library = Library.new(@books)
    assert_equal(@book1, library.return_book("lord_of_the_rings"))
    assert_equal(@book2, library.return_book("the_hobbit"))
  end

  def test_return_rental_details
    library = Library.new(@books)
    assert_equal(@rental_1, library.return_rental_details("lord_of_the_rings"))
    assert_equal(@rental_2, library.return_rental_details("the_hobbit"))
  end

  def test_add_book
    library = Library.new(@books)
    assert_equal(@books_plus_one, library.add_book("middlemarch"))
  end

end
