module Main 

main : IO ()
main = do
  putStrLn $ "请输入第一个数字"
  x <- getLine
  putStrLn $ "请输入第二个数字"
  y <- getLine
  let z = cast x  + cast y

  putStrLn $ "两个数字之和为: " ++ (show z)