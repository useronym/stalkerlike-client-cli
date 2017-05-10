{-# LANGUAGE DeriveGeneric #-}

module Data.TCP where
import GHC.Generics
import Data.Aeson
import Data.Entity


data Tile = Tile
  { tileType :: Char
  , tileMoves :: Int
  , tilePassable :: Bool
  , tileVision :: Bool
  }

type Terrain = [String]

data Event =
    EventLoginMOTD String
  | EventLoginSuccess
  | EventLoginFail String
  | EventFail String
  | EventLog String
  | EventTerrain Terrain
  | EventEntityAdd Entity
  | EventEntityRemove EntityId
  | EventPlayerId EntityId
    deriving (Generic, Show)


data Dir = Up | Down | Left | Right | UpLeft | UpRight | DownLeft | DownRight
  deriving (Eq, Generic, Show)

data Command =
    CommandLogin String String
  | CommandExit
  | CommandMove Dir
    deriving (Eq, Generic, Show)


instance FromJSON Event
instance ToJSON Event
instance FromJSON Dir
instance ToJSON Dir
instance FromJSON Command
instance ToJSON Command
