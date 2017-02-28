require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
  # return the second element in the 4th of July array
  holiday_hash.each do |season, celebrations_hash|
    celebrations_hash.each do | celebration_name, data|
      if celebration_name == :fourth_of_july
        return data[1]
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, celebrations_hash|
    celebrations_hash.each do |celebration_name, data|
      if celebration_name == :christmas || celebration_name == :new_years
        data << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, celebrations_hash|
    celebrations_hash.each do |celebration_name, data|
      if celebration_name == :memorial_day
        data << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

      holiday_hash[season][holiday_name] = supply_array
      holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies_arr = []
  holiday_hash.each do |season_name, holidays_hash|
    if season_name == :winter
      holidays_hash.each do |holiday_name, supplies|
        supplies_arr << supplies
      end
    end
  end
  supplies_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays_hash|
    # Capilize Season and manually convert to string. Alternative conversion method is #to_s
    norm_season = ""
    counter = 0
    while counter < season.length
      norm_season << season[counter]
      counter +=1
    end
    # Print out normalized season name
    puts norm_season.capitalize + ":"
    # Iterate through the holidays hash and format elements accordingly
    holidays_hash.each do |holiday_name, supplies|
      # capitalize each word
      norm_holiday_name = holiday_name.to_s.gsub('_', ' ').split(" ")
      norm_holiday_name.map do |x|
        x.capitalize!
      end
      final_holiday_name = norm_holiday_name.join(" ")
      # Print out the requested phrase
       puts "  " + "#{final_holiday_name}: " + "#{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  final_arr = []
  holiday_hash.each do |season, holidays_hash|
    holidays_hash.each do |holiday, supplies|
      if holiday_hash[season].values.flatten.include?("BBQ")
        final_arr << holiday
      end
    end
  end
  final_arr
end
