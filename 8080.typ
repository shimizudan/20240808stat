#set page(
paper: "a4",
height: 297mm,
width: 210mm,
margin: (x: 1.5cm, y: 1.5cm),
)
 
#set par(
  justify: true,
  leading: 1em,
)
 
#set text(
  font: ("New Computer Modern","BIZ UDPMincho")
)
 
#set text(lang: "ja")
 
#set enum(numbering: "(1)",)
 
#import "@preview/colorful-boxes:1.2.0": *
 
#let my_block(back_color, frame_color, title_color, content_color, title, content) = {
  block(width:auto,radius: 4pt, stroke: back_color + 3pt)[
    #block(width: 100%,fill: back_color, inset: (x: 20pt, y: 5pt), below: 0pt)[#text(title_color,font: ("New Computer Modern","BIZ UDPMincho"))[#title]]
   #block(radius: (
    bottom: 3pt,
  ),width: 100%, fill: frame_color, inset: (x: 20pt, y: 10pt))[#text(content_color)[#content]]
  ]
}
 
#my_block(olive,rgb(95%, 100%, 95%) , white, black, [\@HirokazuOHSAWAさんからの期待値の問題], [番号 $1,2,3,dots$ の人が赤旗と白旗の両方を持って並んでいる。番号1の人は赤旗をあげる。また、番号 $n+1$ の人は番号 $n$ の人があげた旗を見て、 確率0.9で同じ色の旗をあげ、確率0.1で異なる色の旗をあげる（ $n=1,2,3,dots$ ） 。

このとき、番号  $1,2,3,dots,n$ の中で赤旗をあげた人の人数の期待値を求めよ（ $n=1,2,3,dots$ ） 。
  ])

#columns(2)[
- $n$ 番目の人が赤旗を上げる確率を $p_n$ とする。
- $p_1 = 1$ である。
- $p_(n+1) = 0.9p_n +0.1(1-p_n)$　（漸化式）
    $ therefore p_(n+1) =0.8p_n +0.1 $
    $ therefore p_(n+1)-0.5 =0.8(p_n -0.5) $
    $ therefore p_(n)-0.5 =0.8^(n-1)(p_1 -0.5)= 0.5 times 0.8^(n-1) $
    $ therefore p_(n) =0.5+ 0.5 times 0.8^(n-1) $
    
    
- $i$ 番目の人が上げる赤旗の数を $X_i$ とする。
    
    確率分布は

    #figure(
    table(
      align: center,
      columns: 4,
      stroke: none,
      $X_i$,table.vline() ,$0$,table.vline(), $1$ ,table.vline(), "total" ,
      table.hline(),
      $p$ , $1-p_i$ , $p_i$ , $1$ ,
    )
    )



- $X = X_1+X_2+dots+X_n$ として，

    $ E[X]&=E[X_1+X_2+dots+X_n]\
        &=E[X_1]+E[X_2]+dots+E[X_n]\
        &=p_1+p_2+dots+p_n\
        &=sum_(i=1)^n (0.5+0.5 times 0.8^(i-1))\
        &=0.5n +(0.5(1-0.8^n))/(1-0.8)\
        &=0.5n +2.5-2.5 times 0.8^n    $

     $ bold(E[X]=0.5n +2.5-2.5 times 0.8^n)   $


- $ mu =E[X]$ として，

  $ &"Var"[X] = E[X^2]-mu^2\
            &=E[(X_1+X_2+dots+X_n)^2]-mu^2\
            &=E[(X_1^2+X_2^2+dots+X_n^2+2 sum_(i<j) X_i X_j)] -mu^2\
            &=E[X_1^2]+E[X_2^2]+dots+E[X_n^2]+2 sum_(i<j)E[ X_i X_j] -mu^2\  $


#colbreak()

- $1 lt.equiv i lt.equiv n $


    #figure(
    table(
      align: center,
      columns: 4,
      stroke: none,
      $X_i\\X_i$,table.vline() ,$0$,table.vline(), $1$ ,table.vline(), "total" ,
      table.hline(),
      $0$ , $1-p_i$ , $0$ , $1-p_i$ ,
      table.hline(),
      $1$ , $0$ , $p_i $ , $p_i$ ,
      table.hline(),
      "total" , $1-p_i$ , $p_i$ , $1$ ,
    )
    )


    #figure(
    table(
      align: center,
      columns: 4,
      stroke: none,
      $X_i^2$,table.vline() ,$0$,table.vline(), $1$ ,table.vline(), "total" ,
      table.hline(),
      $p$ , $1-p_i$ , $p_i$ , $1$ ,
    )
    )


    $ therefore E[X_i^2 ] = p_i   $

- $1 lt.equiv i<j lt.equiv n $ 

    #block(
      fill: yellow,
      inset: 8pt,
      radius: 4pt,
          figure(
            table(
              align: center,
              columns: 4,
              stroke: none,
              $X_i X_j$,table.vline() ,$0$,table.vline(), $1$ ,table.vline(), "計" ,
              table.hline(),
              $0$ , $(1-p_i) times (1-p_(j-i+1))$ , $(1-p_i) times (1-p_(j-i+1))$ , $1-p_i$ ,
              table.hline(),
              $1$ , $p_i times (1-p_(j-i+1))$ , $p_i times p_(j-i+1)$ , $p_i$ ,
              table.hline(),
              "計" , $1-p_(j-i+1)$ , $p_(j-i+1)$ , $1$ ,
            )
            )

      )

    #block(
      fill: yellow,
      inset: 8pt,
      radius: 4pt,
    figure(
    table(
      align: center,
      columns: 4,
      stroke: none,
      $X_i X_j$,table.vline() ,$0$,table.vline(), $1$ ,table.vline(), "total" ,
      table.hline(),
      $p$ , $1-p_i p_(j-i+1)$ , $p_i p_(j-i+1)$ , $1$ ,
    )
    )
    )

    #block(
      fill: yellow,
      inset: 8pt,
      radius: 4pt,

    $ therefore E[X_i X_j ] = p_i p_(j-i+1)   $


    )

   #block(
      fill: yellow,
      inset: 8pt,
      radius: 4pt,
  $ "Var"[X] &=p_1 + p_2 +dots +p_n +2 sum_(i<j) p_i p_(j-i+1)  -mu^2\
  &= mu-mu^2+2 sum_(i<j) p_i p_(j-i+1)\
    $
   )

 #block(
      fill: yellow,
      inset: 8pt,
      radius: 4pt,
 $ bold("Var"[X]=mu-mu^2+2 sum_(i<j) p_i p_(j-i+1))   $
 )
    



#colbreak()


- `julia言語`のコードです。

- $n$ 人で旗を上げたときの赤旗上げた人数がアウトプットされます。

- 確率の部分は乱数を用います。

#block(
      fill: aqua,
      inset: 8pt,
      radius: 4pt,
```js
#n人の中で何人赤旗を上げたのかを調べる。
function sample(n)
    if n == 1
        1
    else
        p = 1
        θ = 0 # 赤なら0，白なら1
        r = [0,0,0,0,0,0,0,0,0,1]
        w = [1,1,1,1,1,1,1,1,1,0]
        for i = 2:n
            if θ == 0 
                t = rand(r)
                if t == 0
                    p += 1
                elseif t ==1
                    θ = 1
                end
            elseif θ == 1 
                t = rand(w)
                if t == 0
                    p += 1
                    θ = 0
                end
            end
        end
        return p
    end
end

```
)

#colbreak()

- 理論値は実装してあります。

#block(
      fill: aqua,
      inset: 8pt,
      radius: 4pt,
```js
using StatsPlots,Distributions

#理論値
q(n) =0.5+0.5*0.8^(n-1)
heikin(n) = sum(q(i) for i =1:n)
function bunsan(n) 
    k = 0
    for  i = 1:n-1 , j = i+1:n
        k += q(i)*q(j-i+1)
    end
    heikin(n)-heikin(n)^2+2*k
end

#標本
m = 10^5
n = 100
X =[sample(n) for _= 1:m]

@show mean(X);
@show heikin(n);
@show var(X,corrected=true);
@show bunsan(n);
```
)


#block(
      fill: lime,
      inset: 8pt,
      radius: 4pt,
```js
mean(X) = 52.52454
heikin(n) = 52.49999999949071
var(X, corrected = true) = 208.5671234596345
bunsan(n) = 208.7500000045893

```
)

- 理論値と標本からの結果が一致しますね。
]


#pagebreak()

- 大数の法則を見ておこう！



#block(
      fill: aqua,
      inset: 8pt,
      radius: 4pt,
```js
using StatsPlots,Distributions
m = 10^3
n = 100

X =[sample(n) for _= 1:m]
Z = [mean(X[i] for i =1:k) for k =1:m]

plot(Z,label="sample mean")
plot!(x->heikin(n),label="mean")

```
)

  #figure(
    image("2.png", width: 100%),
    caption: [
      大数の法則
    ],
  )


#pagebreak()

- 中心極限定理を見ておこう！



#block(
      fill: aqua,
      inset: 8pt,
      radius: 4pt,
```js
#中心極限定理も見ておこう！
#中心極限定理も見ておこう！
using StatsPlots,Distributions
m , n =10^5,100
A = [sample(n) for _=1:m]
B = [[i,count(x -> x==i ,A)] for i = 1:n]
C = [B[i][2]./m for i=1:n]

bar(C,label="sample")
@show mean(A)
@show std(A,corrected=false)

plot!(Normal(mean(A),std(A,corrected=false)),label="Normal")

```
)

  #figure(
    image("1.png", width: 100%),
    caption: [
      中心極限定理
    ],
  )