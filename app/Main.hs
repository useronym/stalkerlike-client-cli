module Main where
import Control.Concurrent
import GHC.IO.Handle
import Brick
import Brick.BChan
import Graphics.Vty

import UI.App
import TCP.Client
import Data.TCPEvent


main :: IO ()
main = do
  tcpChan <- newBChan 50
  (tcpHandle, tcpThread) <- startTCP tcpChan
  runUI tcpChan tcpHandle
  killThread tcpThread

runUI :: BChan TCPEvent -> Handle -> IO State
runUI chan handle = customMain
  (Graphics.Vty.mkVty Graphics.Vty.defaultConfig)
  (Just chan) app (initialState handle)