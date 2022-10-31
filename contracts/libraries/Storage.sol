// SPDX-License-Identifier: MIT License

pragma solidity ^0.8.17;

library Storage {
    struct StorageStruct {
        /*  
            The mapping of a address and name to it's value
            keccak256(address, name) - i.e. keccak256("0x12312412415", "email")

            Attributes:
                name
                email
                friend count

        */
        mapping(bytes32 => bytes) attribute;

        /*
            The mapping of a caller address and the lookup address to it's authorization. 
            Whether an address is authorized to access ID.
            keccak256(address, address)
        */
        mapping(bytes32 => bool) authorized;

        // The mapping of an address to array of friends
        mapping(address => address[]) friends;
    }
}