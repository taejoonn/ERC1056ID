// SPDX-License-Identifier: MIT License

pragma solidity ^0.8.17;

interface IERC1056ID {


    event DIDOwnerChanged(
        address indexed identity,
        address owner,
        uint previousChange
    );

    event DIDDelegateChanged(
        address indexed identity,
        bytes32 delegateType,
        address delegate,
        uint validTo,
        uint previousChange
    );

    event DIDAttributeChanged(
        address indexed identity,
        bytes32 name,
        bytes value,
        uint validTo,
        uint previousChange
    );

    function identityOwner(address identity) external view returns(address);

    function changeOwner(address identity, address newOwner) external;

    function changeOwnerSigned(address identity, uint8 sigV, bytes32 sigR, bytes32 sigS, address newOwner) external;

    function validDelegate(address identity, bytes32 delegateType, address delegate) external view returns(bool);

    function addDelegate(address identity, bytes32 delegateType, address delegate, uint validity) external;

    function addDelegateSigned(address identity, uint8 sigV, bytes32 sigR, bytes32 sigS, bytes32 delegateType, address delegate, uint validity) external;

    function revokeDelegate(address identity, bytes32 delegateType, address delegate) external;

    function revokeDelegateSigned(address identity, uint8 sigV, bytes32 sigR, bytes32 sigS, bytes32 delegateType, address delegate) external;

    function setAttribute(address identity, bytes32 name, bytes calldata value, uint validity) external;

    function setAttributeSigned(address identity, uint8 sigV, bytes32 sigR, bytes32 sigS, bytes32 name, bytes calldata value, uint validity) external;

    function revokeAttribute(address identity, bytes32 name, bytes calldata value) external;

    function revokeAttributeSigned(address identity, uint8 sigV, bytes32 sigR, bytes32 sigS, bytes32 name, bytes calldata value) external;
}