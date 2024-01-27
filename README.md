Plik README.md w projekcie jest ważnym elementem dokumentacji, który pomaga użytkownikom zrozumieć, jak korzystać z projektu.

# Dekodowanie sygnału DTMF

## Spis treści 
- [Instalacja] (#instalacja)
- [Cel] (#cel)
- [Wprowadzenie] (#wprowadzenie)
- [Pierwszy etap] (#pierwszy etap)
- [Drugi etap] (#drugi etap)
- [Projekt] (#projekt)

## Instalacja
Aby zainstalować projekt musisz go pobrać, żeby podpatrzeć kod wystarczy otworzyć sam main.c, najlepiej jednak mieć pobrany program Code Composer Studio.

## Cel

Celem ćwiczenia „Analiza widma sygnału z graficzną wizualizacją” było przygotowanie i uruchomienie aplikacji w środowisku Code Composer Studio (CCS), której efektem było obliczanie widma sygnału z zastosowaniem metody okien czasowych, algorytmu FFT oraz z użyciem techniki uzupełniania zerami. Ćwiczenie kończyło się wyświetlaniem widma sygnału przy różnych założeniach szczegółowych, takich jak: typ okna czasowego, uzupełnianie zerami, skala liniowa lub logarytmiczna osi y, włączone lub wyłączone autoskalowanie osi y, skala unormowana osi x (numer próbki, numer prążka) lub skala jednostek bezwzględnym osi x (s, ms, Hz).

Celem ćwiczenia „Dekodowanie sygnału DTMF” jest dalsze przetwarzanie uzyskanego widma w celu uzyskania informacji szczegółowej dla danego zastosowania – w tym przypadku w celu wykrycia w sygnale prawidłowego sygnału DTMF i jego zdekodowania. Celem pracy samej aplikacji nie są więc wykresy obliczonego widma sygnału (są one jednak przydatne na etapie uruchamiania aplikacji), a jedynie kod znaku DTMF umieszczony w zmiennej typu char

## Wprowadzenie

Należy zwrócić uwagę na następujące kwestie szczegółowe- Sygnał DTMF (Dual Tone Multi-Frequency) jest sumą dwóch sinusoid – jednej z grupy Low Frequency, a drugiej z grupy High Frequency:

![image](https://github.com/Kanty20/Dekodowanie-sygna-u-DTMF/assets/62101090/5d675904-0d6d-4494-aa72-e9b582cc5f86)

W celu odsłuchania przykładowego sygnału dtmf, po wpisaniu w wyszukiwarce internetowej hasła „dtmf online generator” i wybraniu np. znalezionej strony internetowej https://onlinetonegenerator.com/dtmf.html, pojawi się możliwość generacji sygnału na głośniczku (w słuchawkach) przez wciśnięcie odpowiedniego przycisku na klawiaturze:

![image](https://github.com/Kanty20/Dekodowanie-sygna-u-DTMF/assets/62101090/064c5528-ff4c-4ebd-ab24-7778029dd1c2)

W systemie Android, do generacji sygnału dtmf można pobrać jedną z wielu darmowych aplikacji ze sklepu Play, np. „Simple DTMF”.Sygnał DTMF z wyjścia karty dźwiękowej komputera PC łączy się kablem z wtykami typu jack 3,5mm (są na wyposażeniu laboratorium, dostępne u prowadzącego) do wejścia przetwornika A/C na module BB AI. Należy przy tym koniecznie odłączyć od modułu kabel BNC łączący wejście modułu z używanym wcześniej generatorem. Generowany sygnał DTMF należy kontrolować na ekranie oscyloskopu w celu zapewnienia nieprzesterowania przetwornika A/C, którego zakres pracy wynosi ok. ± 1,5 V. Zaleca się nieprzekraczanie połowy zakresu pracy przetwornika A/C.

## Pierwszy etap

Pierwszy etap realizacji ćwiczenia „Dekodowanie sygnału DTMF” polega na testowaniu ośmiu punktów widma amplitudowego sygnału, tj. dla częstotliwości zdefiniowanych przez standard DTMF. Efektem działania aplikacji będzie kod znaku wciśniętego klawisza DTMF odświeżany w czasie rzeczywistym w okienku „Watch” z wykorzystaniem odpowiednio skonfigurowanych opcji „Breakpoints”. Zaliczenie tego etapu ćwiczenia będzie polegać na prezentacji prowadzącemu zajęcia działania, dyskusji z prowadzącym oraz przekazania projektu w formie elektronicznej.

## Drugi etap

Drugi etap realizacji ćwiczenia „Dekodowanie sygnału DTMF” polega na dodatkowym testowaniu drugich harmonicznych ośmiu składowych badanych w pkt. 2 (w pierwszym etapie) w celu wyeliminowania błędów dekodowania sygnału DTMF spowodowanych sygnałem akustycznym 
(mowa, muzyka, hałas, itp.). Zaliczenie tego etapu ćwiczenia będzie polegać na prezentacji prowadzącemu zajęcia działania aplikacji, dyskusji z prowadzącym oraz przekazania projektu w formie elektronicznej.

Niestety tego nie udało mi się tej części wykonać.

## Projekt

Projekt został wykonany w trakcie zajęć z Aplikacji procesorów sygnałowych na Politechnice Wrocławskiej.

