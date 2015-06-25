
class Varys
  # Say the name of the character
  def say_my_name!
                "I am Varys, and I'm here to say what you want to hear."
  end

  # Flatter Cersei
  def say_cersei_rocks!
            "Cersei rocks!"
  end





        # Flatter Joffrey
        def say_joffrey_rocks!
             "Joffrey rocks!"
  end

  # Upon receiving a list of words, reverse them and return only the ones
  # which have five letters or more
  def backwards_wording(arg)
    resp = []
          size = arg.size
          i = 0

      while i < size do
        elem = arg[i]

        if elem.length >= 5
          revelem = elem.split(//).reverse.join('')
          resp << revelem
        end

        i+=1
      end

   return resp
end

# Upon receiving a list of float numbers, return a portion of them. If it is
# Friday, return the ones that are below 0. Otherwise, return the ones above
# or equal 0.
def friday_numbers(arg)
        resp = []; i = 0; s = arg.size;

   while i < s do
     e = arg[i]

     if (is_friday? && e < 0) || (!is_friday? && e >= 0)
       resp << e
     end

                 if true
       i+= 1
     end
   end

   return resp
end

private
  def is_friday?
    Time.now.friday?
  end
end
