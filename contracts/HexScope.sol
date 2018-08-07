pragma solidity ^0.4.24;

contract HexScope {
    
    // hashing done offchain (any algo that generates bytes32)
    
    // setting owner of a link in bytes32 form

    mapping (bytes32 => address) public linkToOwner;
    
    mapping (bytes32 => mapping (address => bool)) public permittedAddresses;
    
    constructor(){}
    
    function claimLink(bytes32 link) public {
        // make sure the link doesn't already have an owner
        require(linkToOwner[link] == address(0));
        // set the owner
        linkToOwner[link] = msg.sender;
    }
    
    function setPermission(address user, bool permission, bytes32 link) public {
        // make sure the owner is setting the permission
        require(linkToOwner[link] == msg.sender);
        // set permission
        permittedAddresses[link][user] = permission;
    }
    
    function getPermission(address user, bytes32 link) public returns(bool) {
        return permittedAddresses[link][user];
    }
    
    function getOwner(bytes32 link) public returns(address) {
        return linkToOwner[link];
    }
    
}