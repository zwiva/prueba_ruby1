# Se tiene un archivo con formato .csv que contiene nombres de alumnos con sus respectivas notas.
# El archivo tiene la siguiente estructura:
# David, 9, 2, 5, 1, 1
# Macarena, 10, 2, A, 8, 1
# Ignacio, 10, 10, 9, 9, A
# Rocio, 10, 10, 10, 10, 10
# Donde la A señala que el alumno estuvo ausente en la prueba.

# Crea un nuevo archivo alumnos.csv y pega el listado de alumnos y sus notas.
# Para leer el contenido de este archivo utilizaremos el siguiente método:

def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

# Este método recibe como argumento el nombre del archivo y retorna un array con su contenido.

# Requerimientos:
# Crear un menú con 4 opciones con las siguientes funcionalidades:
# Opción 1: Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas (30 puntos). Utilizar el método de lectura facilitado.
# Opción 2: Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias (30 puntos)
# Opción 3: Imprimir en pantalla los nombres de los alumnos aprobados (30 puntos). Crear un método que reciba -como argumento- la nota necesaria para aprobar. Por defecto esa nota debe ser 5.0
# Opción 4: Termina el programa (5 puntos)

# Se debe validar que la opción escogida sea 1, 2, 3 ó 4. (5 puntos)
# Si se ingresa cualquier otra opción el programa debe:
# Mostrar que la opción es inválida
# Mostrar nuevamente el menú
# Dar la posibilidad de que el usuario vuelva a ingresar una opción.

def menu
    puts 'Ingresa el numero de la opcion que quieras escoger:'
    puts 'opcion 1: Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas'
    puts 'opción 2: Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias'
    puts 'opción 3: Imprimir en pantalla los nombres de los alumnos aprobados'
    puts 'opción 4: salir'
end
def method1 # Opción 1: Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas
    z = read_alum('alumnos.csv')
    z.each do |arr|
        ave = 0 
        arr.each_with_index do |val,ind|
            ave += val.to_f
        end
        p "#{arr[0]}: #{ave / ((arr.count)-1)}"
    end
end
def method2 #opción 2: Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias
    z = read_alum('alumnos.csv')
    z.each do |arr|
        abs = 0 
        arr.each_with_index do |val,ind|
            abs += 1 if val == 'A'
        end
        p "#{arr[0]}: #{abs} inasistencias"
    end
end
def method3(a_grade,grad=5) # opción 3: Imprimir en pantalla los nombres de los alumnos aprobados'
    z = read_alum('alumnos.csv')
    z.each do |arr|
        ave = 0
            arr.each_with_index do |val,ind|
                ave += val.to_f
            end
        average = (ave / ((arr.count)-1)) 
        if average > a_grade
            puts "#{arr[0]}: aprueba"
        # elsif
            # pending
        end
    end
end
option = 0
while option != 4
    menu
    option = gets.chomp.to_i
    if option == 1
        method1
    elsif option == 2
        method2
    elsif option == 3
        puts 'ingresa nota de aprobacion'
        grade = gets.chomp.to_f
        method3(grade)
    else
        puts 'ok, bye'
    end
end