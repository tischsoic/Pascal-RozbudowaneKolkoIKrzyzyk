program RozbudowaneKolkoIKrzyzyk;

uses CRT, Drzewo, ListaPodwojnieWiazana;

type planszaT = array of array of integer;

////////////////////////////////////////////////////////////////////////////////
//Oznaczenia w tablicy zawierajacej stan gry:
//0 - pole puste; 1 - kolko; 2 - krzyzyk
////////////////////////////////////////////////////////////////////////////////

//Funkcja sprawdzajaca, cyz ktos wygral
//wymiaryP - wymiary planszy(obydwa sa takie same, wiec jedna zmienna);
//iloscW - ilosc wygrywajaca, czyli wymagana dlugosc ciagu takich zamych pol, by byla wygrana, minimalnie wynosi 2(!!!)
//Funkcja zwraca: 3 - gdy wystapi blad; 1,2 - w zaleznosci kto wygral, 0 - gdy sytuacja jest...
//...nierozstrzygnieta
function sprawdzP(plansza : planszaT; wymiaryP : integer; iloscW : integer) : integer;
var i1, i2, i3, flaga : integer;
begin
  //Zerujemy na wszelki wypadek:
  sprawdzP := 0;

  //Gdy ktorys z parametrow sie nie zgadza, jest absurdalny itp. zwracamy blad
  if (wymiaryP < iloscW) or (iloscW < 2) then
  begin
    sprawdzP := 3; Exit;
  end
  else
  begin
    //Najpierw sprawdzamy POZIOME rozlozenie
    //Przesowamy sie po wierszach:
    for i1 := 0 to wymiaryP - 1 do
    begin
      //W danym wierszu sprawdzamy po iloscW pozycji na raz
      for i2 := 0 to wymiaryP - iloscW do
      begin
        //Tak, by za pierwszym razem warunek w warunku if w petli for ponizej sie wykonal:
        sprawdzP := 4;

        //Calosc rozbijamy jeszcze na dwa sprawdzenia
        for i3 := i2 to i2 + iloscW - 2 do
        begin
          //Writeln('[', i1, ', ', i3, ']  = [', i1, ', ', i3 + 1, ']   i2: ', i2);
          if (plansza[i1, i3] = plansza[i1, i3 + 1]) then
          begin
            if sprawdzP <> 0 then sprawdzP := plansza[i1, i3];
            Writeln('\nsprawdzP ', sprawdzP);
          end else
            begin
              sprawdzP := 0;
            end;
        end;
        if sprawdzP <> 0 then Exit;
      end;
    end;
  end;

  //Nastepnie sprawdzamy PIONOWE rozlozenie
  for i1 := 0 to wymiaryP - 1 do
  begin
    for i2 := 0 to wymiaryP - iloscW do
    begin
      //Tak, by za pierwszym razem warunek w warunku if w petli for ponizej sie wykonal:
      sprawdzP := 4;

      for i3 := i2 to i2 + iloscW - 2 do
      begin
        //Writeln('i1, i2, i3, (i3 + 1): ', i1, i2, i3, i3 +1);
        //Write('i3: ', i3, '  i1: ', i1);
        if plansza[i3, i1] = plansza[i3 + 1, i1] then
        begin
          if sprawdzP <> 0 then sprawdzP := plansza[i3, i1];
          //Writeln('    sprawdzP ', sprawdzP);
        end else sprawdzP := 0;
      end;
      if sprawdzP <> 0 then Exit;
    end;
  end;

  //A na koncu UKOSNE rozlozenie
  //korzystamy z flagi, ktora mowi nam, kiedy przeszlismy juz przez glowna przekatna, a...
  //... tym samym i1
  flaga := 1;
  for i1 := 0 to 2 * (wymiaryP - iloscW) do
  begin
    //Gdy dochodzimy do najwiekszsej przekatnej zmieniamy flage:
    if i1 = 2 * (wymiaryP - iloscW) - 1 then flaga := -1;
    for i2 := 0 to (wymiaryP - iloscW) -  * flaga

  end;

end;

//Funkcja sprawdzajaca mozliwe ruchy - podaje jeden wedlug ustalonego schematu
//Schemat:
//W pierwszej kolejnosci sprawdzane sa pola w ktorych najblisze sasiedztwo - tj.
//stykajace sie pola - nie sa puste




//Funkcja do zarzadzania grafem




//Funkcja zmieniajaca stan planszy
function zmienP(plansza : planszaT; ruch : array of integer; ktoRuszyl : integer) : integer;
//var
begin
  plansza[ruch[0], ruch[1]] := ktoRuszyl;
end;

//Funkcja wypisujaca plansze
function wypiszP(plansza : planszaT; wymiar : integer) : integer;
var i1, i2 : integer;
begin
  clrscr;
  for i1 := 0 to wymiar - 1 do
  begin
    for i2 := 0 to wymiar - 1 do
    begin
      if plansza[i1, i2] = 0 then Write('.   ')
        else if plansza[i1, i2] = 1 then Write('O   ')
          else Write('X   ');
    end;
    //Pzejscie do nowej lini:
    Writeln();
  end;
end;



//Zmienne globalne:
var
  //Wymiar planszy:
  n : integer;
  //Zmienna na przechowywanie dycyzji gracza o jego ruchu:
  ruch : array[0..1] of integer;
  //Korzen drzewa - globalnie bo nie chcemy po kazdym ruchu ktorego z graczy tworzyc go od nowa
  korzen : WezelP;
  //Tablica na przechowywanie stanu gry:
  plansza : planszaT;


begin
  Writeln('Jakis tekst');
  n := 4;
  Setlength(plansza, n, n);

  n := 6;



  while n <> 0 do
  begin
    Write('Podaj jaki ruch chcesz wykonac: ');
    Read(ruch[0], ruch[1]);
    zmienP(plansza, ruch, 1);
    wypiszP(plansza, 4);
    Writeln('Wygral ', SprawdzP(plansza, 4, 3));
    n := n - 1;
  end;
end.




















