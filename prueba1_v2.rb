# Contexto
# Se tiene un archivo con formato .csv que contiene nombres de alumnos con sus respectivas
# notas.
# El archivo tiene la siguiente estructura:
# David, 9, 2, 5, 1, 1
# Macarena, 10, 2, A, 8, 1
# Ignacio, 10, 10, 9, 9, A
# Rocio, 10, 10, 10, 10, 10

# Donde la A señala que el alumno estuvo ausente en la prueba.
# Crea un nuevo archivo alumnos.csv y pega el listado de alumnos y sus notas.
# Para leer el contenido de este archivo utilizaremos el siguiente método:
# def read_alum(file_name)
#     file = File.open(file_name, 'r')
#     alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
#     file.close
#     alum
# end
# Este método recibe como argumento el nombre del archivo y retorna un array con su
# contenido.

# Requerimientos:
# Crear un menú con 4 opciones con las siguientes funcionalidades:
# Opción 1: Imprimir en pantalla el nombre de cada alumno y el promedio de sus notas (30
# puntos)
# Utilizar el método de lectura facilitado.
# Opción 2: Imprimir en pantalla el nombre de cada alumno y la cantidad de inasistencias
# (30 puntos)
# Opción 3: Imprimir en pantalla los nombres de los alumnos aprobados (30 puntos)
# Crear un método que reciba -como argumento- la nota necesaria para aprobar. Por
# defecto esa nota debe ser 5.0
# Opción 4: Termina el programa (5 puntos)
# Se debe validar que la opción escogida sea 1, 2, 3 ó 4. (5 puntos)
# Si se ingresa cualquier otra opción el programa debe:
# Mostrar que la opción es inválida
# Mostrar nuevamente el menú
# Dar la posibilidad de que el usuario vuelva a ingresar una opción.

def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

def alumn_averages
    alumns = read_alum("alumnos.csv")
    alumns.each do |element|
        puts "\nAlumno #{element[0]}:"
        sum = 0
        element.each_with_index do |grade, index|
            sum += grade.to_i
            
        end
        div = sum/((element.length)-1).to_f
        
        puts "Promedio #{div}"
    end
end

def absence
    alumns = read_alum("alumnos.csv")
    hash_aux = {}
    alumns.each do |arr|
        sum = 0
        arr.each_with_index do |elem,index|
        aes = elem.count("A")
        sum += aes
          hash_aux[arr[0]]=sum
        end
    end
    absence_count = hash_aux.to_a
    absence_count.each do |abs|
        puts "Alumno #{abs[0]} presenta #{abs[1]} inasistencia/s"
    end    
end

def approved(grade)
    alumns = read_alum("alumnos.csv")
    alumns.each do |element|
        sum = 0
        element.each_with_index do |grade, index|
            sum += grade.to_i
        end
        div = sum/((element.length)-1).to_f
        if div >= grade
            puts "\nAlumno #{element[0]} ha sido aprobado!! :)"
        else
            puts "\nAlumno #{element[0]} ha sido reprobado :("
        end
    end
end
approved(5.0)
