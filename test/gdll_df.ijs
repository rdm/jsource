NB. DLL call with d f declarations
NB. these will fail on builds with C_DF=0
NB. as cd on these platforms can not handle f results
NB. or d or f results

NB. tests were roughly moved here from original gdll
NB. there are tests here that could and should be moved back to gdll
NB. e.g. test with dec of d *d *d would work on raspberry
 
load'dll'

lib=: LIBTSDLL

dcd=: 4 : '(lib,x) cd y'

NB. d and *d results and *d arg
(6.6;3;1.1 2.2 3.3;,6.6)= 'dipdpd d i *d *d' dcd 3;1.1 2.2 3.3;,1.1
(6.6;3;(,.1.1 2.2 3.3);,.6.6)= 'dipdpd d i *d *d' dcd 3;(,.1.1 2.2 3.3);,.1.1

NB. f and *f results and *f arg - convert in place
NB. 1.5 2.4 3.5 doubles convert exactly to floats
(7.5;3;1.5 2.5 3.5;,7.5)= 'fipfpf f i *f *f' dcd 3;1.5 2.5 3.5;,1.1
(7.5;3;(,.1.5 2.5 3.5);,.7.5)= 'fipfpf f i *f *f' dcd 3;(,.1.5 2.5 3.5);,.1.1
(7.5;3;(1 fc 1.5 2.5 3.5);,7.5)= 'fipfpf f i *f *f' dcd 3;(1 fc 1.5 2.5 3.5);,1.1 NB. shorts in chars
(7.5;3;(,.1 fc 1.5 2.5 3.5);,.7.5)= 'fipfpf f i *f *f' dcd 3;(,.(1 fc 1.5 2.5 3.5));,.1.1 NB. shorts in chars

NB. verify that double to float loses bits
6.6~:         0{::'fipfpf f i *f *f' dcd 3;1.1 2.2 3.3;,1.1

NB. alternate (__cdecl) calling convention
(24;23) -: 'altinci + i i'  dcd 23

NB. *j
(1.6;a)= 'complex d i *j' dcd a=.0;,1.6j2.7
(2.7;a)= 'complex d i *j' dcd a=.1;,1.6j2.7

NB. test f and d results and scalars
(<1.5)= 'f f' dcd ''
(<1.5)= 'd d' dcd ''
(3.3;1.1;2.2    )= 'ddd d d d' dcd 1.1;2.2
(6.6;1.1;2.2;3.3)= 'dddd d d d d' dcd 1.1;2.2;3.3
(4;1.5;2.5)= 'fff f f f' dcd 1.5;2.5
z=:'fd d f d f d *f *d' dcd 1.1;1.2;1.3;1.4;(6.6,6.6);7.7,7.7
(1.1;1.2;1.3;1.4;1.2 1.4)= 1 2 3 4 6{z
0.00001>5.0 1.1 1.3-;0 5{z

(+/>yy)=>{.'dx0 d x d'       dcd yy=:12;12.5
(+/>yy)=>{.'dx1 d d x'       dcd yy=:12.5;12
(+/>yy)=>{.'dx2 d x d x'     dcd yy=:12;12.5;13
(+/>yy)=>{.'dx3 d d x d'     dcd yy=:12.5;12;13.6
(+/>yy)=>{.'dx4 d x d x d'   dcd yy=:12;12.5;13;15.4
(+/>yy)=>{.'dx5 d d x d x'   dcd yy=:12.5;12;13.6;7
(+/>yy)=>{.'dx6 d x d x d x' dcd yy=:12;12.5;13;15.4;9
(+/>yy)=>{.'dx7 d d x d x d' dcd yy=:12.5;12;13.6;7;23.7

td=: 16$'d '
(  +/>yy)=>{.z=:('d1 d ',td) dcd yy=:<"0 [ 1.3*?8#10
(<.+/>yy)=>{.z=:('d2 x ',td) dcd yy=:<"0 [ 1.3*?8#10

td1a=: 18$'d '

3 : 0''
try.
 (+/>yy)=>{.z=:('d1a d ',td1a) dcd yy=:<"0 [ 1.3*?9#10
catch.
 7 0-:cder'' NB. failure with too many float/double args allowed
end.
)

td3=: 32$'d x '
(+/>yy)=>{.z=:('d3 d ',td3) dcd yy=:16$12.3;4
td4=: 32$'d i '
(+/>yy)=>{.z=:('d4 d ',td4) dcd yy=:16$12.3;4

xx=:'d5 d d i d i d i d *d *f *x *i'
(+/;yy)=>{.z=: xx dcd yy=:1.1;2;3.3;4;5.5;6;7.7;2.2 3.3;3.3 4.4;23 24;46 47 

tf=: 16$'f '
(<.+/>yy)=<.>{.z=:('f1 f ',tf ) dcd yy=:<"0 [ 1.375*?8#10
(<.+/>yy)=  >{.z=:('f2 x ',tf ) dcd yy=:<"0 [ 1.375*?8#10
tf3=: 32$'f x '
(<.+/>yy)=<.>{.z=:('f3 f ',tf3) dcd yy=:16$12.3;4

NB. test scalar boolean and integer promotion to double
(0;0;0)='ddd d d d' dcd 0;0
(2;1;1)='ddd d d d' dcd 1;1
(5;2;3)='ddd d d d' dcd 2;3
8=3!:0 >'ddd d d d' dcd 2;3

NB. test scalar boolean and integer promotion to float (double then downconverted)
(0;0;0)='fff f f f' dcd 0;0
(2;1;1)='fff f f f' dcd 1;1
(5;2;3)='fff f f f' dcd 2;3
8=3!:0 >'fff f f f' dcd 2;3

NB. test boolean and integer lists promoted to double
'v0 v1 v2 v3 v4 v5'=.(2.2-2.2)+i.6 NB. this works
'v0 v1 v2 v3 v4 v5'=.i.6
(6;0;1;2;3;0 2 4;1 3 5)-:'fd d f d f d *f *d' dcd v0;v1;v2;v3;(3$v4);3$v5

(+/"1 x)  -: 'ddd > d d d'    dcd x=: 17 2 ?@$ 0
(+/"1 x)  -: 'ddd > d d d'    dcd <"0 x
(+/"1 x)  -: 'ddd > d d d'    dcd x=: 17 2 ?@$ 2
(+/"1 x)  -: 'ddd > d d d'    dcd <"0 x
(+/"1 x)  -: 'ddd > d d d'    dcd x=: 17 2 ?@$ 100
(+/"1 x)  -: 'ddd > d d d'    dcd <"0 x
(+/"1 x)  -: 'ddd > d d d'    dcd x=: (-~0j5)+17 2 ?@$ 0
(+/"1 x)  -: 'ddd > d d d'    dcd <"0 x

(+/"1 x)  -: 'fff > f f f'    dcd x=: 1024 %~ 17 2 ?@$ 1e4
(+/"1 x)  -: 'fff > f f f'    dcd x=: 17 2 ?@$ 2
(+/"1 x)  -: 'fff > f f f'    dcd x=: 17 2 ?@$ 100
(+/"1 x)  -: 'fff > f f f'    dcd x=: (-~0j5)+1024 %~ 17 2 ?@$ 1e4

(+/"1 x) -: 'dx0 > d x d'       dcd x=: 7 2 ?@$ 9 0
(+/"1 x) -: 'dx1 > d d x'       dcd x=: 7 2 ?@$ 0 9
(+/"1 x) -: 'dx2 > d x d x'     dcd x=: 7 3 ?@$ 9 0 9
(+/"1 x) -: 'dx3 > d d x d'     dcd x=: 7 3 ?@$ 0 9 0
(+/"1 x) -: 'dx4 > d x d x d'   dcd x=: 7 4 ?@$ 9 0 9 0
(+/"1 x) -: 'dx5 > d d x d x'   dcd x=: 7 4 ?@$ 0 9 0 9
(+/"1 x) -: 'dx6 > d x d x d x' dcd x=: 7 5 ?@$ 9 0 9 0 9
(+/"1 x) -: 'dx7 > d d x d x d' dcd x=: 7 5 ?@$ 0 9 0 9 0


td=: 16$'d '
(+/"1 x)  -: ('d1 >d ',td) dcd x=: 17 8?@$ 0

(6 0 -: cder '') *. 'domain error' -: 'ddd > d d d' dcd etx 'ab'


NB. space usage

s0=: 7!:0 ''
s1=: 7!:0 ''
yy=: <"0 ] 8 ?.@$ 0
4!:55 ;:'yy'
xx=: lib,'f1 f ',16$'f '
9 = # xx 15!:0 <"0 ]8 ?@$ 0

s0=: 7!:0 ''
9 = # xx 15!:0 <"0 ]8 ?@$ 0
s1=: 7!:0 ''
s0 -: s1

s0=: 7!:0 ''
1 [ 100 (6!:2) 'xx 15!:0 <"0 ]8 ?@$ 0'
s1=: 7!:0 ''
s0 -: s1

s0=: 7!:0 ''
yy=: <"0 ] 8 ?.@$ 0
1 [ 100 (6!:2) 'xx 15!:0 yy'
yy -: <"0 ] 8 ?.@$ 0
4!:55 ;:'yy'
s1=: 7!:0 ''
s0 -: s1

NB. 1 procindex - 0 is objxxx and 1 is objddd
obj_add=:    <>{.'obj_add x' dcd ''
5    = >{.'objxxx x * x x' dcd obj_add;2;3
5.75 = >{.'objddd d * d d' dcd obj_add;2.5;3.25 
5    = >{.'1 0 x * x x'     cd obj_add;2;3
5.75 = >{.'1 1 d * d d'     cd obj_add;2.5;3.25

5    = >{.'1 0 x x x x'     cd (>obj_add);2;3
5    = >{.'1 0 x x x x'     cd (>obj_add),2 3
5    = >{.'1 0 x x x x'     cd (>obj_add),2 3+-~0.5

5.75 = >{.'1 1 d x d d'     cd (>obj_add);2.5;3.25
5.75 = >{.'1 1 d x d d'     cd (>obj_add),2.5 3.25
55   = >{.'1 1 d x d d'     cd (>obj_add),22 33

(2 0 -: cder '') *. 'domain error' -: '1 _10000 x * x x'  cd etx obj_add;2;3
(2 0 -: cder '') *. 'domain error' -: '1 1e2    x * x x'  cd etx obj_add;2;3
(2 0 -: cder '') *. 'domain error' -: '1 abc    x * x x'  cd etx obj_add;2;3
(2 0 -: cder '') *. 'domain error' -: '1 34aa   x * x x'  cd etx obj_add;2;3

(2 0 -: cder '') *. 'domain error' -: ('1 ',(>IF64{'2333444555';19$'93'),' x * x x')  cd etx obj_add;2;3

(5 1 -: cder '') *. 'domain error' -: '1 0      x *d x x' cd etx obj_add;2;3
(5 1 -: cder '') *. 'domain error' -: '1 0      x *x x x' cd etx obj_add;2;3
(5 1 -: cder '') *. 'domain error' -: '1 0      x d  x x' cd etx obj_add;2;3
(5 1 -: cder '') *. 'domain error' -: '1 0      x'        cd etx obj_add;2;3

(6 0 -: cder '') *. 'domain error' -: '1 0      x x  x x' cd etx obj_add   ;2  ;3
(6 0 -: cder '') *. 'domain error' -: '1 0      x *  x x' cd etx (>obj_add);2  ;3
(6 0 -: cder '') *. 'domain error' -: '1 0      x *  x x' cd etx (>obj_add),2   3
(6 1 -: cder '') *. 'domain error' -: '1 0      x *  x x' cd etx obj_add   ;'2';3
(6 2 -: cder '') *. 'domain error' -: '1 0      x *  x x' cd etx obj_add   ;2  ;'3'

4!:55 ;:'a add address b dcd f lib obj_add pc s0 s1 td td1a td3 td4 tf tf3'
4!:55 ;:'v0 v1 v2 v3 v4 v5 x xbasic_add xx yy z'

