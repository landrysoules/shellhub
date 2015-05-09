[![Build Status](https://semaphoreci.com/api/v1/projects/ffe46dce-3a53-4a4a-bbda-b33d7ba4c3ea/420135/badge.svg)](https://semaphoreci.com/landry/shellhub)      

# Code snippet aplikacija

## Ukratko

Cilj ja da se napravi mala Rails aplikacija u kojoj registrovani korisnici mogu da postavljaju svoje i izvrsavaju snipete koda koji sadrže Linux komande. Snipeti su javni i mogu da ih vide i neulogovani posetioci.

## Funkcionalnost

### Korisnici

Aplikacija treba da omogući korisnicima da se registruju i uloguju sa emailom i šifrom. Pored toga korisnik treba da ima username. Nije potreban email confirmation. Koristi Devise gem. 

### Kreiranje snippet-a

Svaki ulogovani korisnik moze da kreira code snippet-e i da edituje svoje snipete.

Snipeti imaju:

- naziv
- content
- execution output (snimati output najsvežijeg izvršavanja)

Izvršavanje snipeta i prikaz output-a izvršavanja korisniku treba da bude ajaxifikovano.

Primer snipeta:

ls -lah ~
cat file.txt
echo “Hello world”

### Izvrsavanje snipeta

Komande iz snipeta treba da se izvršava druga aplikacija koja komande prima preko JSON API-ja. Za ovu aplikaciju koristiti Sinatra framework (http://www.sinatrarb.com).

## Napomene

U kodu, komentarima, commit porukama itd koristi isključivo engleski jezik.

Kod treba čuvati u open source GitHub repozitorijumima. Malim te pošalji nam linkove do repozitorijuma kada kreneš sa radom.

Aplikacija treba da koristi Ruby 2, Rails 4, jQuery, AngularJS ili neku treću JS biblioteku i PostgreSQL.

Koristi Twitter Bootstrap i aplikaciju deploy-uj na Heroku.

Aplikaciju treba pokriti Cucumber scenarijima i RSpec testovima.

Glavne reference su:
http://api.rubyonrails.org
http://guides.rubyonrails.org
http://www.sinatrarb.com

Pored toga korisno je pogledati nešto sa http://railscasts.com.
