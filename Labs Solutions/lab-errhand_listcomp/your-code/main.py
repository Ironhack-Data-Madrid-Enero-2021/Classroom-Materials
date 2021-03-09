#!/usr/bin/env python
# coding: utf-8

# garcia.cobo.alberto@gmail.com


#Example: 

eggs = (1,3,8,3,2)

my_listComprehension = [1/egg for egg in eggs]

print(my_listComprehension)





# Insert here the module/library import statements 
import math





#1. Calculate the square number of the first 20 numbers. Use square as the name of the list.
# Remember to use list comprehensions and to print your results
square = [x*x for x in range(20)]
print(square)





#2. Calculate the first 50 power of two. Use power_of_two as the name of the list.
# Remember to use list comprehensions and to print your results
power_of_two = [2**x for x in range(50)]
print(power_of_two)





#3. Calculate the square root of the first 100 numbers. Use sqrt as the name of the list.
# You will probably need to install math library with pip and import it in this file.  
# Remember to use list comprehensions and to print your results
sqrt = [math.sqrt(x) for x in range(100)]
print(sqrt)





#4. Create this list [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0]. Use my_list as the name of the list.
# Remember to use list comprehensions and to print your results

'''
hay varias formas de hacer esto, otra forma alternativa sería:
my_list = [x for x in range(-10, 1, -1)]
'''
my_list = [x-10 for x in range(11)]
print(my_list)





#5. Find the odd numbers from 1-100. Use odds as the name of the list. 
# Remember to use list comprehensions and to print your results
odds = [x for x in range(1, 101) if x%2 != 0]
print(odds)





#6. Find all of the numbers from 1-1000 that are divisible by 7. Use divisible_by_seven as the name of the list.
# Remember to use list comprehensions and to print your results
divisible_by_seven = [x for x in range(1, 1001) if x%7 == 0]
print(divisible_by_seven)





#7. Remove all of the vowels in a string. Hint: make a list of the non-vowels. Use non_vowels as the name of the list.
# Remember to use list comprehensions and to print your results
# You can use the following test string but feel free to modify at your convenience
vowels = "aeiou"
teststring = 'Find all of the words in a string that are monosyllabic'
no_vowels = ''.join(c for c in teststring if c.lower() not in vowels)
print(no_vowels)





#8. Find the capital letters (and not white space) in the sentence 'The Quick Brown Fox Jumped Over The Lazy Dog'. 
# Use capital_letters as the name of the list.  
# Remember to use list comprehensions and to print your results

# isupper(), islower(), lower(), upper()

teststring = 'The Quick Brown Fox Jumped Over The Lazy Dog'
capital_letters = ''.join(c for c in teststring if c.isupper())
print(capital_letters)





#9. Find all the consonants in the sentence 'The quick brown fox jumped over the lazy dog'.
# Use consonants as the name of the list.
# Remember to use list comprehensions and to print your results.

'''
Seleccionaos los caracteres que son alfanuméricos y quitamos las vocales
'''
vowels = "aeiou"
teststring = 'The quick brown fox jumped over the lazy dog'
consonants = ''.join(ch for ch in teststring if (ch.isalpha() and ch.lower() not in vowels))
print(consonants)





#10. Find the folders you have in your madrid-oct-2018 local repo. Use files as name of the list.  
# You will probably need to import os library and some of its modules. You will need to make some online research.
# Remember to use list comprehensions and to print your results.

# mejorable: os.listdir if file isdir
import os

'''
path = "../../../" es para subir tres niveles en la jerarquía de carpetas. 
isdir() filtra por ficheros (directorios)
listdir() similar al comando de consola ls
'''

path = "../../../"
dirs = os.listdir(path)
files = [f for f in os.listdir(path) if os.path.isdir(os.path.join(path, f))]
print(files)





#11. Create 4 lists of 10 random numbers between 0 and 100 each. Use random_lists as the name of the list. 
#You will probably need to import random module
# Remember to use list comprehensions and to print your results

import random

res = [[random.randint(1,101) for _ in range(10)] for _ in range(4)]
print(res)





#12. Flatten the following list of lists. Use flatten_list as the name of the output.
# Remember to use list comprehensions and to print your results

list_of_lists = [[1,2,3],[4,5,6],[7,8,9]]

'''
Forma alternativa: 
import numpy as np
flatten_list = np.array(list_of_lists).flatten()
'''


flatten_list = [y for x in list_of_lists for y in x]
print(flatten_list)





#13. Convert the numbers of the following nested list to floats. Use floats as the name of the list. 
# Remember to use list comprehensions and to print your results.

list_of_lists = [['40', '20', '10', '30'], ['20', '20', '20', '20', '20', '30', '20'], ['30', '20', '30', '50', '10', '30', '20', '20', '20'], ['100', '100'], ['100', '100', '100', '100', '100'], ['100', '100', '100', '100']]

'''
Hay que preservar el formato de lista de listas, por eso anidamos
'''
floats = [[float(n) for n in lista] for lista in list_of_lists]
print(floats)





#14. Handle the exception thrown by the code below by using try and except blocks. 

try: 
    for i in ['a','b','c']:
        print(i**2)
except Exception as e: 
    print('Error: Operandos inválidos')





#15. Handle the exception thrown by the code below by using try and except blocks. 
#Then use a finally block to print 'All Done.'
# Check in provided resources the type of error you may use. 

x = 5
y = 0
try: 
    z = x/y
except ZeroDivisionError as e: 
    print('Error: División por cero da infinito')
finally: 
    print('All Done.')





#16. Handle the exception thrown by the code below by using try and except blocks. 
# Check in provided resources the type of error you may use. 

try: 
    abc=[10,20,20]
    print(abc[3])
except IndexError as e: 
    print('Error: Fuera de rango del elemento')
    





#17. Handle at least two kind of different exceptions when dividing a couple of numbers provided by the user. 
# Hint: take a look on python input function. 
# Check in provided resources the type of error you may use. 
input1 = input('Introduce un número: ')
input2 = input('Introduce otro número: ')

try: 
    a = float(input1)
    b = float(input2)
    z = a/b
except ValueError as e: 
    print('Error: Entrada inválida, se espera un número')
except ZeroDivisionError as e: 
    print('Error: División por cero')
else: 
    print(z)





#18. Handle the exception thrown by the code below by using try and except blocks. 
# Check in provided resources the type of error you may use. 

try: 
    f = open('testfile','r')
except IOError as e: 
    print('Error: Fallo de lectura de fichero')
    
try: 
    f.write('Test write this')
except NameError as e: 
    print('Error: variable f no existe')
except IOError as e: 
    print('Error: Fallo de escritura de fichero')





#19. Handle the exceptions that can be thrown by the code below using try and except blocks. 
#Hint: the file could not exist and the data could not be convertable to int


'''
line = f.readline() da un fallo de nombre, supongo que sería line = fp.readline() pero 
como lo que queremos es manejo de exceptiones lo dejo, el tabulado sí lo corrijo
para que no de un error de sintaxis
'''
try: 
    fp = open('myfile.txt')
    line = f.readline()
    i = int(s.strip())
except IOError as e: 
    print('Error: Fallo de lectura de fichero') 
except NameError as e: 
    print('Error: variable < s > no existe') 
except ValueError as e: 
    print('Error: Fallo en el valor') # int('123 123')





#20. The following function can only run on a Linux system. 
# The assert in this function will throw an exception if you call it on an operating system other than Linux. 
# Handle this exception using try and except blocks. 
# You will probably need to import sys 


import sys

def linux_interaction():
    try: 
        assert ('linux' in sys.platform), "Function can only run on Linux systems."
    except Exception as e: 
        print('Error: Sistema Operativo no válido')
    else: 
        print('Doing something.')
    finally: 
        print("end function")
        
linux_interaction()





# Bonus Questions:





# You will need to make some research on dictionary comprehension to solve the following questions

#21.  Write a function that asks for an integer and prints the square of it. 
# Hint: we need to continually keep checking until we get an integer.
# Use a while loop with a try,except, else block to account for incorrect inputs.

while True: 
    try: 
        x = int(input('Introduce un entero: '))
    except ValueError as e: 
        print('Error: Entrada inválida, se espera un número entero') 
    else: 
        print(x*x)
        break
        





# 22. Find all of the numbers from 1-1000 that are divisible by any single digit besides 1 (2-9). 
# Use results as the name of the list 

'''
otra solución alternativa
results2 = [x for x in range(1, 1001) if ((x%2 == 0) or (x%3 == 0) or (x%5==0) or (x==7))]
Lo convierto a set porque por ejemplo 12 es divisible entre 2, 2 y 3 y en la lista aparecería 2 veces. 
'''
results = set(x for x in range(1, 1001) for i in range(2, 10) if x%i == 0)
print(results)





# 23. Define a customised exception to handle not accepted values. 
# You have the following user inputs and the Num_of_sections can not be less than 2.
# Hint: Create a class derived from the pre-defined Exception class in Python

# https://stackoverflow.com/questions/1319615/proper-way-to-declare-custom-exceptions-in-modern-python

class ExceptionCustom(Exception):
    """ My personal exception """
    def __init__(self, message, errors='default'):
        super().__init__(message)
        self.errors = errors

while True: 
    try: 
        Total_Marks = int(input("Enter Total Marks Scored: ")) 
        Num_of_Sections = int(input("Enter Num of Sections: "))
        if Num_of_Sections < 2: 
            raise ExceptionCustom('Error Custom: Necesito más de dos números')
    except ValueError as e: 
        print('Error: Entrada inválida, se espera un número entero')
    except ExceptionCustom as e: 
        print('Error Custom: Num of Sections debe ser 2+') # print('Error Propio', e.data)
    else: 
        break
