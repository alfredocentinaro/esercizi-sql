# Traccia Esercizio
La regione Abruzzo, nell'ottica di razionalizzare la spesa sanitaria, ha promosso la realizzazione di un sistema informativo per poter analizzare i dati derivanti dai ricoveri effettuati nelle varie strutture ospedaliere (pubbliche e/o private) dislocate sul territorio. 

Ciascuna struttura appartiene ad una delle quattro AUSL in cui la regione è suddivisa (AUSL n.01-L'Aquila / AUSL n.02-Chieti, Lanciano, Vasto / AUSL n.03-Pescara / AUSL n.04-Teramo).

Di ogni struttura ospedaliera occorre memorizzare il codice, il nome, l'indirizzo, la città, la provincia, la AUSL di appartenenza, il tipo di struttura (se pubblica o privata). Di ciascun ricovero effettuato dalle varie strutture devono essere memorizzati: la data di inizio, la data di fine, la causa del ricovero. Deve, inoltre, contenere informazioni riguardo all'unità operativa in cui è avvenuta la degenza, al paziente coinvolto e agli eventuali interventi che sono stati effettuati.

Le unità operative sono classificate tramite un codice ed una descrizione (ad es. Medicina, Diabetologia, Ostetricia e Ginecologia, Ematologia, Terapia intensiva, Urologia ecc.). I pazienti sono identificati dal codice fiscale, cognome, nome, data di nascita, genere (M/F), indirizzo, città, provincia di residenza, recapito telefonico. Gli interventi sono classificati con codice, descrizione e costo.

# Query
* Fornire l'elenco dei ricoveri in cui sono stati effettuati gli interventi di costo superiore a euro 2000.00
* Fornire l'elenco delle strutture ospedaliere private in ordine di provincia di appartenenza e, a parità di provincia, in ordine alfabetico di denominazione
* Visualizzare un elenco delle unità operative per cui risultino più di 100 ricoveri
* Fornire il numero di pazienti ricoverati causa COVID a partire da marzo 2

---

![test.imc](https://www.alfredocentinaro.it/wp-content/uploads/2022/07/prova4.drawio1.svg "test.imc")
