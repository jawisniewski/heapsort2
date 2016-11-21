require 'simplecov'
SimpleCov.start
require './array'
require 'rspec'
RSpec.describe 'array.rb' do
  it 'Czy uruchamia sie metoda' do
    random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
    expect{random_names.heapsort!}.not_to raise_error
  end
    it 'Dodanie listy z bloku i sprawdzenie czy int' do
$i =0
      random_names = [1 ,3 ,5 ,5, 7,9, 0,22]
      while $i<random_names.length do
      expect(random_names[$i]).to be_a_kind_of Integer
          $i+=1
        end
      #puts random_names.heap_sort
    end
  it 'Sprawdzenie czy sortuje float' do
    $i =0
    random_names = [1.22 ,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12,22.23]
    while $i<random_names.length do
      expect(random_names[$i]).to be_a_kind_of Float
      $i+=1
    end
    random_names.heapsort!
    expect(  random_names).to  match([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23])

  end

  it 'Sprawdzenie czy sortuje napisy' do
    $i =0
    random_names = ["ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA ","KOTA"]
    while $i<random_names.length do
      expect(random_names[$i]).to be_a_kind_of String
      $i+=1
    end
    random_names.heapsort!
    expect(  random_names).to  match(["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA ", "STAREGO"])

  end

  it 'Sprawdzenie poprawnosci dzialania dla niepoprawnie posortowanej tablicy' do

      random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
      random_names.heapsort!

      expect( random_names).to  match([0 ,1,3 ,7,9,15,22,25])

    end
    it 'Sprawdzenie poprawnosci dzialania dla poprawnie posortowanej tablicy' do

      random_names = [0 ,1,3 ,7,9,15,22,25]
      random_names.heapsort!

      expect( random_names).to  match([0 ,1,3 ,7,9,15,22,25])

    end
  it 'Sprawdzenie najmiejszej wartosci' do
    random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
    random_names.heapsort!
    expect(random_names[0]).to eq(0)
    random_names[0]=5
    random_names.heapsort!
    expect(random_names[0]).to eq(1)
  end
  it 'Sprawdzenie czy sortuje napisy  dla niepoprawnie zapisanej tablicy' do
    $i =0

    random_names = ["ALA", "BO", "JOZEFA", "KOTA", "KOTKA","STAREGO", "MA", "MA"]

    random_names.heapsort!
    expect(  random_names).to  match(["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"])

  end
  it 'Sprawdzenie czy sortuje najmiejszy element ' do
    random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
    random_names.heapsort!
    expect(random_names[0]).to eq(0)

  end
  it 'Sprawdzenie czy sortuje najwiekszy element ' do
    random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
    random_names.heapsort!
    expect(random_names[7]).to eq(25)

  end
  it 'Sprawdzenie wielkosci tabeli przed i po sortowaniu' do
    random_names = [1 ,3 ,25 ,15, 7,9, 0,22]
    expect(random_names.size).to eq(8)
    random_names.heapsort!
    expect(random_names.size).to eq(8)

  end
  it 'Sprawdzenie czy sortuje napisy z pliku dla niepoprawnie zapisanej tablicy' do
    $i =0

    random_names = File.read("heap.txt")
    random_names= random_names.split( ',')
    while $i<random_names.length do
      expect(random_names[$i]).to be_a_kind_of String
      $i+=1
    end
    random_names.heapsort!
    expect(  random_names).to  match(["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"])

  end
  it 'Sprawdzenie czy sortuje napisy z pliku dla poprawnie zapisanej tablicy' do
    $i =0

    random_names = File.read("heap2.txt")
    random_names= random_names.split( ',')
    while $i<random_names.length do
      expect(random_names[$i]).to be_a_kind_of String
      $i+=1
    end
    random_names.heapsort!
    expect(  random_names).to  match(["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"])

  end

  it 'Sprawdzenie najmiejszej wartosci z pliku' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names.heapsort!
    expect(random_names[0]).to eq(2)
    random_names[0]=4
    random_names.heapsort!
    expect(random_names[0]).to eq(3)
  end
  it 'Sprawdzenie najwiekszej wartosci z pliku' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names.heapsort!
    expect(random_names[9]).to eq(1111)
    random_names[9]=4
    random_names.heapsort!
    expect(random_names[9]).to eq(123)
  end
  it 'Sertowanie pustej tablicy' do
    random_names = []

    expect{random_names.heapsort!}.not_to raise_error

  end
  it 'Sertowanie jednego elementu' do
    random_names = [1]

    expect{random_names.heapsort!}.not_to raise_error
    random_names.heapsort!
    expect(random_names[0]).to eq(1)

  end
  it 'Sortowanie float  + int ' do
    $i =0
    random_names = [1 ,3.33 ,5.21 ,5.22, 7,9.9, 12,22.23]

    random_names.heapsort!
    expect(  random_names).to  match([1, 3.33, 5.21, 5.22, 7, 9.9, 12, 22.23])

  end
  it 'Sortowanie float  + string jako string ' do
    $i =0
    random_names = ["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO","1" ,"3.33" ,"5.21" ,"5.22", "7","9.9", "12","22.23"]

    random_names.heapsort!
    expect(  random_names).to  match(["1", "12", "22.23", "3.33", "5.21", "5.22", "7", "9.9", "ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"])

  end
  it 'Sortowanie znakow specjalnych' do
    $i =0
    random_names = ["#", "!@#", "ZA", ";", "/", "1", "!", "@"]

   expect {random_names.heapsort!}.not_to raise_error
    expect(  random_names).to  match(["!", "!@#", "#", "/", "1", ";", "@", "ZA"])

  end

end