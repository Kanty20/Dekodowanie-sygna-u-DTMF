# Dekodowanie sygnału DTMF  /  DTMF signal decoding

## Spis treści 
- [Instalacja  /  Instalation](#instalacja)
- [Cel  /  Purpose](#cel)
- [Wprowadzenie  /  Introduction](#wprowadzenie)
- [Pierwszy etap  /  First Phase](#pierwszy_etap)
- [Drugi etap  /  Second Phase](#drugi_etap)
- [Projekt  /  Project](#projekt)

## Instalacja  /  Instalation
Aby zainstalować projekt należy go pobrać, żeby podpatrzeć kod wystarczy otworzyć sam main.c, najlepiej jednak mieć pobrany program Code Composer Studio.<br>
To install the project you need to download it, to preview the code just open main.c itself, but it is best to have Code Composer Studio downloaded.

## Cel  /  Purpose

Celem ćwiczenia „Analiza widma sygnału z graficzną wizualizacją” było przygotowanie i uruchomienie aplikacji w środowisku Code Composer Studio (CCS), której efektem było obliczanie widma sygnału z zastosowaniem metody okien czasowych, algorytmu FFT oraz z użyciem techniki uzupełniania zerami. Ćwiczenie kończyło się wyświetlaniem widma sygnału przy różnych założeniach szczegółowych, takich jak: typ okna czasowego, uzupełnianie zerami, skala liniowa lub logarytmiczna osi y, włączone lub wyłączone autoskalowanie osi y, skala unormowana osi x (numer próbki, numer prążka) lub skala jednostek bezwzględnym osi x (s, ms, Hz).

Celem ćwiczenia „Dekodowanie sygnału DTMF” jest dalsze przetwarzanie uzyskanego widma w celu uzyskania informacji szczegółowej dla danego zastosowania – w tym przypadku w celu wykrycia w sygnale prawidłowego sygnału DTMF i jego zdekodowania. Celem pracy samej aplikacji nie są więc wykresy obliczonego widma sygnału (są one jednak przydatne na etapie uruchamiania aplikacji), a jedynie kod znaku DTMF umieszczony w zmiennej typu char.

The purpose of the “Signal Spectrum Analysis with Graphical Visualization” exercise was to prepare and run an application in the Code Composer Studio (CCS) environment, which resulted in the calculation of a signal spectrum using the time window method, the FFT algorithm and using the zero-complement technique. The exercise culminated in the display of the signal spectrum under various specific assumptions, such as the type of time window, zero-complementation, y-axis linear or logarithmic scale, y-axis autoscaling enabled or disabled, x-axis normalized scale (sample number, bar number) or x-axis absolute unit scale (s, ms, Hz).

The purpose of the “DTMF signal decoding” exercise is to further process the obtained spectrum in order to obtain application-specific information - in this case, to detect the correct DTMF signal in the signal and decode it. The purpose of the application itself, therefore, is not to plot the calculated spectrum of the signal (however, they are useful at the application startup stage), but only the DTMF character code placed in a variable of char type.

## Wprowadzenie  /  Introduction

Należy zwrócić uwagę na następujące kwestie szczegółowe- Sygnał DTMF (Dual Tone Multi-Frequency) jest sumą dwóch sinusoid – jednej z grupy Low Frequency, a drugiej z grupy High Frequency:

Note the following details- The DTMF (Dual Tone Multi-Frequency) signal is the sum of two sinusoids - one from the Low Frequency group and the other from the High Frequency group:

![image](https://github.com/Kanty20/Dekodowanie-sygna-u-DTMF/assets/62101090/5d675904-0d6d-4494-aa72-e9b582cc5f86)

W celu odsłuchania przykładowego sygnału dtmf, po wpisaniu w wyszukiwarce internetowej hasła „dtmf online generator” i wybraniu np. znalezionej strony internetowej https://onlinetonegenerator.com/dtmf.html, pojawi się możliwość generacji sygnału na głośniczku (w słuchawkach) przez wciśnięcie odpowiedniego przycisku na klawiaturze:

In order to listen to a sample dtmf signal, after typing “dtmf online generator” in the search engine and selecting, for example, the found website https://onlinetonegenerator.com/dtmf.html, you will be able to generate a signal on the speaker (in headphones) by pressing the corresponding button on the keyboard:

![image](https://github.com/Kanty20/Dekodowanie-sygna-u-DTMF/assets/62101090/064c5528-ff4c-4ebd-ab24-7778029dd1c2)

W systemie Android, do generacji sygnału dtmf można pobrać jedną z wielu darmowych aplikacji ze sklepu Play, np. „Simple DTMF”.Sygnał DTMF z wyjścia karty dźwiękowej komputera PC łączy się kablem z wtykami typu jack 3,5mm (są na wyposażeniu laboratorium, dostępne u prowadzącego) do wejścia przetwornika A/C na module BB AI. Należy przy tym koniecznie odłączyć od modułu kabel BNC łączący wejście modułu z używanym wcześniej generatorem. Generowany sygnał DTMF należy kontrolować na ekranie oscyloskopu w celu zapewnienia nieprzesterowania przetwornika A/C, którego zakres pracy wynosi ok. ± 1,5 V. Zaleca się nieprzekraczanie połowy zakresu pracy przetwornika A/C.

On Android, for dtmf signal generation you can download one of the many free applications from the Play store, such as “Simple DTMF”.The DTMF signal from the output of the PC sound card is connected via a cable with 3.5mm jack connectors (they are on the lab equipment, available from the instructor) to the input of the A/D converter on the BB AI module. When doing so, it is essential to disconnect from the module the BNC cable connecting the module input to the generator used earlier. The generated DTMF signal should be monitored on the oscilloscope screen to ensure that the A/D converter, whose operating range is about ± 1.5 V, is not overdriven. It is recommended not to exceed half of the working range of the A/D converter.

## Pierwszy etap

Pierwszy etap realizacji ćwiczenia „Dekodowanie sygnału DTMF” polega na testowaniu ośmiu punktów widma amplitudowego sygnału, tj. dla częstotliwości zdefiniowanych przez standard DTMF. Efektem działania aplikacji będzie kod znaku wciśniętego klawisza DTMF odświeżany w czasie rzeczywistym w okienku „Watch” z wykorzystaniem odpowiednio skonfigurowanych opcji „Breakpoints”. Zaliczenie tego etapu ćwiczenia będzie polegać na prezentacji prowadzącemu zajęcia działania, dyskusji z prowadzącym oraz przekazania projektu w formie elektronicznej.

## Drugi etap

Drugi etap realizacji ćwiczenia „Dekodowanie sygnału DTMF” polega na dodatkowym testowaniu drugich harmonicznych ośmiu składowych badanych w pkt. 2 (w pierwszym etapie) w celu wyeliminowania błędów dekodowania sygnału DTMF spowodowanych sygnałem akustycznym 
(mowa, muzyka, hałas, itp.). Zaliczenie tego etapu ćwiczenia będzie polegać na prezentacji prowadzącemu zajęcia działania aplikacji, dyskusji z prowadzącym oraz przekazania projektu w formie elektronicznej.

Niestety tego nie udało mi się tej części wykonać.

## Projekt

Projekt został wykonany w trakcie zajęć z Aplikacji procesorów sygnałowych na Politechnice Wrocławskiej.

