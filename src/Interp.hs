module Interp where

import Grammars

interp :: ASA -> Int
interp (Num n) = n
interp (Suma i d) = interp i + interp d
interp (Resta i d) = interp i - interp d
interp (Mult i d) = interp i * interp d
interp (Div i d) = let iv = (interp i)
                       dv = (interp d) in
    if dv /= 0 then (div iv dv)
               else error "División por cero"
