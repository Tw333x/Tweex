//: Playground - noun: a place where people can play

// Deinitialization

import UIKit

class Bank {
   
    static var coinsInBank = 10_000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        
        coinsInBank -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left int the bank")

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left int the bank")

playerOne = nil
print("PlayerOne has left the game")
print("There are now \(Bank.coinsInBank) coins left int the bank")