def gcd(x,y):
    while y>0:
        x, y = y, x%y
    return x


x = int(input())
x_arr = list(map(int,input().split()))

A=1

for i in x_arr:
    A= A * i

y = int(input())
y_arr = list(map(int,input().split()))

B=1

for i in y_arr:
    B= B * i


answer = str(gcd(A,B))
print(answer[-9:])