{-# LANGUAGE ViewPatterns, TemplateHaskell #-}
{-# language GeneralizedNewtypeDeriving,
            ViewPatterns,
    ScopedTypeVariables #-}

module Bad where

import Control.Applicative ((<$>))
import System.Directory (doesFileExist)

import qualified Data.Map as M
import      Data.Map    ((!), keys, Map)

data Point = Point { pointX, pointY :: Double , pointName :: String} deriving (Show)

data Foo a = Foo { a :: Int , a2 :: String
        -- ^ some haddock
      } | BarNone { b :: a } deriving (Eq, Show) deriving (ToJSON) via Bar Foo
