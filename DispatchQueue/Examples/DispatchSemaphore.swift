//
//  DispatchSemaphore.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct DispatchSemaphoreKidsIPadsExample: Executable {

    let serialQueue = DispatchQueue(label: "com.gcd.mySerialQueue", attributes: [])
    let semaphore = DispatchSemaphore(value: 1)

    class IPad {
        func play(player: String,
                  duration: TimeInterval,
                  sem: DispatchSemaphore) {
            sem.wait()
            print("\(player) закончил ожидание")
            print("\(player) играет в иПуд в течение \(duration) секунд")
            Thread.sleep(forTimeInterval: duration)
            sem.signal()
        }
    }

    func execute() {
        let iPad = IPad()
        DispatchQueue.global(qos: .userInteractive).async {
            print("Артемка - ждун")
            iPad.play(player: "Артемка", duration: 3, sem: semaphore)
            print("Артемка - закончил играть в иПуд")
        }
        DispatchQueue.global(qos: .userInteractive).async {
            print("Пашка - ждун")
            iPad.play(player: "Пашка", duration: 2.5, sem: semaphore)
            print("Пашка - закончил играть в иПуд")
        }
        DispatchQueue.global(qos: .userInteractive).async {
            print("Сашка - ждун")
            iPad.play(player: "Сашка", duration: 2.8, sem: semaphore)
            print("Сашка - закончил играть в иПуд")
        }
    }
}

struct DispatchSemaphoreSongsDownloading: Executable {
    
    let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 3)

    func execute() {
        let group = DispatchGroup()
        // Цикл
        for i in 0...14 {
            // Асинхронно вызываем задачу
            self.queue.async(group: group) {
                let songNumber = i + 1
                self.semaphore.wait()
                print("Скачиваем песню №", songNumber)
                WorkSimulator().simulateWork(number: i)
                print("Песня №", songNumber, " скачана")
                self.semaphore.signal()
            }

        }

        group.notify(queue: .main, execute: {
            print("Все песни скачаны!")
        })
    }
}
