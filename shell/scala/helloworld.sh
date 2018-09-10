#!/bin/sh 
exec scala "$0" "$@" 
!# 
object Message { 
  def main(args: Array[String]) { 
    println("Hello, " + args(0) + ".....!!!!!") 
    println("Welcome to Scala Script.....!!!!!") 
    println("You are " + args(1)+ " years old." ) 
  } 
}
 
Message.main(args)