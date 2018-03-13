class Student

  attr_accessor :name, :cohort

  def initialize(input_name, input_cohort)
    @name = input_name
    @cohort = input_cohort
  end

  def get_name
    return @name
  end

  def get_cohort
    return @cohort
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_cohort(new_cohort)
    @cohort = new_cohort
  end

  def talk
    return "I can talk! Why isn't my code compiling? Ah, another typo..."
  end

  def say_favourite_language(favourite_language)
    return "My favourite programming language is #{favourite_language}!"
  end

end

class Team

  attr_accessor :name, :players, :coach, :points

  def initialize(name, players, coach, points = 0)
    @name = name
    @players = players
    @coach = coach
    @points = points
  end

  def get_name
    return @name
  end

  def get_players
    return @players
  end

  def get_coach
    return @coach
  end

  def set_coach(new_coach)
    @coach = new_coach
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def is_player_in_players(player_name_to_check)
    return @players.include?(player_name_to_check)
  end

  def update_points(last_game_win_status)
    if last_game_win_status == "Won"
      @points += 1
    end
  end

end


class Library

  def initialize(books)
    @books = books
  end

  def get_book(index)
    return @books[index]
  end

  def return_book(book_title)
    for book in @books
      if book[:title] == book_title
        return book
      end
    end
    return nil
  end

  def return_rental_details(book_title)
    for book in @books
      if book[:title] == book_title
        return book[:rental_details]
      end
    end
    return nil
  end

  def add_book(new_title)
    book_to_be_added = {
      title: new_title,
      rental_details: {
        student_name: "",
        date: ""
      }
    }
    @books.push(book_to_be_added)
  end

end
