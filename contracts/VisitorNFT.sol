// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VistorNFT is ERC721URIStorage, Ownable {
    struct VisitorInfo {
        address visitor;
        string restaurant;
        uint256 rank;
        string URI;
    }
    
    address[] private _userList;
    uint256 private _tokenIdCounter;

    mapping(address => uint256) private _tokenIdByAddress;
    mapping(address => uint256[]) private _tokenIdsByOwnerAddress;
    mapping(uint256 => VisitorInfo) private _vistorInfoByTokenId;
    
    event TokenMinted(address indexed to, uint256 tokenId);
    event VisitorInfoRegistered(address indexed creator, string restaurant, uint256 rank, string URI, uint256 tokenId);
    event TokenURISet(uint256 tokenId, string indexed visitorURI);

    constructor() ERC721("VistorNFT", "VST") Ownable(msg.sender) ERC721URIStorage(){
    }

    function safeMint(address _to) public onlyOwner returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(_to, tokenId);
        _tokenIdCounter += 1;

        _userList.push(_to);
        _tokenIdByAddress[_to] = tokenId;

        emit TokenMinted(_to, tokenId);

        return tokenId;
    }

    function registerVisitorInfo(address _visitor, string memory _restaurant, uint256 _rank, string memory _URI, uint256 _tokenId) public onlyOwner {
        setTokenURI(_tokenId,_URI);
        VisitorInfo memory visitorInfo = VisitorInfo({
            visitor: _visitor,
            restaurant: _restaurant,
            rank: _rank,
            URI: _URI
        });

        _vistorInfoByTokenId[_tokenId] = visitorInfo;

        emit VisitorInfoRegistered(_visitor, _restaurant, _rank, _URI, _tokenId);
    }   

    function setTokenURI(uint256 _tokenId, string memory _tokenURI) onlyOwner public { //아무나 막 tokenURI를 바꾸면 안되기 때문
        _setTokenURI(_tokenId, _tokenURI);
    }

    // get functions
    function getUserList() public view onlyOwner returns (address[] memory) {
        return _userList;
    }

    function getTokenIdByAddress(address _address) public view returns (uint256) {
        return _tokenIdByAddress[_address];
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory){
        return(tokenURI(tokenId));
    }

    function getVistorInfoByTokenId(uint256 tokenId) public view returns (VisitorInfo memory) {
        return _vistorInfoByTokenId[tokenId];
    }
    

    // ETH를 받을 수 있도록 receive 함수 구현
    receive() external payable {}

}
