//SPDX-Lice// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { INosql } from './interface/InoSql.sol';

import { console } from 'forge-std/console.sol';

contract Nosql is INosql {

    struct CollectionItem { 
        string key ; 
        string value ; 
    }

    string[] private collectionList;
    mapping (string => CollectionItem[]) private Document;

    // event DocumentAdded

    function compareString (string memory str1 , string memory str2 )internal pure returns (bool result){
        result = keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2)) ;
    }

    function addDocument (
        string memory collectionName ,
        string memory targetKey ,
        uint index ,
        string memory value
    ) external {
        if (index == 0 ){
            CollectionItem memory currentItem = CollectionItem(targetKey,value) ;
            Document[collectionName].push(currentItem) ; 
        }
    }    

    function updateDocumentForAllKeys (
        string memory colelctionName ,
        string memory targetKey ,
        string memory value
    ) external {
        CollectionItem[] storage Items = Document[colelctionName] ;
        for (uint i = 0 ; i < Items.length ; i++){
            if (compareString(Items[i].key,targetKey)){
                Items[i].value = value ;
            }
        }
    }

    function deleteDocumentByKey (
        string memory colelctionName ,
        string memory targetKey
    ) external {
        CollectionItem[] storage Items = Document[colelctionName] ; 
        for (uint i = 0 ; i < Items.length ; i++){
            if (compareString(Items[i].key,targetKey)){
                delete Items[i] ;
            }
        }
    }

    function logsAllDocument() external view {
        for (uint i = 0; i < collectionList.length; i++) {
            string memory collectionName = collectionList[i];
            console.log("Collection:", collectionName);
            CollectionItem[] storage items = Document[collectionName];
            for (uint j = 0; j < items.length; j++) {
                console.log("Key:", items[j].key, "Value:", items[j].value);
            }
        }
    }
}   