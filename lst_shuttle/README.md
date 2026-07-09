# lst_shuttle - Los Santos Taxi Shuttle

Spawnname:

```text
lst_shuttle
```

## Installation

1. Ordner `lst_shuttle` nach `resources/[local]/lst_shuttle` kopieren.
2. In die `server.cfg` eintragen:

```cfg
ensure lst_shuttle
```

3. Server starten oder Resource neustarten:

```text
restart lst_shuttle
```

4. Testen:

```text
/spawncar lst_shuttle
```

## Hinweis

Das Fahrzeug basiert auf dem hochgeladenen `rentalbus`-Modell und wurde als eigenes Add-on vorbereitet.
Falls der Bus spawnt, aber Sitze/Türen komisch sind, müssen wir als nächstes das passende `vehiclelayouts.meta` aus dem OIV-Paket ergänzen.
