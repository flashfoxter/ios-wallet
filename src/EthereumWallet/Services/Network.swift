//
//  Network.swift
//  EthereumWallet
//
//  Created by Vladimir Benkevich on 09/10/2018.
//  Copyright © 2018 devpool. All rights reserved.
//

import Foundation

struct Network: Codable, Equatable {

    static let infuraApiKey = "74d6c4da5ad64f609cf2eccd62a5d2c5"
    static let etherscanApiKey = "XFZIBYHKYPY7FRIZ6FZRC6EZCF9ESNX856"

    // TODO: get from plist
    static let all: [Network] = [
        Network(networkName: "mainnet",
                infuraUrl: URL(string: "https://mainnet.infura.io/v3")!,
                eherscanUrl: URL(string: "https://api.etherscan.io/api")!,
                chainId: 1),
        Network(networkName: "rinkeby",
                infuraUrl: URL(string: "https://rinkeby.infura.io/v3")!,
                eherscanUrl: URL(string: "https://rinkeby.etherscan.io/api")!,
                chainId: 4),
        Network(networkName: "ropsten",
                infuraUrl: URL(string: "https://ropsten.infura.io/v3")!,
                eherscanUrl: URL(string: "https://ropsten.etherscan.io/api")!,
                chainId: 3),
        Network(networkName: "kovan",
                infuraUrl: URL(string: "https://kovan.infura.io/v3")!,
                eherscanUrl: URL(string: "https://kovan.etherscan.io/api")!,
                chainId: 42)
    ]

    static private (set) var current: Network = UserDefaults.standard.value(forKey: LocalStorageKeys.selectedNetwork) ?? Network.all.first!

    let networkName: String

    fileprivate let infuraUrl: URL
    fileprivate let eherscanUrl: URL
    let chainId: Int64

    var jsonRpc: URL {
        return Network.current.infuraUrl.appendingPathComponent(Network.infuraApiKey)
    }

    var eherscan: URL {
        return Network.current.eherscanUrl
    }

    static func selectNetwork(network: Network) {
        current = network
        UserDefaults.standard.set(network, forKey: LocalStorageKeys.selectedNetwork)
        UserDefaults.standard.synchronize()
    }
}
