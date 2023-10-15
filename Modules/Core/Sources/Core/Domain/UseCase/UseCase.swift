//
//  UseCase.swift
//  
//
//  Created by fadhlialfarisi on 13/10/23.
//

import Combine

public protocol UseCase {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
