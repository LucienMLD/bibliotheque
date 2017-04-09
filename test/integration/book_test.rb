require 'test_helper'

class BookTest < ActionDispatch::IntegrationTest
  test "lets create a new book" do
    visit "/books/new"

    fill_in "book_title", with: "Cap sur la gloire"
    fill_in "book_author", with: "Alexander Kent"
    fill_in "book_resume", with: "Janvier 1782. Richard Bolitho reçoit l'ordre de conduire la Phalarope, frégate du roi d'Angleterre, dans la mer des Caraïbes, où la flotte française de l'amiral de Grasse prête main-forte aux corsaires de la révolution américaine. Ce devrait être un moment de fierté pour un si jeune capitaine, si l'équipage du navire, mené avec cruauté sous un précédent commandement, n'était au bord de la mutinerie..."
    click_button 'Valider'

    assert_equal 200, page.status_code
    assert page.has_content?("Cap sur la gloire")

  end
end
