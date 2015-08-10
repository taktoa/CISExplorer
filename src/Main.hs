module Main where

import Prelude.Unicode
import Control.Arrow.Unicode
import Text.XML.HXT.Core
import Text.XML.HXT.Curl
import System.Environment

type Year = Int

data Season = Fall | Winter | Spring | Summer

type Catalog = [Department]

data ContactInfo = ContactInfo
                   { name ∷ Maybe Text,
                     address ∷ Maybe Address,
                     email ∷ Maybe Email
                   }

data Department = Department
                  { id ∷ Text, -- department identifier (e.g. "AE")
                    name ∷ Text, -- department name (e.g. "Aerospace Engineering")
                    code ∷ (Text, Int) -- college code and
                                       -- department code respectively
                                       -- (e.g. ("KP", 1615))
                    unit ∷ Text, -- unit name (one level above department)
                    contact ∷ ContactInfo
                  }

data Term = Term
            { year ∷ Year,
              season ∷ Season,
              catalog ∷ Catalog
            }

main ∷ IO ()
main = do
  [src, dst] ← getArgs
  let read  = readDocument [withValidate yes, withCurl []] src
  let write = writeDocument [withIndent yes, withOutputEncoding isoLatin1] dst
  runX (read ⋙ write)
  return ()
