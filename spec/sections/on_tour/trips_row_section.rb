module OnTour
  class TripsRowSection < SitePrism::Section
    element :season_cell, :xpath, 'td[1]'
    element :date_cell, :xpath, 'td[2]'
    element :rival_cell, :xpath, 'td[3]'
    element :score_cell, :xpath, 'td[4]'
    element :number_cell, :xpath, 'td[5]'
    element :comment_cell, :xpath, 'td[6]'
    element :article_cell, :xpath, 'td[7]'
    element :presence_cell, :xpath, 'td[8]'
  end
end
