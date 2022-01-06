//
//  Executables.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

enum Examples {

    case serialSync
    case serialAsync
    case concurrentSync
    case concurrentAsync
    case disGroupBad
    case disGroupGood
    case disSemaphoreKids
    case disSemaphoreSongs
    case threadUnsafe
    case threadUnsafeHC
    case threadUnsafeWithSem
    case threadSafe
    case sandbox

    var executable: Executable {
        switch self {
        case .serialSync: return SerialQueueSyncExample()
        case .serialAsync: return SerialQueueAsyncExample()
        case .concurrentSync: return ConcurrentQueueSyncExample()
        case .concurrentAsync: return ConcurrentQueueAsyncExample()
        case .disGroupBad: return DispatchGroupBadExample()
        case .disGroupGood: return DispatchGroupExample()
        case .disSemaphoreKids: return DispatchSemaphoreKidsIPadsExample()
        case .disSemaphoreSongs: return DispatchSemaphoreSongsDownloading()
        case .threadUnsafe: return ThreadUnsafeCollectionLightExample()
        case .threadUnsafeHC: return ThreadUnsafeCollectionHardcoreExample()
        case .threadUnsafeWithSem: return ThreadUnsafeWithSemaphoreExample()
        case .threadSafe: return ThreadSafeCollectionExample()
        case .sandbox: return ThreadCollectionSanbox()
        }
    }

    static func execute(_ example: Examples) {
        example.executable.execute()
    }
}
