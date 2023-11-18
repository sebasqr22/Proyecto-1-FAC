# Criba de Erat�stenes
.data
  array:    .space 1000  # Array de tama�o n (en este caso 1000)
  n:        .word 1000   # Definir n como limite m�ximo para buscar primos

.text
  # Inicializar el array
  li t0, 0            # Definir el contador en cero
  la t1, array         # Cargar la direcci�n inicial del array
  la t2, n             # Cargar direccion de n en t2
  lw t2, 0(t2)         # Cargar valor de n en t2 
  
init_loop:
  bge t0, t2, end_init  # Si t0 >= t2, salir del ciclo
  sb zero, 0(t1)        # Colocar cero en la posici�n del array
  addi t0, t0, 1        # Incrementar el contador
  addi t1, t1, 1        # Moverse al siguiente elemento del array
  j init_loop           # Volver al inicio del ciclo

end_init:

  # Algoritmo de la criba
  li t0, 2             # Iniciar con el primer prime (2)
  
sieve_loop:
  bge t0, t2, end_sieve # Si t0 >= t2, salir del ciclo principal
  
  la t1, array          # Cargar la direcci�n del array a t1
  sll t3, t0, 1         # Multiplicar t0 por 2 (shift left por 1)
  add t1, t1, t3        # Mover al elemento correspondiente a t0 en el arreglo
mark_loop:
  sb zero, 0(t1)        # Marcar el elemento actual como 0 (no primo)
  addi t1, t1, t0        # Mover al siguiente m�ltiplo de t0 en el arreglo
  bge t1, t2, sieve_loop # Si t1 >= t2, salir del ciclo secundario
  j mark_loop           # Repetir el ciclo secundario
end_sieve:
  # Ahora, el arreglo contiene 0s en �ndices no primos y 1s en �ndices primos
  # Se puede agregar c�digo adicional para imprimir o utilizar los n�meros primos seg�n sea necesario