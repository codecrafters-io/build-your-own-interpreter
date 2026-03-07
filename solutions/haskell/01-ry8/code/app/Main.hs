{-# OPTIONS_GHC -Wno-unused-top-binds #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import System.Environment (getArgs)
import System.Exit (exitWith, exitFailure, ExitCode(ExitSuccess))
import System.IO (hPutStrLn, hSetBuffering, stdout, stderr, BufferMode(NoBuffering), readFile)

main :: IO ()
main = do
    -- Disable output buffering
    hSetBuffering stdout NoBuffering
    hSetBuffering stderr NoBuffering

    args <- getArgs
    case args of
        (command : filename : _) ->
            if command /= "tokenize"
                then do
                    hPutStrLn stderr $ "Unknown command: " ++ command
                    exitFailure
                else do
                    fileContents <- readFile filename
                    if not (null fileContents)
                        then error "Scanner not implemented"
                        else putStrLn "EOF  null"  -- Placeholder, replace this line when implementing the scanner
                    pure ()
        _ -> do
            hPutStrLn stderr "Usage: ./your_program.sh tokenize <filename>"
            exitFailure
