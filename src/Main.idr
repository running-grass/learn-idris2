module Main 

import DOM

%foreign "browser:lambda: x => console.log(x)"
prim__consoleLog : String -> PrimIO ()

consoleLog : HasIO io => String -> io ()
consoleLog x = primIO $ prim__consoleLog x

%foreign "browser:lambda: (a,i)=>setInterval(a,Number(i))"
prim__setInterval : PrimIO () -> Int -> PrimIO ()

setInterval : (HasIO io) => IO () -> Int -> io ()
setInterval a i = primIO $ prim__setInterval (toPrim a) i

data DomNode = MkNode AnyPtr

%foreign "browser:lambda: () => document.body"
prim__body : () -> PrimIO AnyPtr

body : HasIO io => io DomNode
body = map MkNode $ primIO $ prim__body ()

%foreign "browser:lambda: n=>(BigInt(n.width))"
prim__width : AnyPtr -> PrimIO Int

%foreign "browser:lambda: html => document.write(html)"
prim__write : String -> PrimIO ()

write : HasIO io => String -> io ()
write html = primIO $ prim__write html

width : HasIO io => DomNode -> io Int
width (MkNode p) = primIO $ prim__width p

main : IO ()
main = do
  write "Hello World!"
