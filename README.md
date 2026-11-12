# My Workout — wersja startowa

Aplikacja internetowa PWA do własnych planów treningowych. Interfejs jest po polsku i przystosowany do telefonu.

## Co działa
- tworzenie, zmiana nazw i usuwanie treningów;
- dodawanie, edycja, usuwanie i zmiana kolejności ćwiczeń;
- obciążenie, powtórzenia, serie i komentarz przy każdym ćwiczeniu;
- łączenie zaznaczonych ćwiczeń w superserie i rozdzielanie ich;
- zdjęcie ćwiczenia przez podanie adresu obrazu;
- zapis jednego aktualnego stanu planów w Supabase (bez historii i statystyk);
- logowanie e-mail/hasło, osobne dane dla każdego konta;
- PWA — można dodać stronę do ekranu początkowego iPhone'a.

## Ważne
To jest przygotowany pakiet aplikacji, ale nie jest jeszcze opublikowany w internecie ani połączony z Twoją bazą. Do synchronizacji online potrzebujesz własnego bezpłatnego projektu Supabase i hostingu HTTPS. Nie wklejaj klucza `service_role` — aplikacja używa wyłącznie klucza `anon`/publishable.

## Konfiguracja bazy Supabase
1. Wejdź na https://supabase.com i utwórz bezpłatny projekt.
2. Otwórz **SQL Editor → New query**.
3. Wklej całą zawartość pliku `supabase.sql` i uruchom.
4. W Supabase otwórz **Project Settings → API** (lub **Data API**).
5. Skopiuj **Project URL** oraz klucz **anon/public** (w nowych projektach może nazywać się publishable key).
6. Otwórz `index.html` w edytorze tekstu. Znajdź:
   - `WSTAW_URL_PROJEKTU_SUPABASE`
   - `WSTAW_KLUCZ_ANON_SUPABASE`
   i zastąp je swoimi wartościami. Nie udostępniaj tych danych publicznie poza kodem strony; bezpieczeństwo danych zapewniają reguły RLS z `supabase.sql`.
7. W Supabase → **Authentication → URL Configuration** ustaw adres opublikowanej strony jako Site URL. Na początek można wyłączyć potwierdzanie e-maili w **Authentication → Providers → Email**, żeby konto testowe logowało się od razu. Jeśli pozostawisz potwierdzanie, kliknij link z poczty.

## Publikacja bez opłat — GitHub Pages
1. Utwórz konto na https://github.com (jeśli go nie masz).
2. Utwórz nowe publiczne repozytorium, np. `my-workout`.
3. Prześlij do repozytorium pliki z tego folderu: `index.html`, `manifest.json`, `sw.js`.
4. W repozytorium otwórz **Settings → Pages**.
5. W sekcji Build and deployment wybierz **Deploy from a branch**, branch `main`, folder `/ (root)`, zapisz.
6. Po publikacji GitHub pokaże adres strony w formacie `https://TWOJ_LOGIN.github.io/my-workout/`.
7. Dodaj ten adres do **Authentication → URL Configuration → Redirect URLs** w Supabase.

Uwaga: publiczne repozytorium oznacza, że kod strony i klucz anon są publicznie widoczne. To normalne dla aplikacji Supabase korzystających z anon/publishable key, pod warunkiem poprawnie skonfigurowanych polityk RLS. Nigdy nie umieszczaj w kodzie klucza `service_role`.

## Dodanie do iPhone'a
1. Otwórz opublikowany adres w Safari.
2. Wybierz przycisk udostępniania.
3. Wybierz **Dodaj do ekranu początkowego**.
4. Uruchamiaj aplikację z nowej ikony.

## Zdjęcia ćwiczeń
W edycji ćwiczenia wklej bezpośredni adres obrazu HTTPS. Obraz musi być dostępny publicznie. Jeśli nie masz adresu, zostaw pole puste — karta pokaże neutralny symbol. Używaj zdjęć, do których masz prawo; nie kopiuj losowych zdjęć z wyszukiwarki bez sprawdzenia licencji.

## Ograniczenia pierwszej wersji
- Wpisywane obciążenie/powtórzenia/serie są wartościami planu, nie dziennikiem wykonania.
- Nie ma historii, wykresów, statystyk ani archiwum.
- Superseria łączy zaznaczone ćwiczenia; ponowne zaznaczenie całej tej samej grupy rozdziela ją.
- To pierwsza wersja. Zapis jest automatyczny po zmianie, ale warto sprawdzić status „Zapisano online” przed zamknięciem strony.
