def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

#----------------SECTOR-METODOS-----------------------

def corrige
    #para corregir arreglo
end

def average
    #para calcular promedio
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
    puts "Elige una opcion entre 1 y 3, 4 para salir"
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