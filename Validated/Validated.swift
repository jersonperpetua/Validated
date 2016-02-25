//
//  Validated.swift
//  Validated
//
//  Created by Benji Encz on 2/24/16.
//  Copyright © 2016 Benjamin Encz. All rights reserved.
//

protocol Validator {
    typealias WrappedType

    static func validate(value: WrappedType) -> Bool
}

struct Validated<WrapperType, T: Validator where T.WrappedType == WrapperType> {
    let value: WrapperType

    init?(_ wrapped: WrapperType) {
        if T.validate(wrapped) {
            self.value = wrapped
        } else {
            return nil
        }
    }
}

struct Validated2<
    WrapperType, T: Validator,
    F: Validator where T.WrappedType == WrapperType,
    F.WrappedType == WrapperType> {
        let value: WrapperType

        init?(_ string: WrapperType) {
            if T.validate(string) && F.validate(string) {
                self.value = string
            } else {
                return nil
            }
        }
}