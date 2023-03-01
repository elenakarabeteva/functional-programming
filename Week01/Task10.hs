main :: IO()
main = do
    print $ finalGrade 3 4 4 4.25 4.50 3.75 4.25 5 4.25 == 4.34
    print $ finalGrade 6 6 6 4.50 5 4.50 4.75 5 4.75    == 4.95
    print $ finalGrade 6 0 4 6 6 5 4.75 6 4.75          == 5.14
    print $ finalGrade 4.25 0 3 2 0 0 0 0 0             == 2
    print $ finalGrade 5.50 6 6 6 5.50 5.25 4 5.50 4    == 5.05
    print $ finalGrade 6 6 6 5.50 5.50 4 5 5.50 5       == 5.25
    print $ finalGrade 6 6 6 5.25 6 4 4 5.63 3.50       == 4.84

finalGrade :: Float -> Float -> Float -> Float -> Float -> Float -> Float -> Float -> Float -> Float
finalGrade d1 d2 d3 kz1 kz2 kt1 kt2 iz it
 | iz >= 3 && d >= 3 && finalGrade >= 3 = finalGrade
 | otherwise = 2
 where
    kz = (kz1 + kz2) / 2 
    kt = (kt1 + kt2) / 2
    d = (d1 + d2 + d3) /3
    o = ((d * 0.25 + 0.375 * kt + 0.375 * kz) / 2) + it * 0.25 + iz * 0.25
    finalGrade = (fromIntegral $ round $ o * 100) / 100


