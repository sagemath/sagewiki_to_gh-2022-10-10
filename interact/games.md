= Sage Interactions - Games and Diversions =
goto [[interact|interact main page]]


<<TableOfContents>>

== Zeros ==

Have you ever wished you could count the number of zero digits in a long number like Rainman?

by William Stein and Sequoia Lefthand

{{attachment:zeros.png}}

{{{#!sagecell
import random

def init():
    global B,Br,n,round,tm,t,v
    B = 40
    Br = 15
    n = 1
    round = 0
    tm = 0
    t = walltime()
    
    
init()    

html("<h1 align=center>Zeros</h1>")
html("<h2 align=center><font color='blue'>How many zeros?</font></h2>")
    
@interact
def zeros(a=selector(buttons=True, nrows=1, values=['Reset'] + [1..B], default=1)):
    if a == 'Reset': 
        init()
    html("<center>")
    global B,Br,n,round,tm,t,v
    if a == n:
        if round > 0:
           html("<font size=+3 color='red'>RIGHT</font>")
        r = walltime() - t
        tm += r
        round += 1
        t = walltime()
        while True:
           n2 = random.randrange(1,Br)
           if n2 != n:
               n = n2
               break
        if Br < B:
            Br += 2
    elif round > 0:
        html("<font size=+2 color='blue'>Wrong. Try again...</font>")
    html("</center>")
    html("<font size=+%s color='#333'>"%random.randrange(-2,5))
    print  ' '*random.randrange(20) + '0'*n
    html("</font>")
    if round > 0:
        html("<br><br><center>Score: %s rounds, Average time: %.1f seconds</center>"%(
                 round, float(tm)/round))
}}}

== Queens on board ==
An interaction to play with the problem of placing eight queens on a board so that they do not threaten each other. This interaction exemplifies the use of persistent data, and the auto_update=False option coded by mhansen and included in sage 3.3.
by Pablo Angulo
{{{#!sagecell
queens=[]
opciones=['Clean board', 'Add queen', 'Remove queen' ]

@interact
def _(queen=input_box(default=(0,0)), opcion=selector(opciones, buttons=True), auto_update=False ):
    global queens
    if opcion=='Clean board':
        queens=[]
    elif opcion=='Add queen':
        if queen not in queens:
            queens.append(queen)
    else:
        if queen in queens:
            queens.remove(queen)
        
    board=matrix(ZZ,8,8)
    for x in range(8):
        for y in range(8):
            board[x,y]=(x+y)%2*7
    for x,y in queens:
        for i in range(8):
            if i!=y:  board[x,i]=1+(x+i)%2*5
            if i!=x:  board[i,y]=1+(i+y)%2*5
        for i in range(-min(x,y),min(8-x,8-y)):
            if i!=0: board[x+i,y+i]=1+(x+y)%2*5
        for i in range(max(-x,y-7),min(8-x,y+1)):
            if i!=0: board[x+i,y-i]=1+(x+y)%2*5
    for x,y in queens:
        if ( board[x,y]==1 or board[x,y]==6 ):
            print('Queen at (%d,%d) is threatened by another queen' % (x, y))
            board[x,y]=4  
        else:
            board[x,y]=3
    show(matrix_plot(board, cmap='Oranges' ))    
}}}
{{attachment:queens.png}}

== Nim ==
Play nim against a perfect opponent. This interaction exemplifies the use of persistent data, and the auto_update=False option coded by mhansen and included in sage 3.3.
by Pablo Angulo
{{{#!sagecell
#El juego del nim
def game_repr(heap_sizes):
    return '\n'.join('%d:'%i+'*'*n for i,n in enumerate(heap_sizes))
def bitlist2number(bitlist):
    return int('0'+''.join([str(bit) for bit in reversed(bitlist)]),2)
def move_nim(heap_sizes):
    '''Given a nim game, returns the next move (heap and amount)
    '''
    all_digits=[n.bits() for n in heap_sizes]
    N=max(len(l) for l in all_digits)
    digi=[0]*N
    for l in all_digits:
        for i in range(len(l)):
            digi[i]+=l[i]
    digi2=[digi[i]%2 for i in range(len(digi))]
    if max(digi2)==0:raise Exception("I cannot win!")
    maxInd=max(i for i in range(N) if digi2[i])
    
    heap=min(i for i in range(len(heap_sizes)) if len(all_digits[i])>maxInd and all_digits[i][maxInd]>0)
    localbits=heap_sizes[heap].bits()[0:maxInd]
    globalbits=digi2[0:maxInd]
    correction=bitlist2number( [b2 if b2 and not b1 else 0 for b1,b2 in zip(localbits,globalbits)] ) - bitlist2number( [b2 if b2 and b1 else 0 for b1,b2 in zip(localbits,globalbits)] )
    amount=2^maxInd -correction
    return (heap,amount)

nim=[1,3,5,6]
@interact
def _(heap=selector(range(len(nim)), buttons=True),
      amount=selector(range(max(nim)+1), buttons=True),
      auto_update=False):
    global nim
    if max(nim)==0:
        print('You have lost')
        return
    else:
        print('Try to take the last item')
    if heap>=0 and 0<amount<=nim[heap]:
        print('Previous situation:')
        print(game_repr(nim))
        
        nim[heap]-=amount
        print('Your move:')
        print(game_repr(nim))
        if max(nim)==0:
            print('You win')
            return
        
        print('My move:')
        try:
            myheap, myamount = move_nim(nim)
        except:
            #cannot win, choose arbitrarily
            myheap=min(heap_number for heap_number, heap_size in enumerate(nim) if heap_size > 0)
            myamount=1
        nim[myheap]-=myamount
        print(game_repr(nim))
        if max(nim)==0:
            print('I win')
        else:
            print('Please move again')
    else:
        print('Choose a heap and the amount to substract from that heap')
        print(game_repr(nim))
}}}
{{attachment:nim.png}}
