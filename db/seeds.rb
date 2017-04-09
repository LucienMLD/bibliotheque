Booking.destroy_all
Book.destroy_all
User.destroy_all

User.create!(first_name: "Lucien", last_name: "Mollard", email: "mollard.lucien@gmail.com")
User.create!(first_name: "David", last_name: "Heinemeier Hansson", email: "david@rails.com")
p "Users seeded !"

book1 = Book.create!(title: "Le feu de l'action", author: "Alexandre Kent", resume: "En 1774, Richard, devenu lieutenant, embarque sur la Destinée à Plymouth. En mer, ils s'approprient l'Héloïse. Ils arrivent à Rio. Alors qu'ils repartent sur l'Héloïse, elle est coulée par le Rosario qu'ils conquièrent et où l'ambassadeur Egmont et sa femme Aurore embarquent. Richard s'en éprend. Ils accostent sur une ile pour y prendre de l'eau, Richard est blessé et Aurore le soigne. Ils accostent à St Christophe et les Egmont les quittent. Ils vont à l'ile Fougeaux et des espagnols les canonnent. Lors d'une deuxième bataille, ils coulent le navire ennemi. Richard rentre chez lui au bout d'un an et découvre que sa mère est morte, et sa nouvelle affectation sur le Trojan.")
Book.create!(title: "Central Park", author: "Guillaume Musso", resume: "Alice et Gabriel n’ont aucun souvenir de la nuit dernière…
  … pourtant, ils ne sont pas près de l’oublier.
  New York, huit heures du matin.
  Alice, jeune flic parisienne, et Gabriel, pianiste de jazz américain, se réveillent menottés l’un à l’autre sur un banc de Central Park. Ils ne se connaissent pas et n’ont aucun souvenir de leur rencontre.
  La veille au soir, Alice faisait la fête avec ses copines sur les Champs-Élysées tandis que Gabriel jouait du piano dans un club de Dublin.
  Impossible ? Et pourtant…")
Book.create!(title: "Nymphéas noirs", author: "Michel Bussi", resume: "Tout n'est qu'illusion, surtout quand un jeu de miroirs multiplie les indices et brouille les pistes. Pourtant les meurtres qui troublent la quiétude de Giverny, le village cher à Claude Monet, sont bien réels.
Au coeur de l'intrigue, trois femmes: une fillette de onze ans douée pour la peinture, une institutrice redoutablement séduisante et une vieille femme aux yeux de hibou qui voit et sait tout. Et puis, bien sûr, une passion dévastatrice.")
Book.create!(title: "4 Saisons", author: "Davy Artero", resume: "Lorsque l’épouvantable se mêle au quotidien, lorsque les évènements les plus monstrueux surgissent sans crier gare, au fil du temps qui passe, et des changements climatiques. Un récit par saison, intrigant, déran­geant… AUTOMNE : Louis est un homme comblé. Il mène une vie simple, agréable, comme il l’a toujours souhaité. Tout serait parfait s’il n’y avait ces évènements étranges et ces hallucinations horrifiques qui arrivent sans prévenir et qui n’ont aucun sens. Pourquoi ces visions horribles viennent gâcher son existence ? Et si ce n’était que le début d’un long cauchemar qui va anéantir toute sa vie ? HIVER : David n’aurait jamais dû se lever ce matin-là. Braver la neige pour ne pas perdre une journée de travail était une mauvaise idée. Les quelques vêtements qu’il porte ne le réchauffent pas et ses yeux lui font mal avec le faible éclairage entre ces quatre murs. Mais pourquoi a-t-il accepté l’aide de ce forestier lorsqu’il s’est retrouvé accidenté ?PRINTEMPS : Chacun de nous s’est dit au moins une fois dans sa vie qu’il aurait dû prendre son destin en main et faire vraiment ce qui le passionne. Cette personne-là a eu le courage de regarder sa vie en face et a décidé qu’il était temps de la changer, de faire ce qu’elle aurait dû faire depuis longtemps : écrire un roman. Le problème est que ce n’est pas si facile et parfois le destin fait tout son possible pour contrer ses envies. ETE : Henry est allongé, yeux et bouche fermés. Impossible de bouger. Où est-il ? Enfermé dans un tiroir de morgue ? En salle d’opération ? Il ne se souvient de rien. Il tente de se remémorer sa dernière journée de consultations. Elle lui semblait normale. Et pourquoi un des cas qu’il a rencontré lui paraît important ? Se­rait-ce la réponse à son état ? Des récits qui conduiront le lecteur dans une sombre et terrifiante machination…" )
p "Books seeded !"

Booking.create!(user_id: User.first.id, book_id: book1.id)
book1.borrowed!
p "Booking seeded !"
