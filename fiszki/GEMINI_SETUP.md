# Podłączenie tłumacza Gemini

Aplikacja korzysta z modelu `gemini-3.1-flash-lite`. Klucz API nie trafia do aplikacji ani do repozytorium.

## 1. Utwórz klucz Google
1. Otwórz https://aistudio.google.com/apikey
2. Zaloguj się i utwórz klucz API.
3. Skopiuj go. Nie wklejaj go do aplikacji ani do GitHub.

## 2. Utwórz usługę pośredniczącą Cloudflare
1. Otwórz https://dash.cloudflare.com/ i zaloguj się lub utwórz bezpłatne konto.
2. Wejdź w **Workers & Pages** → **Create** → **Worker**.
3. Nadaj nazwę, np. `fiszki-gemini`, i utwórz usługę.
4. Otwórz edytor kodu Workera, usuń przykładowy kod i wklej całą zawartość pliku `gemini-worker.js` z tego katalogu.
5. Zapisz i wdroż usługę.
6. W ustawieniach Workera otwórz **Settings** → **Variables and Secrets** → **Add**.
7. Dodaj zmienną typu **Secret** o nazwie `GEMINI_API_KEY` i wklej klucz z Google AI Studio. Zapisz.
8. Wygeneruj własne długie, losowe hasło (co najmniej 24 znaki). Dodaj drugą zmienną typu **Secret** o nazwie `APP_ACCESS_TOKEN` i wklej to hasło. Zapisz. Nie używaj hasła z innych usług.
9. Skopiuj adres Workera, np. `https://fiszki-gemini.twoja-nazwa.workers.dev`.

## 3. Włącz Gemini w aplikacji
1. Otwórz aplikację Fiszki i przejdź do **Ustawienia**.
2. W polu **Adres usługi Gemini** wklej adres Workera.
3. W polu **Hasło dostępu do usługi** wklej dokładnie to samo hasło, które zapisałeś jako `APP_ACCESS_TOKEN` w Cloudflare.
4. Naciśnij **Zapisz adres Gemini**.

Od tej chwili nowe tłumaczenia będą korzystać z Gemini. Usunięcie adresu z ustawień przywraca LibreTranslate. Dotychczasowe fiszki i postęp pozostają bez zmian.

## Ważne
- Nie umieszczaj klucza Gemini w aplikacji, pliku HTML ani publicznym repozytorium.
- Bezpłatny plan Gemini ma limity użycia, które Google może zmieniać. W planie bezpłatnym treści przesyłane do Gemini mogą być wykorzystywane przez Google do ulepszania produktów. Sprawdź aktualne warunki przed wysyłaniem danych poufnych.
- Worker dopuszcza żądania z adresu aplikacji GitHub Pages, wymaga dodatkowego hasła dostępu i obsługuje wyłącznie tłumaczenie polski↔hiszpański. Hasło jest zapisane lokalnie w przeglądarce, a nie w publicznym repozytorium.
