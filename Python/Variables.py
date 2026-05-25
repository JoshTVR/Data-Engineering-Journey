# This are variables
x = 5
y = 'John'
print(x)
print(y)

# Acomulative values
x = 10
y = 5
z = 20

a, b, c = 10, 5, 20

print('This is x: ', x, 'This is y: ', y, 'This is z: ', z)
print('This is a: ', a, 'This is a: ', b, 'This is c: ', c)
    
my_var = 'Hello'
my_var_2 = 'World'

print(my_var, my_var_2, sep=' ')

# Lets say i want to actually use a type of variable without depending on the content I'm writting on

string_one = str(3)   # The output will be: '3'
int_one    = int(3)   # The output will be:  3
float_one  = float(3) # The output will be:  3.0

print('Cast variables: \n',
      string_one,
      int_one,
      float_one)

print('Cast variables with types: \n',
      type(string_one),
      type(int_one),
      type(float_one))
