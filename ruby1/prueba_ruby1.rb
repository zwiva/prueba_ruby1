def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

#----------------SECTOR-METODOS-----------------------
def corrige
    alum = read_alum('alumnos.csv')
    alum2 = alum.each do |arr|
            arr.each do |item|
                arr.delete("A") && arr.push("0")  if item == "A"            
        end    
    end 
end
def average #para calcular promedio
puts "--------------------------------------------"
puts "DETALLE DE PROMEDIOS:"
    arr = corrige #cambia las a por ceros para poder sumar los subarreglos
    arr.each do |item_line| #dentro del arreglo grande
        acc = 0 #acumulador para la suma
        item_line.each_with_index do |elem,index| #dentro del arreglo pequeño
            acc += elem.to_f if index != 0 #sumale al acumulador los elemento como flotantes si son distintos de cero
        end    
        puts "El promedio de #{item_line[0]} es #{acc/((item_line.length)-1)}"
    end
puts "--------------------------------------------"
end
def absent #para identificar inasistencias
    puts "--------------------------------------------"
    puts "INASISTENCIAS"
    arr = corrige
    arr.each do |item_line| #dentro del arreglo grande
        puts "Las inasistencias de #{item_line[0]} son : #{item_line.count("0")}" #cuenta las veces que es cero
    end
    puts "--------------------------------------------"
end
def approved (criteria = 5.0) #para identificar aprobados con criterio estatico de 5.0
    arr = corrige
    puts "--------------------------------------------"
    puts "APRUEBA, considerando criterio de aprobacion >= 5.0: "
    arr.each do |item_line|
        acc = 0 #acumulador para la suma para el promedio
        item_line.each_with_index do |elem,index| #dentro del arreglo pequeño
            acc += elem.to_f if index != 0 #suma los elementos para luego sacar promedio
        end
        averag = acc/((item_line.length)-1) #nuevo promedio
        puts "#{item_line[0]} ya que su promedio es #{averag}" if averag >= criteria 
    end
    puts "--------------------------------------------"
end
#---------------SECTOR-MENU-----------------------------
condition = 0
while condition != 4
    puts "\nEscribe\n 1 para ver DETALLE DE PROMEDIOS\n 2 para ver INASISTENCIAS\n 3 para ver los APROBADOS\n 4 SALIR"
    condition = gets.chomp.to_i
    case condition
    when 1 #saca promedio
        average
    when 2 #identifica ausentes
        absent     
    when 3 #identifica aprobados
        approved
    when 4 #termina programa
        puts "Adios"
    else
        puts "-----------------------------------"
        puts "opcion invalida, intenta nuevamente"
        puts "-----------------------------------"
    end 
end
