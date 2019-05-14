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
puts "Detalle de promedios:"
    arr = corrige #cambia las a por ceros para poder sumar los subarreglos
    arr.each do |item_line| #dentro del arreglo grande
        acc = 0 #acumulador para la suma
        item_line.each_with_index do |elem,index| #dentro del arreglo pequeño
            acc += elem.to_f if index != 0 #sumale al acumulador los elemento como flotantes si son distintos de cero
        end    
        puts "\n El promedio de #{item_line[0]} es #{acc/((item_line.length)-1)}"
    end
puts "--------------------------------------------"

end

def absent
    #para identificar inasistencias
end

def approved
    #para identificar aprovados con criterio de 5.0
end

#---------------SECTOR-MENU-----------------------------

condition = 0
while condition != 4
    puts "\n Elige una opcion entre 1 y 3, 4 para salir"
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
        puts "opcion invalida, intenta nuevamente"
    end 
end