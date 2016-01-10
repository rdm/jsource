NB. |. ------------------------------------------------------------------

(scheck |. $.x), (|. -: |.&.$.) x=:     _10+?    405$2
(scheck |. $.x), (|. -: |.&.$.) x=:     _10+?  3 4 5$21
(scheck |. $.x), (|. -: |.&.$.) x=:   o._10+?  3 4 5$21
(scheck |. $.x), (|. -: |.&.$.) x=:j./o._10+?2 3 4 5$21

(scheck |.y), (|.x) -: |.y=:(2;0    )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;1    )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;2    )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;0 1  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;0 2  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;1 0  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;1 2  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;2 0  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;2 1  )$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;0 1 2)$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;0 2 1)$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;1 0 2)$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;1 2 0)$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;2 0 1)$. x=:_2+?5 7 11$5
(scheck |.y), (|.x) -: |.y=:(2;2 1 0)$. x=:_2+?5 7 11$5

(scheck |."0 y), (|."0 x) -: |."0 y=:(2;a=:(>:?4)?4)$. x=: _2+?3 5 7 11$5
(scheck |."1 y), (|."1 x) -: |."1 y=:(2;a=:(>:?4)?4)$. x=: _2+?3 5 7 11$5
(scheck |."2 y), (|."2 x) -: |."2 y=:(2;a=:(>:?4)?4)$. x=: _2+?3 5 7 11$5
(scheck |."3 y), (|."3 x) -: |."3 y=:(2;a=:(>:?4)?4)$. x=: _2+?3 5 7 11$5

s=: 11 7 5
x=: _3+?s$5

(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;0    )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;1    )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;2    )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;0 1  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;0 2  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;1 0  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;1 2  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;2 0  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;2 1  )$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;0 1 2)$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;0 2 1)$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;1 0 2)$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;1 2 0)$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;2 0 1)$. x
(scheck r|.y), (r|.x) -: $.^:_1 (r=:((#r){.$y)-~r=:?((?4)$+:s))|.y=:(2;2 1 0)$. x

x=:_3+?7 5 4 3 2$5

f=: 3 : 0
 s=: $x
 r=: #s
 i=: ((#i){.s)-~i=:?(?1+r)$1+4*s
 a=: (?1+r)?r
 (i|.x) -: i|.(2;a)$.x
)

f"0 i.4 10

d=: (?7 5 11$3) * ?7 5 11 3$10
c=: ; (i.1+r) <"1@comb&.> r=: #s=: $d

f=: 4 : 0
 r=: x
 i=: _50+?((-r)}.s)$100
 (i|."(0,r) d) -: i|."(0,r) (2;y)$.d
)

'domain error' -: 3.4   |. etx $. i.2 3 4
'domain error' -: 3j4   |. etx $. i.2 3 4
'domain error' -: 3r4   |. etx $. i.2 3 4
'domain error' -: '345' |. etx $. i.2 3 4
'domain error' -: (<3 4)|. etx $. i.2 3 4

'length error' -: (i.4) |. etx $. i.2 3 4


4!:55 ;:'a f i r s x y'